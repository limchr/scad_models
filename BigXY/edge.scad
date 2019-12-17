$fn = 5;
edge_s = 5;
edge_l = 42;
edge_w = 42;
include<globals.scad>

//cutout for rail
edge_cutout_rail_l = 17;

//dia of pulley screw holes
edge_sd = pulleys_screw_dia;

//height of pulley screw heads
edge_s_h = 3;

//dia of pulley screw heads
edge_s_hd = 7;

//dia of fixing screws (m4)
pulley_screw_dia=5;

//position of pulley holes (sourced from globals.scad file)
edge_h1_s = pulley_x1;
edge_h2_s = pulley_x2;


include<../simple_rounded_cube.scad>


module edge() {
    difference(){
        union(){
            sr_cube([edge_l,edge_w,edge_s],radius=10,corners=[0,0,1,0]);
            translate([-edge_s,-edge_s,-20]) {
                cube([edge_l+edge_s,edge_s,20+edge_s]);
                cube([edge_s,edge_w+edge_s,20+edge_s]);
            }
        }
        
        translate([edge_h1_s,edge_h1_s,0]) {cylinder(edge_s,edge_sd/2,edge_sd/2); cylinder(edge_s_h,edge_s_hd/2,edge_s_hd/2);}
        translate([edge_h2_s,edge_h2_s,0]) {cylinder(edge_s,edge_sd/2,edge_sd/2); cylinder(edge_s_h,edge_s_hd/2,edge_s_hd/2);}
        
        translate([edge_l-10,10,0]) cylinder(edge_s,pulley_screw_dia/2,pulley_screw_dia/2);
        //translate([10,w-10,0]) cylinder(s,m4/2,m4/2);
        translate([(20-rail_w)/2-eps,edge_w-edge_cutout_rail_l,0]) cube([rail_w+2*eps,edge_cutout_rail_l,edge_s]);
        
        
        
        translate([25,-edge_s,-10]) rotate([-90,0,0])cylinder(edge_s,pulley_screw_dia/2,pulley_screw_dia/2);
        translate([0,25,-10]) rotate([0,-90,0])cylinder(edge_s,pulley_screw_dia/2,pulley_screw_dia/2);
    }
}


edge();