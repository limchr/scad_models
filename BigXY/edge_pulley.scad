
module cutout() {
    polygon([[0,7],[2,7],[2,3],[6,7],[6,13],[2,17],[2,13],[0,13]]);
}

module profile2020(l) {
    color([0,0,1])
        linear_extrude(l)
            difference(){
                square(20);
                cutout();
                translate([20,0,0])rotate([0,0,90]) cutout();
                translate([20,20,0])rotate([0,0,180]) cutout();
                translate([0,20,0])rotate([0,0,270]) cutout();
                translate([10,10,0])circle(3);
            }
}


translate([0,0,0])rotate([0,90,0])profile2020(500);
translate([20,20,0])rotate([0,90,90])profile2020(500);



rail_w = 12;
rail_h = 8;

carriage_l = 46;
carriage_w = 27;
carriage_hole_distance = 20;

railandcarriage_h = 13;


pulleys_inner_dia = 12;
pulleys_outer_dia = 18;
pulleys_h = 9;




s = 5;
l = 50;
w = 50;


sd = 5;
m4=4;
h1_s = 20;
h2_s = 35;
//todo aussparung der schraubenkoepfe weil profil im weg
include<../simple_rounded_cube.scad>

difference(){
    union(){
        sr_cube([l,w,s],radius=10,corners=[0,0,1,0]);
        translate([-s,-s,-20]) {
            cube([l+s,s,20+s]);
            cube([s,w+s,20+s]);
        }
    }
    
    translate([h1_s,h1_s,0]) cylinder(s,sd/2,sd/2);
    translate([h2_s,h2_s,0]) cylinder(s,sd/2,sd/2);
    
    translate([l-10,10,0]) cylinder(s,m4/2,m4/2);
    translate([10,w-10,0]) cylinder(s,m4/2,m4/2);
    translate([25,-s,-10]) rotate([-90,0,0])cylinder(s,m4/2,m4/2);
    translate([-s,25,-10]) rotate([0,-90,0])cylinder(s,m4/2,m4/2);
}