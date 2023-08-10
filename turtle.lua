function wait ( seconds )
end


hasGps = false

X, Y, Z = gps.locate()

if not (X == nil) then
    hasGps = true
end

LOWESTY = -60

print("what size should i mine?")
print("only do the first two for now")
L = read()
W = read()
H = read() --disabled for testing

NeededFuel = (L * W * H) + L + W + H

RightOrLeft = 1
direciton = .5 -- in pi radians


L = tonumber(L)
W = tonumber(W)
H = tonumber(H)
for i = 1 H,1
do
    for j = 1,W,1
    do
        for k = 2,L,1
        do
            turtle.forward()
        end

        print(type(j), " ", type(W))
        if (j < W) then
            if (RightOrLeft == 0) then
                RightOrLeft = 1
                turtle.turnRight()
                turtle.forward()
                turtle.turnRight()
                direciton = direciton - 1

            else
                RightOrLeft = 0
                turtle.turnLeft()
                turtle.forward()
                turtle.turnLeft()
                direciton = direciton + 1
            end
        end
    end
    if(i < H) then
        turtle.up()
end

for i = 1,H,1
do
    turtle.down()
end

if not (direciton == 1.5 or direciton == -.5)
    for i = 1,(abs(direction% .5)),1
    do
        turtle.turnRight()
    end
end
if not ((W % 2) == 0) then
    for j = 1, W, 1
    do
        turtle.forward()
    end
end
for k = i, L, 1
do
    turtle.forward()
end
