//variable to set up the resolution of cylinders
$fn = 500;


//strength of parts
s = 10;

//error term (critical parts are eps wider for a better fit)
eps = 1;


//length of the guitar holder (don't need to be changed, maybe set to maximum dimensions of your printer)
l = 290;

//dia of cutout cylinder (increase for a flatter ground)
l2 = 800;

//enter the depth (thickness) of your guitar here
guitar_w = 150;

//cutout radius for the cool design
cutout_r = 100;

//hole for bottom guitar "pin"
center_hole_dia = 30;


difference() {
rotate([-90,0,0]) cylinder(guitar_w+2*s+2*eps,l/2,l/2);
translate([0,s+eps,l2/2+s]) rotate([-90,0,0]) cylinder(guitar_w+2*eps,l2/2,l2/2);
translate([-500,-500,-500]) cube([1000,1000,500]);
    translate([0,guitar_w/2+s+eps,0]) cylinder(100,center_hole_dia/2+eps,center_hole_dia/2+eps);
    translate([0,0,l/2]) rotate([-90,0,0]) cylinder(500,cutout_r,cutout_r);
}