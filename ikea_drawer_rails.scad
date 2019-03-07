//include <roundedcube.scad>

l = 310;
w = 14;
h = 5.5;

bottom_h = 4.5;
bottom_w = 25;

$fn = 20;

num_holes = 3;
hole_margin = 35;

hole_r = 2.2;
hole_r2 = 4;
screw_head_h = 2.7;
screw_h = h - screw_head_h - 0.2;

corner_radius = w/4;


increment = (l - 2 * hole_margin) / (num_holes-1);

difference() {
    union(){
        //roundedcube([l,w,h],apply_to="z",radius=corner_radius);
        translate([w/2,0,0]) cube([l-w,w,h]);
        translate([w/2,w/2,0])cylinder(h,w/2,w/2);
        translate([l-w/2,w/2,0])cylinder(h,w/2,w/2);
        translate([0,-(bottom_w-w)/2,-bottom_h]) cube([l,bottom_w,bottom_h]);
    }
    for(variable = [hole_margin : increment : (l - hole_margin)]) {
        echo(variable);
        translate([variable,w/2,0]) {
            translate([0,0,-bottom_h])cylinder(h+bottom_h,hole_r,hole_r);
            translate([0,0,screw_h+screw_head_h]) cylinder(h,hole_r2,hole_r2);
            translate([0,0,screw_h]) cylinder(screw_head_h,hole_r,hole_r2);
        }
    }
}