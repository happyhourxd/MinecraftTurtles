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


downloadFile(_G.arg[1])
