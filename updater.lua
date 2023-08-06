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
        local fileUrl = string.format("https://raw.githubusercontent.com/%s/%s/%s/%s", githubUsername, githubRepo, githubBranch, entry.path)
        local fileResponse = http.get(fileUrl)

        if fileResponse then
            local fileContent = fileResponse.readAll()
            fileResponse.close()

            -- Write the downloaded content to the file
            local file = fs.open(filePath, "w")
            file.write(fileContent)
            file.close()

            print("Downloaded:", filePath)
        else
            print("Error: Unable to download file:", entry.path)
        end
    end
end
