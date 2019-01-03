$fn = 10;

//base height
bl = 150;
//base width
bw = 100;
//base front length
bfl = 20;
//global strength of material
s = 5;

//servo length
sl = 19;
//servo holder length
shl = 12;
//servo width
sw = 23;
//servo height
sh = 15;
//servo screw hole distance
ssd = 27;
//servo screw radius
ssr = 1.5;
//servo head length
shl = 11;
//bearing inner hole radius
bri = 3;
//bearing outer hole radius
bro = 10;
//bearing height
be_h = 5;

module servo_holder(shl=shl) {
    difference(){
        union(){
            cube([s,shl,sh]);
            translate([s+sw,0,0])cube([s,shl,sh]);
        }
        translate([s/2,shl,sh/2])rotate([90,0,0])cylinder(shl,ssr,ssr);
        translate([s+sw+s/2,shl,sh/2])rotate([90,0,0])cylinder(shl,ssr,ssr);
    }
    
}

module servo_holder_closed() {
    hole_length = 10;
    hole_width = 5;
    difference(){
        union(){
            servo_holder(sl);
            translate([0,sl,0]) cube([sw+2*s,s,sh]);
            translate([sw/2+s,sl+2*s,sh/2])rotate([90,0,0])cylinder(be_h,bri,bri);
        }
        translate([0,sl-hole_length,sh/2-hole_width/2])cube([sw+2*s,hole_length,hole_width]);
    }
}

//!servo_holder_closed();


difference(){
cube([bl,bw,s]);
//cut off holes for servos
cube([sw+2*s,sh,s]);
translate([0,bw-sh,0])cube([sw+2*s,sh,s]);
translate([bl-sw-2*s,bw-sh,0])cube([sw+2*s,sh,s]);
translate([bl-sw-2*s,0,0])cube([sw+2*s,sh,s]);
}

translate([bl,0,0])linear_extrude(s) polygon([[0,0],[0,bw],[bfl,bw-bfl],[bfl,bfl]]);

translate([0,sh,0]){
    //servo holder
    rotate([90,0,0])servo_holder_closed();
    translate([0,bw-sh,0])rotate([90,0,0])servo_holder_closed();
    translate([bl-sw-2*s,bw-sh,0])rotate([90,0,0])servo_holder_closed();
    translate([bl-sw-2*s,0,0])rotate([90,0,0])servo_holder_closed();
    //side covers for servo holders
    translate([0,0,s])cube([sw+2*s,s,sl]);    
    translate([0,bw-sh*2-s,s])cube([sw+2*s,s,sl]);
    translate([bl-sw-2*s,0,s])cube([sw+2*s,s,sl]);    
    translate([bl-sw-2*s,bw-sh*2-s,s])cube([sw+2*s,s,sl]);
}