eps = 0.3;
$fn = 20;

w = 40;
d = 30;
shd = 32; // screw hole distance
shr = (4+0.3)/2+eps; //screw hole radius

s = 2;

if(true){
difference(){
cube([w,d,w]);
    translate([w/2,0,w/2])rotate([-90,0,0])cylinder(d-s,w/2-s,w/2-s);
    do = (w-shd)/2;
    translate([do,0,do]) rotate([-90,0,0]) cylinder(d/2,shr,shr);
    translate([do,0,w-do]) rotate([-90,0,0]) cylinder(d/2,shr,shr);
    translate([w-do,0,do]) rotate([-90,0,0]) cylinder(d/2,shr,shr);
    translate([w-do,0,w-do]) rotate([-90,0,0]) cylinder(d/2,shr,shr);
}    
}

tz = 30;
tx = 10;

hull() {
linear_extrude(1)polygon([[0,0],[w/2,0],[w/2,w/2],[0,w/2]]);

translate([0,w/2-5,-30]) linear_extrude(1)polygon([[0,0],[w/2,0],[w/2,5],[0,5]]);
}

hull() {
translate([0,w/2-1,-30]) cube([w/2,1,10]);
translate([0,w/2-1,-30]) rotate([0,0,-tz]) translate([0,20,0]) cube([w/2,1,4]);
}