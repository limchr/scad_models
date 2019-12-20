//global
eps = 0.2;

$fn = 100;


//screws

m3_screw_r = 3/2;
m3_addition = 0.5;
m3_hole_r = m3_screw_r + m3_addition + eps;
m3_head_h = 4;
m3_head_r = 7/2;


m4_screw_r = 4/2;
m4_addition = 0.5;
m4_hole_r = m4_screw_r + m4_addition + eps;
m4_head_h = 4;
m4_head_r = 7/2;


m5_screw_r = 5/2;
m5_addition = 0.5;
m5_hole_r = m5_screw_r + m5_addition + eps;
m5_head_h = 5;
m5_head_r = 8/2;


//tronxy cage variables
profiles_long = 530;
profiles_short = 460;
profiles_vertical = 530;


//nema 17
nema17_l = 42.3;
nema17_w = 42.3;
nema17_h = 40;

nema17_shaft_dia = 5;
nema17_shaft_h = 24;
nema17_shaft_border_dia = 22;
nema17_shaft_border_h = 2;

nema17_screw_dia = 3;
nema17_screw_dist_x = 31;
nema17_screw_dist_y = 31;
nema17_screw_margin_x = (nema17_l-nema17_screw_dist_x)/2;
nema17_screw_margin_y = (nema17_w-nema17_screw_dist_y)/2;

//nema 17 holder
nema17_holder_s = 5;
nema17_holder_w = 10;
nema17_holder_outer_dia = 20;
nema17_holder_screw_dia = 4;

//pulleys 
pulleys_inner_dia = 12;
pulleys_outer_dia = 18;
pulleys_screw_dia = 5;
pulleys_h = 9;

//rails

rail_w = 12;
rail_h = 8;

rail_screw_d = 25;

carriage_l = 46;
carriage_w = 27;
carriage_h = 10;
carriage_hole_distance = 20;
carriage_screw_dia = 3;
carriage_screw_head_dia = 6;


carriage_hole_x_margin = (carriage_l - carriage_hole_distance)/2;
carriage_hole_y_margin = (carriage_w - carriage_hole_distance)/2;


railandcarriage_h = 13;
carriage_z_offset = railandcarriage_h-carriage_h;


//to be sorted

belt_w = 1;
screw_h = 4;

xy_mount_y = 200;
xy_mount_h = 5;
pulley_y23_dist = carriage_w + pulleys_inner_dia + 15;
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


carriage_x = (20-rail_w)/2 - (carriage_w - rail_w) / 2 ;


module carriage_screw_hole() {
cylinder(xy_mount_h,carriage_screw_dia/2+eps,carriage_screw_dia/2+eps); translate([0,0,xy_mount_h/2]) cylinder(xy_mount_h,carriage_screw_head_dia/2+eps,carriage_screw_head_dia/2+eps);
    }
