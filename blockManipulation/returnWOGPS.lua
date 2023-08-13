L = _G.arg[1]
W = _G.arg[2]
H = _G.arg[3]


-- Move back to the initial level
for i = 1, height do
    turtle.down()
end

-- If the initial width is odd and the turtle is not at the width of the length
if not ((W % 2) == 0) and not (j == W) then
    for j = 1, W - 1 do
        turtle.forward()
    end
    turtle.turnLeft()
    direction = direction - .5
end

-- If the direction is 0.5 or -1.5, turn right
if direction == 0.5 or direction == -1.5 then
    for i = 1, math.abs(direction % 0.5) do
        turtle.turnRight()
    end
end        
    -- Move back along the mine's length
for k = 1, L - 1 do
    turtle.forward()
end