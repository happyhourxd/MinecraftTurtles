os.loadAPI("json")

local file = fs.open("package.json", "r")
local localDecodedData = json.decode(file.readAll())
file.close()


shell.run("rm package.json")
shell.run("wget https://raw.githubusercontent.com/happyhourxd/MinecraftTurtles/main/package.json")

local file = fs.open("package.json", "r")
local remoteDecodedData = json.decode(file.readAll())
file.close()

if (remoteDecodedData.version > localDecodedData.version) then
    shell.run("rm updater.lua")
    shell.run("wget https://raw.githubusercontent.com/happyhourxd/MinecraftTurtles/main/updater.lua")
    dofile(updater)
else
    print("your files are up to date!")
end
