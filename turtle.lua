-- Load JSON library
local json = require("json")

-- Function to read the local package.json
local function readLocalPackage()
    local localFilePath = "path/to/local/package.json"
    local localFile = io.open(localFilePath, "r")

    if not localFile then
        return nil
    end

    local localContent = localFile:read("*a")
    localFile:close()

    return localContent
end

-- Read local package.json content or set to nil if not found
local localContent = readLocalPackage()

-- Parse local JSON content if the file was found
local localVersion
if localContent then
    local localPackageData = json.decode(localContent)
    localVersion = localPackageData.version
else
    print("Local package.json not found. Treating as outdated.")
    localVersion = "0.0.0"
end

-- Fetch and compare GitHub version
local http = require("http")

local githubUrl = "https://raw.githubusercontent.com/happyhourxd/minecraftTurtles/main/package.json"
local githubResponse = http.get(githubUrl)
if not githubResponse then
    error("Error: Unable to fetch GitHub package.json")
end

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
