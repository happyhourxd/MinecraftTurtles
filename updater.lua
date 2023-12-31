if not fs.exists("json") then
    print("aquiring json formater...")
    shell.run("pastebin get 4nRg9CHU json")
end

os.loadAPI("json")

local githubUsername = "happyhourxd"
local githubRepo = "MinecraftTurtles"
local githubBranch = "main"
local apiUrl = string.format("https://api.github.com/repos/%s/%s/git/trees/%s?recursive=1", githubUsername, githubRepo, githubBranch)

local response = http.get(apiUrl)
local jsonResponse = response.readAll()
response.close()
local treeData = json.decode(jsonResponse)

function downloadFile(filePath)
    local response = http.get(string.format("https://raw.githubusercontent.com/happyhourxd/MinecraftTurtles/main/%s", filePath))
    if response then
        local fileContent = response.readAll()
        response.close()

        local file = fs.open(filePath, "w")
        file.write(fileContent)
        file.close()

        print("Downloaded:", filePath)
    else
        print("Error: Unable to download file:", filePath)
    end
end

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
        downloadFile(filePath)
    end
end