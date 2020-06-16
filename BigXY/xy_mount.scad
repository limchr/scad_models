include<globals.scad>
include<../simple_rounded_cube.scad>

//carriage_xy_mount starts here
    
difference(){
translate([carriage_x, xy_mount_y,carriage_z_offset]) {

    translate([0,0,carriage_h]) { //point for constructing xymount
        difference(){
        sr_cube([xy_mount_l,xy_mount_w,xy_mount_h],radius=20); //actual platform
            
        translate([20,xy_mount_w/2-10-eps,xy_mount_h/2])cube([100,20+2*eps,20]); //cutout for profile
        hull(){ // screw hole for fixing profile
            translate([20+2,xy_mount_w/2,0])cylinder(xy_mount_h,2,2);
            translate([xy_mount_l-15,xy_mount_w/2,0]) cylinder(xy_mount_h,2,2);
            }

        //screw holes for carriage
        translate([carriage_hole_y_margin,(xy_mount_w-carriage_l)/2+carriage_hole_x_margin,0]){
            carriage_screw_hole();
                translate([carriage_hole_distance,0,0]) carriage_screw_hole();
                translate([carriage_hole_distance,carriage_hole_distance,0]) carriage_screw_hole();
                translate([0,carriage_hole_distance,0]) carriage_screw_hole();
        
        }
            }
            
            //rail and profile here
        //translate([40,(xy_mount_w-rail_w)/2,xy_mount_h/2+20]) rotate([90,0,90]) rail(450);
        //translate([(profiles_long-480)/2,(xy_mount_w-20)/2,xy_mount_h/2]) rotate([90,0,90]) profile2020(480);


    }
}

//holes for pulleys
translate([pulley_x2,pulley_y2,carriage_z_offset+carriage_h]) cylinder(100, m5_hole_r,m5_hole_r);
translate([pulley_x2,pulley_y3,carriage_z_offset+carriage_h]) cylinder(100, m5_hole_r,m5_hole_r);


}



//carriage_xy_mount ends here

holder_s = 4;
holder_h = 25;
screw_r = 3;
echo(pulley_y3-pulley_y2);

holder_l = pulley_y3-pulley_y2+2*holder_s+2*screw_r;
holder_w = screw_r*2+2*holder_s;

translate([pulley_x2,pulley_y2-screw_r/2-holder_s, carriage_z_offset+carriage_h+holder_h]) {
    difference() {
        union(){
            sr_cube([holder_w,holder_l, holder_s], radius=3);
            translate([0,holder_l/2-10,-holder_h]) cube([holder_w,20,holder_h]);
        }
        translate([holder_s+screw_r,holder_l/2,-holder_h]) cylinder(holder_s+holder_h,screw_r,screw_r);
        translate([holder_s+screw_r,holder_s+screw_r,0]) cylinder(holder_s,screw_r,screw_r);
        translate([holder_s+screw_r,pulley_y3-pulley_y2+holder_s+screw_r,0]) cylinder(holder_s,screw_r,screw_r);
    }
}



