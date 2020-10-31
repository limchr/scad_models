//make it a bit smoother
$fn = 30;

//height
h = 40;

//depth (hook length)
d = 25;

//strengt
s = 6;

//hook height
hh = h/2.2;


//width
w = 15;
//width at the hook head
w2 = 4;

//angle that narrowes the hook
ang = 18.9;

//screw hole radius
hole_r = 2.2;
//screw head radius
hole_r2 = 4;
//screw head height
hole_h2 = 2.7;
//screw hole position
hole_h = h - hole_r - s;


rotate([90,0,0])
difference() {
    linear_extrude(w) polygon([[0,0],[0,d/2],[hh/2,d],[hh,d],[hh,d-s/2],[hh/2+s/2,d-s*0.75],[s*1.5,d/2],[s*1.5,s*1.5],[s*2,s],[h-s/3,s],[h,s*0.66],[h,0]]);

    translate([0,d,w/2+w2/2]) rotate([90-ang,0,0]) cube(1000,1000,1000);
    translate([0,d,w/2-w2/2]) rotate([ang,0,0]) translate([0,-1000,-1000]) cube(1000,1000,1000);

    translate([hole_h,0,w/2]) rotate([-90,0,0]) cylinder(s,hole_r,hole_r);
    translate([hole_h,s-hole_h2,w/2]) rotate([-90,0,0]) cylinder(hole_h2+0.02,hole_r,hole_r2);

}