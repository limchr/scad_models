
s = 5;
l = 50;
w = 50;


sd = 5;
s_h = 3;
s_hd = 7;

m4=4;
h1_s = 20;
h2_s = 35;
//todo aussparung der schraubenkoepfe weil profil im weg
include<../simple_rounded_cube.scad>


module edge() {
    difference(){
        union(){
            sr_cube([l,w,s],radius=10,corners=[0,0,1,0]);
            translate([-s,-s,-20]) {
                cube([l+s,s,20+s]);
                cube([s,w+s,20+s]);
            }
        }
        
        translate([h1_s,h1_s,0]) {cylinder(s,sd/2,sd/2); cylinder(s_h,s_hd/2,s_hd/2);}
        translate([h2_s,h2_s,0]) {cylinder(s,sd/2,sd/2); cylinder(s_h,s_hd/2,s_hd/2);}
        
        translate([l-10,10,0]) cylinder(s,m4/2,m4/2);
        translate([10,w-10,0]) cylinder(s,m4/2,m4/2);
        translate([25,-s,-10]) rotate([-90,0,0])cylinder(s,m4/2,m4/2);
        translate([-s,25,-10]) rotate([0,-90,0])cylinder(s,m4/2,m4/2);
    }
}
