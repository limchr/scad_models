width = 8;
length = 30;
depth = 2;

hole_radius = 1.5;
screw_depth = 1.5;
screw_radius = 2.5;

difference() {
    union() {
        cube([width,length,depth]);
        cube([depth,length,width]);

        cube([length,width,depth]);
        cube([length,depth,width]);

        cube([depth,width,length]);
        cube([width,depth,length]);
    }
    hole_x = (length-width)/2+width;
    hole_y = (width-depth)/2+depth;
    translate([hole_x,hole_y,0]){ 
        translate([0,0,depth-screw_depth]) cylinder(screw_depth+0.01,hole_radius,screw_radius);
        cylinder(1000,hole_radius,hole_radius,center=true);
        }
    translate([hole_y,hole_x,0]){ 
        translate([0,0,depth-screw_depth]) cylinder(screw_depth+0.01,hole_radius,screw_radius);
        cylinder(1000,hole_radius,hole_radius,center=true);
        }
    translate([hole_x,0,hole_y]) rotate([-90,0,0]) { 
        translate([0,0,depth-screw_depth]) cylinder(screw_depth+0.01,hole_radius,screw_radius);
        cylinder(1000,hole_radius,hole_radius,center=true);
        }
    translate([hole_y,0,hole_x]) rotate([-90,0,0]) { 
        translate([0,0,depth-screw_depth]) cylinder(screw_depth+0.01,hole_radius,screw_radius);
        cylinder(1000,hole_radius,hole_radius,center=true);
        }
    translate([0,hole_x,hole_y]) rotate([0,90,0]) { 
        translate([0,0,depth-screw_depth]) cylinder(screw_depth+0.01,hole_radius,screw_radius);
        cylinder(1000,hole_radius,hole_radius,center=true);
        }
    translate([0,hole_y,hole_x]) rotate([0,90,0]){ 
        translate([0,0,depth-screw_depth]) cylinder(screw_depth+0.01,hole_radius,screw_radius);
        cylinder(1000,hole_radius,hole_radius,center=true);
        }
}