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



translate([(rail_w+20)/2,30,0]) rotate([90,0,180]) rail(450);

xy_mount_y = 200;
xy_mount_h = 5;
xy_mount_w = carriage_l;
xy_mount_l = 80;

pulley_x1 = 20;
pulley_x2 = 20 + pulleys_inner_dia;

pulley_z1 = railandcarriage_h + xy_mount_h + 3;
pulley_z2 = pulley_z1 + pulleys_h + 3;


pulley_y1 = 20;
pulley_y2 = xy_mount_y + xy_mount_w/2 - pulleys_outer_dia/2;
pulley_y3 = xy_mount_y + xy_mount_w/2 + pulleys_outer_dia/2;
pulley_y4 = profiles_short + 2*20 + nema17_l/2;

translate([pulley_x1,pulley_y1,pulley_z1]) pulley();
translate([pulley_x2,pulley_y2,pulley_z2]) pulley();
translate([pulley_x2,pulley_y3,pulley_z1]) pulley();
translate([pulley_x1,pulley_y4,pulley_z1]) pulley();

translate([carriage_w-3.5, xy_mount_y,carriage_z_offset]) {
    rotate([0,0,90]) carriage();
    translate([-carriage_w,0,carriage_h]) { //point for constructing xymount
        cube([xy_mount_l,carriage_l,xy_mount_h]);
        translate([40,(xy_mount_w-rail_w)/2,-rail_h]) rotate([90,0,90]) rail(450);

        
        
    }
}
