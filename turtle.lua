-- Load JSON library
local json = require("json")

-- Read local package.json
local localFile = io.open("package.json", "r")
local localContent = localFile:read("*a")
localFile:close()

-- Parse local JSON content
local localPackageData = json.decode(localContent)
local localVersion = localPackageData.version

-- Fetch and compare GitHub version
local http = require("http")

local githubUrl = "https://raw.githubusercontent.com/happyhourxd/minecraftTurtles/main/package.json"
local githubResponse = http.get(githubUrl)
local githubContent = githubResponse.readAll()
githubResponse.close()

local githubPackageData = json.decode(githubContent)
local githubVersion = githubPackageData.version

if githubVersion > localVersion then
    print("A new version is available! Please update.")
    -- Perform update actions, notify the user, or any other action you want.
else
    print("Your version is up to date.")
end
