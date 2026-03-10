import os
import re

# Dossier des fichiers lua
INPUT_DIR = "namespaces"
OUTPUT_LUA = "exports.lua"
OUTPUT_MD = "exports.md"

# Regex pour capturer les fonctions
# 1) function Name(params)
# 2) Name = function(params)
FUNC_REGEX = re.compile(
    r'(?:function\s+((?!N_)[A-Za-z_][A-Za-z0-9_]*)\s*\(([^)]*)\)|([A-Za-z_][A-Za-z0-9_]*)\s*=\s*function\s*\(([^)]*)\))'
    #r'(?:function\s+([A-Za-z_][A-Za-z0-9_]*)\s*\(([^)]*)\)|([A-Za-z_][A-Za-z0-9_]*)\s*=\s*function\s*\(([^)]*)\))'
)

namespaces = {}

# Parcours de tous les fichiers .lua
for filename in os.listdir(INPUT_DIR):
    if filename.endswith(".lua"):
        namespace = os.path.splitext(filename)[0].capitalize()
        filepath = os.path.join(INPUT_DIR, filename)

        with open(filepath, "r", encoding="utf-8") as f:
            content = f.read()

        functions = []
        # Parcours ligne par ligne pour vérifier si 'local' est présent
        for line_match in FUNC_REGEX.finditer(content):
            # Récupère la position du match dans le contenu
            match_start = line_match.start()
            # Trouve le début de la ligne
            line_start = content.rfind('\n', 0, match_start) + 1
            line_content = content[line_start:match_start]
            
            # Ignore si la ligne contient 'local' avant la fonction
            if 'local' in line_content:
                continue
                
            func_name = line_match.group(1) or line_match.group(3)
            params = line_match.group(2) or line_match.group(4) or ""
            params = params.strip()
            functions.append((func_name, params))

        if functions:
            # Trie les fonctions par ordre alphabétique
            namespaces[namespace] = sorted(functions, key=lambda x: x[0])

# ---------------------------
# Écriture du fichier exports.lua
# ---------------------------
with open(OUTPUT_LUA, "w", encoding="utf-8") as f:
    for ns in sorted(namespaces.keys()):
        f.write(f"-- {ns}\n")
        for func, _ in namespaces[ns]:
            f.write(f'exports("{func}", {func})\n')
        f.write("\n")

# ---------------------------
# Écriture du fichier exports.md
# ---------------------------
with open(OUTPUT_MD, "w", encoding="utf-8") as f:
    f.write("## References:\n\n")
    for ns in sorted(namespaces.keys()):
        f.write(f"## {ns}\n\n")
        f.write("| Function | Parameters |\n")
        f.write("|----------|------------|\n")
        for func, params in namespaces[ns]:
            f.write(f"| `{func}` | `{params}` |\n")
        f.write("\n")
