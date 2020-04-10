$fn = 30;

eps = 0.3;


h = 20;
w = 11.5;
lt = 12; //length top
l = 26;
hole_dist = 18;
hr = (3+eps)/2;
s = 2;

include<simple_rounded_cube.scad>

difference() {
sr_cube([l,w,2], radius=w/2);
translate([l/2 - hole_dist/2,w/2,0]) cylinder(s,hr,hr);
translate([l/2 + hole_dist/2,w/2,0]) cylinder(s,hr,hr);
}

translate([l/2 - lt/2,0,0]) rotate([90,0,90]) linear_extrude(lt) polygon([[0,0],[w,0],[w,s],[s,h],[0,h]]);
