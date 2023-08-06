os.loadAPI("json")
local treeData = json.decode(http.get(string.format("https://api.github.com/repos/happyhourxd/MinecraftTurtles/get/trees/main?recursive=1")).readAll())


for _, entry in ipairs(treeData.tree) do
    if entry.type == "blob" then
        -- Access the file path directly from entry.path
        local fileUrl = entry.url
        local fileResponse = http.get(fileUrl)
        if fileResponse then
            -- Combine the root folder with the entry.path
            local filePath = fs.combine("/", entry.path)
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