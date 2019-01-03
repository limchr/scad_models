w = 19;
h = 7;
l = 51;

s = 1;
s2 = 3;

difference() {
cube([l,w,h]);

translate([0,s2,s2])cube([l-s,w-2*s2,h-s2]);

translate([-1,w-6,s2]) rotate([0,0,-2])cube([l-s,5,2.5]);
translate([-1,1,s2]) rotate([0,0,2])cube([l-s,5,2.5]);
}