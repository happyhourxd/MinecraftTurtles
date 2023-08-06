os.loadAPI("json")

local apiUrl = string.format("https://api.github.com/repos/happyhourxd/MinecraftTurtles/git/trees/main?recursive=1")
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

        -- Download and write the new file content
        local fileUrl = entry.url
        local fileResponse = http.get(fileUrl)
        if fileResponse then
            local file = fs.open(filePath, "w")
            file.write(fileResponse.readAll())
            file.close()
            fileResponse.close()
            print("Downloaded:", filePath)
        else
            print("Error: Unable to download file:", entry.path)
        end
    end
end