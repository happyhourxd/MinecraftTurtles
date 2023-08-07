os.loadAPI("json")

local file = fs.open("package.json", "r")
local localDecodedData = json.decode(file.readAll())
file.close()
fs.delete("package.json")
_G.arg = {"package.json"}
dofile("download.lua")

local file = fs.open("package.json", "r")
local remoteDecodedData = json.decode(file.readAll())
file.close()

if (remoteDecodedData.version > localDecodedData.version) then
    print('updating...')
    _G.arg = {"updater.lua"}
    dofile("download.lua")
    dofile("updater.lua")
else
    print("your files are up to date!")
end


Isturtle = false

if(turtle.turnRight()) then
    Isturtle = true
    turtle.turnLeft()
    dofile("turtle.lua")
end
