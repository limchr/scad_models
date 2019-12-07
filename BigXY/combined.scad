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

carriage_screw_dia = 3;
carriage_screw_head_dia = 4;


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
cylinder(xy_mount_h,carriage_screw_dia/2,carriage_screw_dia/2); translate([0,0,xy_mount_h/2]) cylinder(xy_mount_h,carriage_screw_head_dia/2,carriage_screw_head_dia/2);
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
translate([pulley_x2,pulley_y2,carriage_z_offset+carriage_h]) cylinder(100, 5/2,5/2);
translate([pulley_x2,pulley_y3,carriage_z_offset+carriage_h]) cylinder(100, 5/2,5/2);


}



//carriage_xy_mount ends here

x_mount_x = 150;
x_mount_y = xy_mount_y+xy_mount_w/2-carriage_w/2;
x_mount_z = railandcarriage_h + xy_mount_h/2 + 20 + railandcarriage_h;


translate([x_mount_x,x_mount_y,x_mount_z - carriage_h])carriage();




//x_mount starts here
//x_mount ends here

x_mount_h = 50;
x_mount_s = 5;
x_mount_w = carriage_w + 20;

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

}






