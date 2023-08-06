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
    delete("updater.lua")
    http.get("https://raw.githubusercontent.com/happyhourxd/MinecraftTurtles/main/updater.lua")
    dofile("updater.lua")
else
    print("your files are up to date!")
end
