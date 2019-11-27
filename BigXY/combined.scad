include<profile2020.scad>
include<tronxy_x5s.scad>
include<edge.scad>
include<nema17.scad>
include<pulley.scad>
include<rail.scad>

tronxy_x5s_cage(true);
edge();
translate([profiles_long,0,0])rotate([0,0,90])edge();

translate([0,profiles_short+40,-40]) nema17();
translate([profiles_long-nema17_w,profiles_short+40,-40]) nema17();

translate([0,0,30]) pulley();

translate([(rail_w+20)/2,30,0]) rotate([90,0,180]) rail(450);

translate([carriage_w-3.5, 200,carriage_z_offset]) {
    rotate([0,0,90]) carriage();
    translate([-carriage_w,0,carriage_h]) { //point for constructing xymount
        cube([40,carriage_l,5]);
        
        
    }
}