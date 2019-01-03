print_bottom = true;
print_top = true;

r = 40;
s = 1;
h = 60;


$fn = 50;

feeder_hole_r = 5;
center_hole_r = 9;
servo_case_height = 30;

if(print_bottom) {
    difference() {
        cylinder(s,r+2*s,r+2*s);

        cylinder(s,center_hole_r,center_hole_r);
        translate([r-feeder_hole_r-s,0,0]) cylinder(s,feeder_hole_r,feeder_hole_r);

    }
}
if(print_top) {
    difference() {
        translate([-r,-r/2,s]) cube([r*3,r,h]);
        translate([-r+s,-r/2+s,2*s]) cube([r*3-2*s,r-2*s,h]);
        translate([-r,-r/2,2*s+servo_case_height]) cube([r*2-2*s-feeder_hole_r*2,r,h]);

        translate([0,0,s])cylinder(s,center_hole_r,center_hole_r);
        translate([r-feeder_hole_r-s,0,s]) cylinder(s,feeder_hole_r,feeder_hole_r);


    }


translate([r-feeder_hole_r*2-2*s,-r/2+s,s])cube([s,r-2*s,h]);
}