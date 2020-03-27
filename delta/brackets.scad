angle = 60;

profile_w = 20;
profile_l = 40;

h = 60;
l = 50;
s = 5;

eps = 0.2;

sr = 2+0.4;
sl = 3;
shr = 4+0.4;


difference(){
union(){
    hull() {
    cube([profile_l+2*s,profile_w+2*s,h]);
    rotate([0,0,angle/2])translate([-(profile_l+2*s),profile_w+2*s,0]) rotate([90,0,0])linear_extrude(profile_w+2*s)polygon([[0,0],[l,0],[l,h]]);
    }
    hull() {
    cube([profile_l+2*s,profile_w+2*s,h]);
    translate([(profile_l+2*s),0,0])rotate([0,0,-angle/2])translate([(profile_l+2*s),0,0]) rotate([90,0,180]) linear_extrude(profile_w+2*s)polygon([[0,0],[l,0],[l,h]]);
    }
}

translate([s-eps/2,s-eps/2,0]) cube([profile_l+eps,profile_w+eps,h]);

rotate([0,0,angle/2])translate([-l*0.25,(profile_w+2*s)/2,0]) {
    cylinder(h,sr,sr);
    translate([0,0,sl]) cylinder(h,shr,shr);
}
rotate([0,0,angle/2])translate([-l*0.75,(profile_w+2*s)/2,0]) {
    cylinder(h,sr,sr);
    translate([0,0,sl]) cylinder(h,shr,shr);
}

translate([profile_l+2*s,0,0])rotate([0,0,-angle/2])translate([l*0.25,(profile_w+2*s)/2,0]) {
    cylinder(h,sr,sr);
    translate([0,0,sl]) cylinder(h,shr,shr);
}
translate([profile_l+2*s,0,0])rotate([0,0,-angle/2])translate([l*0.75,(profile_w+2*s)/2,0]) {
    cylinder(h,sr,sr);
    translate([0,0,sl]) cylinder(h,shr,shr);
}

translate([s+profile_l*0.25,s,h/2]) rotate([90,0,0]) {
    cylinder(h,sr,sr);
    translate([0,0,sl]) cylinder(h,shr,shr);
    }
translate([s+profile_l*0.75,s,h/2]) rotate([90,0,0]) {
    cylinder(h,sr,sr);
    translate([0,0,sl]) cylinder(h,shr,shr);
    }
    
translate([s+profile_l*0.25,profile_w+2*s,h/2]) rotate([90,0,0]) {
    cylinder(h,sr,sr);
    cylinder(s-sl,shr,shr);
    }
translate([s+profile_l*0.75,profile_w+2*s,h/2]) rotate([90,0,0]) {
    cylinder(h,sr,sr);
    cylinder(s-sl,shr,shr);
    }

}
