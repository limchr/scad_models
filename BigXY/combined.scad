include<globals.scad>

include<profile2020.scad>
include<nema17.scad>
include<pulley.scad>
include<rail.scad>
include<tronxy_x5s.scad>




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

carriage_x = (20-rail_w)/2 - (carriage_w - rail_w) / 2 ;


translate([carriage_w+carriage_x, xy_mount_y,carriage_z_offset]) {
    translate([0,(xy_mount_w-carriage_l)/2,0])rotate([0,0,90]) carriage();
    }
    

module carriage_screw_hole() {
cylinder(xy_mount_h,carriage_screw_dia/2+eps,carriage_screw_dia/2+eps); translate([0,0,xy_mount_h/2]) cylinder(xy_mount_h,carriage_screw_head_dia/2+eps,carriage_screw_head_dia/2+eps);
    }



//carriage_xy_mount starts here
    
difference(){
translate([carriage_x, xy_mount_y,carriage_z_offset]) {

    translate([0,0,carriage_h]) { //point for constructing xymount
        difference(){
        sr_cube([xy_mount_l,xy_mount_w,xy_mount_h],radius=20); //actual platform
            
        translate([20,xy_mount_w/2-10,xy_mount_h/2])cube([100,20,20]); //cutout for profile
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
        translate([40,(xy_mount_w-rail_w)/2,xy_mount_h/2+20]) rotate([90,0,90]) rail(450);
        translate([(profiles_long-480)/2,(xy_mount_w-20)/2,xy_mount_h/2]) rotate([90,0,90]) profile2020(480);


    }
}

//holes for pulleys
translate([pulley_x2,pulley_y2,carriage_z_offset+carriage_h]) cylinder(100, m5_hole_r,m5_hole_r);
translate([pulley_x2,pulley_y3,carriage_z_offset+carriage_h]) cylinder(100, m5_hole_r,m5_hole_r);


}



//carriage_xy_mount ends here

x_mount_x = 100;
x_mount_y = xy_mount_y+xy_mount_w/2-carriage_w/2;
x_mount_z = railandcarriage_h + xy_mount_h/2 + 20 + railandcarriage_h;


translate([x_mount_x,x_mount_y,x_mount_z - carriage_h])carriage();




//x_mount starts here
//x_mount ends here

x_mount_h = 50;
x_mount_s = 5;
x_mount_w = pulley_y23_dist - 2 - x_mount_s*2 - 2;

difference() {

translate([x_mount_x,x_mount_y-(x_mount_w-carriage_w)/2,x_mount_z-x_mount_h+x_mount_s]){
    difference(){
        sr_cube([carriage_l,x_mount_w,x_mount_h],radius=5);
        translate([0,x_mount_s,x_mount_s]) cube([carriage_l,x_mount_w-2*x_mount_s,x_mount_h-2*x_mount_s]);
    }

}

translate([x_mount_x+carriage_hole_x_margin,x_mount_y+carriage_hole_y_margin,x_mount_z]) {
    
    carriage_screw_hole();
                translate([carriage_hole_distance,0,0]) carriage_screw_hole();
                translate([carriage_hole_distance,carriage_hole_distance,0]) carriage_screw_hole();
                translate([0,carriage_hole_distance,0]) carriage_screw_hole();


}

translate([x_mount_x+10,x_mount_y-500,pulley_z1]) cube([5,1000,9]);
translate([x_mount_x+10,x_mount_y-500,pulley_z2]) cube([5,1000,9]);

translate([x_mount_x+carriage_l-15,x_mount_y-500,pulley_z1]) cube([5,1000,9]);
translate([x_mount_x+carriage_l-15,x_mount_y-500,pulley_z2]) cube([5,1000,9]);

}






