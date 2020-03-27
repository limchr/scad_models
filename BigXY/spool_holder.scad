$fn = 100;

w = 20;
h = 60;
l = 100;
s = 8;

eps = 0.2;

//screw diameter
sd = 4 + 0.4 + 2*eps;
//screw head diameter
sd_h = 8;
//screw windings depth
sw_d = 4;

//base plate
difference() {
    union() {
translate([w/2,h/2,0]) cylinder(s,h/2,h/2);
translate([w/2,(h-w)/2+w/2,s*2]) cylinder(l,w/2,w/2);
translate([w/2,(h-w)/2+w/2,s*2+l]) cylinder(s,w/2,w/2+s);
translate([w/2,(h-w)/2+w/2,s]) cylinder(s,h/2,w/2);
    }

    translate([-w,0,0]) cube([w,h,s*2]);
    translate([w,0,0]) cube([w,h,s*2]);

    translate([w/2,w/2,0]) cylinder(s*2,sd/2,sd/2);
    translate([w/2,w/2,sw_d]) cylinder(s*2,sd_h/2,sd_h/2);
    translate([w/2,2*w+w/2,0]) cylinder(s*2,sd/2,sd/2);
    translate([w/2,2*w+w/2,sw_d]) cylinder(s*2,sd_h/2,sd_h/2);

}