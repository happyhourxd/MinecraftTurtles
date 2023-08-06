os.loadAPI("json")

local packageJsonPath = "package.json" 

-- Read the content of the package.json file into a Lua string
local file = fs.open(packageJsonPath, "r")
if not file then
    print("Error: Unable to open package.json")
    return
end

local packageJsonContent = file.readAll()
file.close()

-- Parse the JSON data into a Lua table
local packageJsonData = json.decode(packageJsonContent)

packageJsonData.version = "0.0.1"  -- the version number to downgrade to

-- Encode the modified Lua table back to JSON string
local updatedJsonContent = json.encode(packageJsonData)

-- Write the updated JSON string back to the package.json file
local outFile = fs.open(packageJsonPath, "w")
outFile.write(updatedJsonContent)
outFile.close()
