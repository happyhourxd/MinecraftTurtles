os.loadAPI("json")

local file = fs.open("package.json", "r")
local localDecodedData = json.decode(file.readAll())
file.close()
delete(package.json)
http.get("https://raw.githubusercontent.com/happyhourxd/MinecraftTurtles/main/package.json")

local file = fs.open("package.json", "r")
local remoteDecodedData = json.decode(file.readAll())
file.close()

if (remoteDecodedData.version > localDecodedData.version) then
    print('updating...')
    local updaterPath = "updater.lua"

    if fs.exists(updaterPath) then
        fs.delete(updaterPath)
    end

    local response = http.get("https://raw.githubusercontent.com/happyhourxd/MinecraftTurtles/main/updater.lua")
    if response then
        local fileContent = response.readAll()
        response.close()


        local file = fs.open(updaterPath, "w")
        file.write(fileContent)
        file.close()

        dofile(updaterPath)
    end
else
    print("your files are up to date!")
end
