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
direction = .5 -- in pi radians


print(L, " ", W, " ", H)

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
                direction - .5
            else
                RightOrLeft = 0
                turtle.turnLeft()
                turtle.forward()
                turtle.turnLeft()
                direction + .5
            end
        end
        if not ((W % 2) && (j == W)) then
            print(direction, "this should be .5")
            turtle.turnLeft()
            turtle.turnLeft()
        else
            print(direction, "this shouldn't be .5 i think?")
            turtle.turnRight()
            turtle.turnRight()
    end
    if not (i == H) then
        turtle.up()
    end
end
