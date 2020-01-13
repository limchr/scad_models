include<globals.scad>

include<profile2020.scad>
include<nema17.scad>
include<pulley.scad>
include<rail.scad>
include<tronxy_x5s.scad>

include<nema17_reverse_holder.scad>


include<edge.scad>

tronxy_x5s_cage(true);
edge();
translate([profiles_long,0,0])rotate([0,0,90])edge();

translate([profiles_long-nema17_w,profiles_short+40,-40]) nema17();



translate([(rail_w+20)/2,30,0]) rotate([90,0,180]) rail(450);


translate([pulley_x1,pulley_y1,pulley_z1]) pulley();
translate([pulley_x2,pulley_y2,pulley_z2]) pulley();
translate([pulley_x2,pulley_y3,pulley_z1]) pulley();
#translate([pulley_x1,pulley_y4-nema17_w,pulley_z1]) pulley();



translate([carriage_w+carriage_x, xy_mount_y,carriage_z_offset]) {
    translate([0,(xy_mount_w-carriage_l)/2,0])rotate([0,0,90]) carriage();
    }
    




translate([0,profiles_short+40,servo_v_h+nema17_h]) rotate([180,0,0]) nema17();




translate([0,profiles_short+40 - nema17_w,0]) {

nema17_reverse_holder();
}

include<xy_mount.scad>


include<x_mount.scad>




