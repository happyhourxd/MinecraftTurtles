hasGps = false

X, Y, Z = gps.locate()

if not (X == nil) then
    hasGps = true
end

LOWESTY = -60

print("what size should i mine?")
L = read()
W = read()
H = read()

NeededFuel = (L * W * H) + L + W + H

RightOrLeft = 0

for i = 0,H,1
do    
    for j = 0,W,1
    do
        for k = 0,H,1
        do
            turtle.forward()
        end
        if not (j == W) then
            if (RightOrLeft == 0) then
                RightOrLeft = 1
                turtle.turnRight()
                turtle.forward()
                turtle.turnRight()
            else
                RightOrLeft = 0
                turtle.turnLeft()
                turtle.forward()
                turtle.turnLeft()
            end
        end
    end
    if not (i == H) then
        turtle.up()
    end
end
