w = 20;
w2 = 5;
l = 15;
d = 2;
h = 11;

difference() {
    union() {
        cube([w,l,d]);
        cube([d,l,h]);
        translate([-w2+d,0,h]) cube([w2,l,d]);
    }

    translate([w/2,l/2,0])cylinder(d,2,2);
    translate([w/2,l/2,d/2])cylinder(d,2,4);
}