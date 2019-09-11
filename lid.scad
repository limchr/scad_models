l = 30;
w = 20;

//clip size
c_h = 9;
c_l = 12;
c_w = 5;
c_d = 20;

//hook size
h_h = 5;
h_w = 1.5;

//strength
s = 2;
//radius
r = 8;

include<simple_rounded_cube.scad>

module hook(){
    cube([c_l,c_w,c_h]);
    translate([0,0,c_h-h_h])  rotate([0,270,180]) linear_extrude(c_l) polygon([[0,0],[h_h,0],[0,h_w]]);
    
    }


sr_cube([l,w,s],r);


translate([(l-c_l)/2,(w-c_d)/2,s]) {
    hook();
    translate([c_l,c_d,0]) rotate([0,0,180]) hook();
}