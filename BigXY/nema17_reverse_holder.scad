include<globals.scad>
include<../simple_rounded_cube.scad>
    
    module nema17_reverse_holder() {
    
    difference(){
        union(){
        cube([nema17_w,nema17_w,servo_v_h]); 

        translate([0,0,-20]) rotate([90,0,180]) linear_extrude(nema17_w)polygon([[0,0],[5,0],[5,20+rail_h],[0,26+rail_h]]);
        }

        translate([0,0,0]) cube([nema17_w,20,rail_h]);

        translate([-5,10,-10]) rotate([0,90,0]) cylinder(5,m4_hole_r,m4_hole_r);
        translate([-5,nema17_w-10,-10]) rotate([0,90,0]) cylinder(5,m4_hole_r,m4_hole_r);

        translate([nema17_screw_margin_x,nema17_screw_margin_x,servo_v_h-servo_v_s]) cylinder(servo_v_s,m3_hole_r,m3_hole_r);
        translate([nema17_screw_margin_x,nema17_screw_margin_x+nema17_screw_dist_x,servo_v_h-servo_v_s]) cylinder(servo_v_s,m3_hole_r,m3_hole_r);
        translate([nema17_screw_margin_x+nema17_screw_dist_x,nema17_screw_margin_x,servo_v_h-servo_v_s]) cylinder(servo_v_s,m3_hole_r,m3_hole_r);
        translate([nema17_screw_margin_x+nema17_screw_dist_x,nema17_screw_margin_x+nema17_screw_dist_x,servo_v_h-servo_v_s]) cylinder(servo_v_s,m3_hole_r,m3_hole_r);
    
        
         translate([(nema17_w-servo_v_cutout)/2,0,0]) sr_cube([servo_v_cutout,nema17_w-(nema17_w-servo_v_cutout)/2,servo_v_h],radius=servo_v_cutout/2,corners=[0,0,1,1]);
       
        translate([0,0,servo_v_h-servo_v_s-servo_coh]) {
            
            rotate([90,0,0])rotate([0,90,0])linear_extrude(nema17_screw_margin_x*2) polygon([[0,0],[0,servo_coh],[nema17_screw_margin_x*2,servo_coh],[nema17_screw_margin_x*2,nema17_screw_margin_x*2]]);
            
            
            translate([nema17_screw_margin_x*2,nema17_w,0])rotate([90,0,180])rotate([0,90,0])linear_extrude(nema17_screw_margin_x*2) polygon([[0,0],[0,servo_coh],[nema17_screw_margin_x*2,servo_coh],[nema17_screw_margin_x*2,nema17_screw_margin_x*2]]);
            translate([nema17_w,nema17_w-nema17_screw_margin_x*2-3,0])rotate([90,0,90])rotate([0,90,0])linear_extrude(nema17_screw_margin_x*2+3) polygon([[0,-10],[0,servo_coh],[nema17_screw_margin_x*2,servo_coh],[nema17_screw_margin_x*2,nema17_screw_margin_x*2-10]]);

            }
    translate([nema17_w-nema17_screw_margin_x*2,0,0])rotate([90,0,0])rotate([0,90,0])linear_extrude(nema17_screw_margin_x*2) polygon([[0,0],[0,servo_v_h-servo_v_s],[nema17_screw_margin_x*2,servo_v_h-servo_v_s],[20,rail_h]]);

        translate([nema17_w-5,nema17_w-10,0]) cylinder(servo_coh,m3_hole_r,m3_hole_r);
            translate([nema17_w-5,nema17_w-10,servo_v_s]) cylinder(servo_coh,m3_hole_r+2,m3_hole_r+2);
            
        }
    
    }
    
    
    
    rotate([180,0,0]) nema17_reverse_holder();