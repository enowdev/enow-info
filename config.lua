Config = {}

-- Default settings
Config.ServerName = {
    text = "Indonesia Indah Roleplay",
    enabled = true,
    position = {
        top = "20px",
        left = "50%"
    },
    style = {
        fontSize = "24px",
        textShadow = "0 0 10px #ffffff"
    }
}

Config.PlayerInfo = {
    enabled = true,
    position = {
        top = "20px",
        right = "20px"
    },
    style = {
        width = "180px",
        fontSize = "14px"
    }
}

-- Save configuration to file
function SaveConfig()
    local configFile = LoadResourceFile(GetCurrentResourceName(), "config.lua")
    if configFile then
        local newConfig = "Config = {\n"
        newConfig = newConfig .. "    ServerName = {\n"
        newConfig = newConfig .. string.format("        text = \"%s\",\n", Config.ServerName.text)
        newConfig = newConfig .. string.format("        enabled = %s,\n", tostring(Config.ServerName.enabled))
        newConfig = newConfig .. "        position = {\n"
        newConfig = newConfig .. string.format("            top = \"%s\",\n", Config.ServerName.position.top)
        newConfig = newConfig .. string.format("            left = \"%s\"\n", Config.ServerName.position.left)
        newConfig = newConfig .. "        },\n"
        newConfig = newConfig .. "        style = {\n"
        newConfig = newConfig .. string.format("            fontSize = \"%s\",\n", Config.ServerName.style.fontSize)
        newConfig = newConfig .. string.format("            textShadow = \"%s\"\n", Config.ServerName.style.textShadow)
        newConfig = newConfig .. "        }\n"
        newConfig = newConfig .. "    },\n"
        newConfig = newConfig .. "    PlayerInfo = {\n"
        newConfig = newConfig .. string.format("        enabled = %s,\n", tostring(Config.PlayerInfo.enabled))
        newConfig = newConfig .. "        position = {\n"
        newConfig = newConfig .. string.format("            top = \"%s\",\n", Config.PlayerInfo.position.top)
        newConfig = newConfig .. string.format("            right = \"%s\"\n", Config.PlayerInfo.position.right)
        newConfig = newConfig .. "        },\n"
        newConfig = newConfig .. "        style = {\n"
        newConfig = newConfig .. string.format("            width = \"%s\",\n", Config.PlayerInfo.style.width)
        newConfig = newConfig .. string.format("            fontSize = \"%s\"\n", Config.PlayerInfo.style.fontSize)
        newConfig = newConfig .. "        }\n"
        newConfig = newConfig .. "    }\n"
        newConfig = newConfig .. "}"
        
        SaveResourceFile(GetCurrentResourceName(), "config.lua", newConfig, -1)
        return true
    end
    return false
end 