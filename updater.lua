os.loadAPI("json")

local githubUsername = "happyhourxd"
local githubRepo = "MinecraftTurtles"
local githubBranch = "main"
local apiUrl = string.format("https://api.github.com/repos/%s/%s/git/trees/%s?recursive=1", githubUsername, githubRepo, githubBranch)

local response = http.get(apiUrl)
local jsonResponse = response.readAll()
response.close()
local treeData = json.decode(jsonResponse)

for _, entry in ipairs(treeData.tree) do
    if entry.type == "blob" then
        -- Access the file path directly from entry.path
        local filePath = fs.combine("/", entry.path)

        -- Delete the existing file if it exists
        if fs.exists(filePath) then
            fs.delete(filePath)
        end

        -- Download the new file content directly from the GitHub Raw URL
        _G.arg = {filePath}
        dofile("download.lua")
    end
end
