

//minkowski() {hull() {translate([0,0,0.005]) cube([30,40,0.01], center=true); translate([0,0,9.995]) cube([20,30,0.01],center=true);} sphere(5);}


//translate([0,0,50]) minkowski() {cylinder(h=90, d=30, center=true); sphere(r=5);}

//difference() {cube([10,10,20], center=true); for(dx=[-5,5],dy=[-5,5]) translate([dx,dy,0]) cylinder(h=20.1, r=5, center=true);}

difference() {cube([70,70,10], center=true); translate([0,0,-5]) rotate_extrude(convexity=4) translate([30,0,0]) circle(r=5);}      