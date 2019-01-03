
linear_extrude(height = 10, convexity = 10,twist=2.4) polygon(points=[[-100,-100],[-170,0],[-100,100],[0,150],[100,100],[170,0],[100,-100],[0,-150]]);

difference() {
linear_extrude(height = 400, convexity = 10,twist=100) polygon(points=[[-100,-100],[-170,0],[-100,100],[0,150],[100,100],[170,0],[100,-100],[0,-150]]);

translate([0,0,0]) scale([0.95,0.95,1])linear_extrude(height = 400, convexity = 10,twist=100) polygon(points=[[-100,-100],[-170,0],[-100,100],[0,150],[100,100],[170,0],[100,-100],[0,-150]]);
}