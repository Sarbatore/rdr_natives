function ToBool(val)
    local res = false

    if (val ~= 0 and val) then
        res = true
    end

    return res
end

function BoolToNumber(val)
    return val and 1 or 0
end