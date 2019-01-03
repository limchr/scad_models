
limb_w = 20;
limb_h = 30;
limb_d = 12;

s = 3;

margin = 0.5;
small_number = 0.001;
big_number = 200;

difference() {
union() {
translate([0,-limb_d/2,0]) cube([limb_w,limb_d,limb_h]);
cylinder(limb_h,limb_d/2,limb_d/2);
translate([limb_w,-limb_d/2,limb_h/4])
    cube([limb_d/2+2*margin,limb_d,limb_h/2]);
translate([limb_w+limb_d/2+2*margin,0,limb_h/4])
    cylinder(limb_h/2,limb_d/2,limb_d/2);
}

cylinder(big_number,limb_d/2-s,limb_d/2-s,center=true);
translate([limb_w+limb_d/2+2*margin,0,limb_h/4])
    cylinder(big_number,limb_d/2-s+margin,limb_d/2-s+margin,center=true);

translate([-limb_d/2,-limb_d/2,limb_h/4-margin])
cube([limb_d+margin,limb_d,limb_h/2+margin*2]);
}

//screw
translate([0,30,0]) {
cylinder(limb_h,limb_d/2-s,limb_d/2-s);
translate([0,0,limb_h])cylinder(s,limb_d/2,limb_d/2);
}





//head
translate([40,0,0]) {
difference() {
union() {
translate([0,-limb_d/2,0]) cube([limb_w,limb_d,limb_h]);
cylinder(limb_h,limb_d/2,limb_d/2);
translate([limb_w,limb_d/2,0])rotate([90,0,0])linear_extrude(limb_d)polygon([[0,-s*2],[-limb_w,limb_h/2],[0,limb_h+s*2],[limb_w,limb_h/2+limb_d/2],[limb_w,limb_h/2-limb_d/2]]);

translate([limb_w*2,0,limb_h/2-limb_d/2]) cylinder(limb_d,limb_d/2,limb_d/2);
}
translate([limb_w,limb_d/2,limb_h*0.6]) sphere(limb_d/2);
translate([limb_w,-limb_d/2,limb_h*0.6]) sphere(limb_d/2);
cylinder(big_number,limb_d/2-s,limb_d/2-s,center=true);

translate([-limb_d/2,-limb_d/2,limb_h/4-margin])
cube([limb_d+margin,limb_d,limb_h/2+margin*2]);
translate([limb_w*2,0,0]) cylinder(big_number,limb_d/2-s,limb_d/2-s);
}
}

//tail
translate([-40,0,0]) {
difference() {
union() {
translate([0,-limb_d/2,0]) cube([limb_w,limb_d,limb_h]);
translate([limb_w,-limb_d/2,limb_h/4])
    cube([limb_d/2+2*margin,limb_d,limb_h/2]);
translate([limb_w+limb_d/2+2*margin,0,limb_h/4])
    cylinder(limb_h/2,limb_d/2,limb_d/2);
translate([0,limb_d/2,0])rotate([90,0,0])linear_extrude(limb_d)polygon([[0,-s*2],[-limb_w,limb_h/2],[0,limb_h+s*2],[limb_w,limb_h/2+limb_d/2],[limb_w,limb_h/2-limb_d/2]]);
}
translate([limb_w+limb_d/2+2*margin,0,limb_h/4])
    cylinder(big_number,limb_d/2-s+margin,limb_d/2-s+margin,center=true);
}
}
