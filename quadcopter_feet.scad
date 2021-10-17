$fn = 50;

// height
h = 40;

// radius
r = 20;

// radius top
rt = 10;


// distance between holes
hd = 27;

// hole height
hh = 2;

// hole radius upper
hru = 3;

// hole radius bottom
hrb = 1.5;


// distance between holes
hd2 = 30;

// hole height
hh2 = 2;

// hole radius upper
hru2 = 3;

// hole radius bottom
hrb2 = 1.5;


difference() {
    union(){
    cylinder(h-rt,r,rt);
    translate([0,0,h-rt]) sphere(rt);
        }
    translate([hd/2,0,0]) {
        cylinder(h,hrb,hrb);
        translate([0,0,hh])cylinder(h,hru,hru);
        }
    translate([-hd/2,0,0]) {
        cylinder(h,hrb,hrb);
        translate([0,0,hh])cylinder(h,hru,hru);
        }
    translate([0,hd2/2,0]) {
        cylinder(h,hrb2,hrb2);
        translate([0,0,hh2])cylinder(h,hru2,hru2);
        }
    translate([0,-hd2/2,0]) {
        cylinder(h,hrb2,hrb2);
        translate([0,0,hh2])cylinder(h,hru2,hru2);
        }

}