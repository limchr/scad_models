$fn = 50;
w = 9;
d = 10;
//h = 17;
//h = 7;
h = 12;

difference() {
cube([w,d,h]);
translate([w/2,d-1,h-2]) cylinder(2,1.5,1.5);
translate([w/2,1,h-2]) cylinder(2,1.5,1.5);
    rotate([30,0,0])translate([0,-d+2,-2])  cube([w,d,h]);
}