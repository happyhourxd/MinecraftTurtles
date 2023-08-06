os.loadAPI("json")

local packageJsonPath = "package.json"  -- Replace with the actual path to your package.json

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

-- Modify the version number in the Lua table
packageJsonData.version = "1.2.3"  -- Replace "1.2.3" with the desired version number

-- Encode the modified Lua table back to JSON string
local updatedJsonContent = json.encode(packageJsonData)

-- Write the updated JSON string back to the package.json file
local outFile = fs.open(packageJsonPath, "w")
outFile.write(updatedJsonContent)
outFile.close()
