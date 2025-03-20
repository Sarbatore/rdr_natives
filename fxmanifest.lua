game "rdr3"
fx_version "adamant"
rdr3_warning "I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships."
lua54 "yes"

author "Sarbatore"
description "Natives discovered by community"

client_scripts {
	"@vorp_utils/shared/services/dataview.lua", -- Your dataview path
	"client/*.lua",
	"exports.lua",
}

escrow_ignore {
	"cl_examples.lua",
}