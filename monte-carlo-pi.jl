using Plots

# number of points to randomly generate in the square [(0,0), (0,1), (1,1), (1,0)]
N = 100_000

"function checks weather a given point is in the circle of radius equal to 1"
is_in( (x,y) ) = if x^2 + y^2 < 1
    1
else
    0
end

all_points = [ (rand(), rand()) for _ in 1:N]
points_in = [ p for p in all_points if is_in(p) == 1]
points_out = [ p for p in all_points if is_in(p) == 0]

myPI = 4 * length(points_in) / N

plot( [(0,0), (0,1), (1,1), (1,0), (0,0)],
    xlims = (0,1), ylims = (0,1),
    aspect_ratio=:equal, 
    leg=nothing)
plot!( [(cos(x), sin(x)) for x in 0:0.01:2*pi]) 
scatter!(points_in)
scatter!(points_out)

print("PI = $(myPI)")