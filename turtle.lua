os.loadAPI("json")


-- Replace these with your GitHub repo information
local githubUsername = "happyhourxd"
local githubRepo = "minecraftTurtles"
local githubBranch = "main" -- or the branch you want to check

-- Function to read the local package.json file
local function readLocalPackageJson()
    local file = fs.open("package.json", "r")
    if file then
        local content = file.readAll()
        file.close()
        return content
    end
    return nil
end

-- Function to fetch the remote JSON file from GitHub
local function fetchRemoteJson()
    local url = string.format("https://raw.githubusercontent.com/%s/%s/%s/package.json",
                               githubUsername, githubRepo, githubBranch)
    local response = http.get(url)
    if response then
        local content = response.readAll()
        response.close()
        return content
    end
    return nil
end

-- Function to compare the local and remote JSON files
local function compareJsonFiles(localJson, remoteJson)
    -- Convert both JSON strings to Lua tables
    local localData = json.decode(localJson)
    local remoteData = json.decode(remoteJson)

    -- Compare the two tables (you may need to customize this based on your requirements)
    if localData and remoteData then
        if localData.version == remoteData.version then
            return true
        else
            return false
        end
    end

    return nil
end

-- Main function to check the JSON files
local function checkJsonFiles()
    local localJson = readLocalPackageJson()
    if not localJson then
        print("Error: Unable to read local package.json")
        return
    end

    local remoteJson = fetchRemoteJson()
    if not remoteJson then
        print("Error: Unable to fetch remote package.json from GitHub")
        return
    end

    local filesMatch = compareJsonFiles(localJson, remoteJson)

    if filesMatch == true then
        print("Local and remote JSON files match.")
        -- Perform actions if the files match
    elseif filesMatch == false then
        print("Local and remote JSON files do not match.")
        -- Perform actions if the files do not match
    else
        print("Error: Unable to compare JSON files.")
    end
end

-- Call the main function to check JSON files
checkJsonFiles()
