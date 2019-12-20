include<globals.scad>


//$fn = 5;
edge_s = railandcarriage_h + 5;
edge_s_side = 5;
edge_l = 42;
edge_w = 42;

//cutout for rail
edge_cutout_rail_l = 17;

//height of pulley screw heads
edge_s_h = edge_s - 6;

//dia of pulley screw heads
edge_s_hd = 10;


//pulley offset h
pulley_offset_height = 0;
pulley_offset_dia = 13;

//position of pulley holes (sourced from globals.scad file)
edge_h1_s = pulley_x1;
edge_h2_s = pulley_x2;


include<../simple_rounded_cube.scad>



module edge() {
    difference(){
        union(){
            //main platform
            sr_cube([edge_l,edge_w,edge_s],radius=10,corners=[0,0,1,0]);
            
            //side aligners
            translate([-edge_s_side,-edge_s_side,-20]) {
                cube([edge_l+edge_s_side,edge_s_side,20+edge_s]);
                cube([edge_s_side,edge_w+edge_s_side,20+edge_s]);
            }
            
            //pulley platforms (offsets)
            translate([edge_h1_s,edge_h1_s,edge_s]) {cylinder(pulley_offset_height,pulley_offset_dia/2,pulley_offset_dia/2);}
            translate([edge_h2_s,edge_h2_s,edge_s]) {cylinder(pulley_offset_height,pulley_offset_dia/2,pulley_offset_dia/2);}
        }
        
        //cutoffs for pulley holes (screws and screw heads)
        translate([edge_h1_s,edge_h1_s,0]) {cylinder(edge_s+pulley_offset_height,m5_hole_r,m5_hole_r); cylinder(edge_s_h,edge_s_hd/2,edge_s_hd/2);}
        translate([edge_h2_s,edge_h2_s,0]) {cylinder(edge_s+pulley_offset_height,m5_hole_r,m5_hole_r); cylinder(edge_s_h,edge_s_hd/2,edge_s_hd/2);}
        
        
        
        //cutoffs for rail
        translate([(20-rail_w)/2-eps,edge_w-edge_cutout_rail_l,0]) cube([rail_w+2*eps,edge_cutout_rail_l,edge_s]);
        
        //cutoffs for mounting holes
        translate([edge_l-10,10,0]){ cylinder(edge_s,m4_hole_r,m4_hole_r);
        translate([0,0,5]) cylinder(edge_s,4,4);
            
            }
        translate([25,-edge_s,-10]) rotate([-90,0,0])cylinder(edge_s,m4_hole_r,m4_hole_r);
        translate([0,25,-10]) rotate([0,-90,0])cylinder(edge_s,m4_hole_r,m4_hole_r);
    }
}


edge();