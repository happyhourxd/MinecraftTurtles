-- Check if GPS is available
hasGps = false
X, Y, Z = gps.locate()
if X ~= nil then
    hasGps = true
end

-- Set initial values
LOWESTY = -60
height = 0

-- User input for mine size
L = _G.arg[1]
W = _G.arg[2]
H = _G.arg[3]

L = tonumber(L)
W = tonumber(W)
H = tonumber(H)


-- Calculate needed fuel


-- Initialize direction variables
RightOrLeft = 1
direction = 0.5 -- in pi radians

-- Convert dimensions to numbers


-- Loop through each layer of the mine (height)
for i = 1, H do
    -- Loop through each row (width)
    for j = 1, W do
        -- Loop through each column (length)
        for k = 2, L do
            turtle.dig()
            turtle.forward()
        end        
        -- Handle turning and changing direction
        if j < W then
            if RightOrLeft == 0 then
                RightOrLeft = 1
                turtle.turnRight()
                turtle.dig()
                turtle.forward()
                turtle.turnRight()
                direction = direction - 1
            else
                RightOrLeft = 0
                turtle.turnLeft()
                turtle.dig()
                turtle.forward()
                turtle.turnLeft()
                direction = direction + 1
            end
        end
    end
    
    -- Move up a layer
    if i < H then
        turtle.digUp()
        turtle.up()
        height = height + 1
    end
    
    -- Turn around after completing a layer
    turtle.turnRight()
    turtle.turnRight()
    direction = direction + 1
end
