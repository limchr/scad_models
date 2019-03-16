h = 40;
d = 20;
s = 6;

//hook height
hh = h/2.5;

$fn = 20;

w = 15;
w2 = 4;

ang = 18.9;

hole_r = 2.2;
hole_r2 = 4;
hole_h2 = 2.7;
hole_h = h - hole_r - s;


rotate([90,0,0])
difference() {
    linear_extrude(w) polygon([[0,0],[0,d/2],[hh/2,d],[hh,d],[hh,d-s/2],[hh/2+s/2,d-s*0.75],[s*1.5,d/2],[s*1.5,s*1.5],[s*2,s],[h-s/3,s],[h,s*0.66],[h,0]]);

    translate([0,d,w/2+w2/2]) rotate([90-ang,0,0]) cube(1000,1000,1000);
    translate([0,d,w/2-w2/2]) rotate([ang,0,0]) translate([0,-1000,-1000]) cube(1000,1000,1000);

    translate([hole_h,0,w/2]) rotate([-90,0,0]) cylinder(s,hole_r,hole_r);
    translate([hole_h,s-hole_h2,w/2]) rotate([-90,0,0]) cylinder(hole_h2+0.02,hole_r,hole_r2);

}