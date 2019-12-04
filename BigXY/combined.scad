include<profile2020.scad>
include<nema17.scad>
include<pulley.scad>
include<rail.scad>
include<tronxy_x5s.scad>

eps = 0.2;

belt_w = 1;
screw_h = 4;

xy_mount_y = 200;
xy_mount_h = 5;
pulley_y23_dist = carriage_w + pulleys_inner_dia + 5;
xy_mount_w = carriage_l + 40;
xy_mount_l = 80;

pulley_x1 = nema17_l/2;
pulley_x2 = nema17_l/2 + pulleys_inner_dia + 1;

pulley_z1 = railandcarriage_h + xy_mount_h + screw_h;
pulley_z2 = pulley_z1 + pulleys_h + screw_h;


pulley_y1 = nema17_w/2;
pulley_y2 = xy_mount_y + xy_mount_w/2 - pulley_y23_dist/2;
pulley_y3 = xy_mount_y + xy_mount_w/2 + pulley_y23_dist/2;
pulley_y4 = profiles_short + 2*20 + nema17_l/2;

include<edge.scad>

tronxy_x5s_cage(true);
edge();
translate([profiles_long,0,0])rotate([0,0,90])edge();

translate([0,profiles_short+40,-40]) nema17();
translate([profiles_long-nema17_w,profiles_short+40,-40]) nema17();



translate([(rail_w+20)/2,30,0]) rotate([90,0,180]) rail(450);


translate([pulley_x1,pulley_y1,pulley_z1]) pulley();
translate([pulley_x2,pulley_y2,pulley_z2]) pulley();
translate([pulley_x2,pulley_y3,pulley_z1]) pulley();
translate([pulley_x1,pulley_y4,pulley_z1]) pulley();

translate([carriage_w-3.5, xy_mount_y,carriage_z_offset]) {
    translate([0,(xy_mount_w-carriage_l)/2,0])rotate([0,0,90]) carriage();
    
    translate([-carriage_w,0,carriage_h]) { //point for constructing xymount
        difference(){
        sr_cube([xy_mount_l,xy_mount_w,xy_mount_h],radius=20);
        translate([20,xy_mount_w/2-10,xy_mount_h/2])cube([100,20,20]);
        hull(){
            translate([20+2,xy_mount_w/2,0])cylinder(xy_mount_h,2,2);
        translate([xy_mount_l-15,xy_mount_w/2,0]) cylinder(xy_mount_h,2,2);}

            }
        translate([40,(xy_mount_w-rail_w)/2,xy_mount_h+20]) rotate([90,0,90]) rail(450);
        translate([(profiles_long-480)/2,(xy_mount_w-20)/2,xy_mount_h]) rotate([90,0,90]) profile2020(480);

        
        
    }
}
