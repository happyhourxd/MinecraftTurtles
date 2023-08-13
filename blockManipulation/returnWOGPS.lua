L = _G.arg[1]
W = _G.arg[2]
H = _G.arg[3]


-- Move back to the initial level
for i = 1, height do
    turtle.down()
end

if not (((W % 2) == 0) && ((H % 2) == 0)) then
    for i = 1, L, do
        turtle.forward()
    end
    turtle.turnLeft()
    for i = 1, W do
        turtle.forward()
    end
    turtle.turnLeft()
elseif ((W % 2) == 0) then
    turtle.turnLeft()
    for i = 1, L, do
        turtle.forwrad()
    end
    turtle.turnLeft()
end
