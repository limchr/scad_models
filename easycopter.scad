num_rotor = 4;
total_width = 200;

//rotate 45 to get x-shaped copter
base_rotation = 45;

print_base = true;
print_motor_holder = true;
print_battery_case = false;
print_top = false;
print_camera_holder = true;

base_bottom_radius = 10;
base_top_length = 100;
base_top_width = 100;
base_top_depth = 2;
base_top_round_radius = 10;

base_hole_length = 30;
base_hole_width = 5;
base_hole2_length = 5;
base_hole2_width = 5;
base_hole2_margin =5;

rod_radius_inner = 0;
rod_strength = 4.5;
rod_radius_outer = 6.5;
rod_holder_length = 20;

motor_mount_strength = 2;
motor_radius = 12;
motor_hole_margin_1 = 5;
motor_hole_margin_2 = 8;
motor_hole_radius = 1.6;
motor_inner_hole_radius = 3;
motor_hole_rotate_angle = 0;
motor_outer_radius = motor_radius+2;

foot_length = 50;

battery_width = 70;
battery_height = 30;
battery_length = 100;
battery_holder_strength = 5;

top_height = 40;

degree_step = 360/num_rotor;
SMALL_NUMBER = 0.1;
BIG_NUMBER = 2000;
$fa = 5;

translate([total_width/2,0,0])rotate([0,0,0]){
    if(print_top) {
     translate([0,0,50])
        translate([-base_top_width/2+base_top_round_radius/2,-base_top_length/2+base_top_round_radius/2,rod_radius_outer]) minkowski(){cube([base_top_width-base_top_round_radius,base_top_length-base_top_round_radius,top_height/2]); //base plate
    translate([0,0,0])cylinder(r=base_top_round_radius,h=base_top_depth/2);}     
}
if(print_base) {
difference() {
    translate([-base_top_width/2+base_top_round_radius/2,-base_top_length/2+base_top_round_radius/2,rod_radius_outer]) minkowski()
{cube([base_top_width-base_top_round_radius,base_top_length-base_top_round_radius,base_top_depth/2]); //base plate
    translate([0,0,0])cylinder(r=base_top_round_radius,h=base_top_depth/2);}
    for(hole = [1:num_rotor]) { //holes 1
         rotate([0,0,hole*degree_step]) translate([base_top_width/4+base_hole_width,-base_hole_length/2,0]) cube([base_hole_width,base_hole_length,BIG_NUMBER]);
         rotate([0,0,hole*degree_step]) translate([base_top_width/3+base_hole_width,-base_hole_length/2,0]) cube([base_hole_width,base_hole_length,BIG_NUMBER]);
    }
    for(hole = [1:num_rotor]) { //holes 2
         rotate([0,0,hole*degree_step+degree_step/2]) translate([base_top_width/2,rod_radius_outer+base_hole2_margin,0]) cube([base_hole2_width,base_hole2_length,BIG_NUMBER]);
         rotate([0,0,hole*degree_step+degree_step/2]) translate([base_top_width/2,-rod_radius_outer-base_hole2_width-base_hole2_margin,0]) cube([base_hole2_width,base_hole2_length,BIG_NUMBER]);
    }

}
rotate([0,0,base_rotation]) {
cylinder(rod_radius_outer*2,base_bottom_radius,base_bottom_radius,center = true);
for(nr = [1:num_rotor]) {
    difference() {
        union() {
            rotate([90,0,nr*degree_step])translate([0,0,0]) {cylinder(base_bottom_radius+rod_holder_length,rod_radius_outer,rod_radius_outer); //outer rod holder
                translate([-rod_radius_outer,0,0])cube([rod_radius_outer*2,rod_radius_outer,base_bottom_radius+rod_holder_length]);
                }
                
            rotate([90,0,nr*degree_step])translate([base_top_width/2,0,-rod_radius_outer])difference()
                {
                    cube([rod_radius_outer,rod_radius_outer,rod_radius_outer*2]); //rod outer holder
                    rotate([0,90,0])translate([-rod_radius_outer,0,-SMALL_NUMBER]) cylinder(BIG_NUMBER,rod_radius_inner+rod_strength,rod_radius_inner+rod_strength);
                }
                
        }
        rotate([90,0,nr*degree_step])translate([0,0,base_bottom_radius])
        difference() { //filled hole for rod 
            cylinder(rod_holder_length+SMALL_NUMBER,rod_radius_inner+rod_strength,rod_radius_inner+rod_strength);
            cylinder(rod_holder_length+SMALL_NUMBER,rod_radius_inner,rod_radius_inner);
        }
    }
}
}
if(print_battery_case) {
translate([-battery_length/2,-battery_width/2,-battery_height-rod_radius_outer]) 
difference(){
cube([battery_length,battery_width,battery_height]);
translate([battery_holder_strength,battery_holder_strength,battery_holder_strength]) cube([battery_length,battery_width-2*battery_holder_strength,battery_height-2*battery_holder_strength]);
}

}

}
if(print_motor_holder) {
//a motor holder

for (rot = [0:num_rotor-1]) {
//for (rot = [0:0]) {
    rotate([0,0,rot*degree_step]) {
        translate([-total_width/2,-total_width/2,0]) {
            rotate([0,0,degree_step]) {
                
                difference() {
                    union() {
                        translate([0,0,-rod_radius_outer])cylinder(rod_radius_outer*2+base_top_depth,motor_outer_radius,motor_outer_radius); //outer motor cylinder
                        
                        for(nr = [0,0.5,1]) {
                            difference() {
                                union() {
                                    rotate([90,0,nr*(180-degree_step)])translate([0,0,0]) {
                                        cylinder(motor_outer_radius+rod_holder_length,rod_radius_outer,rod_radius_outer); //outer rod holder
                                        translate([-rod_radius_outer,0,0])cube([rod_radius_outer*2,rod_radius_outer+base_top_depth,motor_outer_radius+rod_holder_length]);
                                    }
                                    if(nr!=0.5)rotate([0,0,nr*(180-degree_step)])translate([0,-rod_holder_length/2-motor_outer_radius,-foot_length]) cylinder(foot_length,rod_radius_outer/2,rod_radius_outer); //foots

                                    
                                }
                                rotate([90,0,nr*(180-degree_step)])translate([0,0,motor_outer_radius])
                                difference() { //filled hole for rod 
                                    cylinder(rod_holder_length+SMALL_NUMBER,rod_radius_inner+rod_strength,rod_radius_inner+rod_strength);
                                    cylinder(rod_holder_length+SMALL_NUMBER,rod_radius_inner,rod_radius_inner);
                                }
                            }
                        }
                    }
                    rotate([0,0,motor_hole_rotate_angle]) { //motor holes
						translate([motor_hole_margin_2,0,-BIG_NUMBER/2]) cylinder(BIG_NUMBER,motor_hole_radius,motor_hole_radius);
						translate([0,motor_hole_margin_1,-BIG_NUMBER/2]) cylinder(BIG_NUMBER,motor_hole_radius,motor_hole_radius);
						translate([-motor_hole_margin_2,0,-BIG_NUMBER/2]) cylinder(BIG_NUMBER,motor_hole_radius,motor_hole_radius);
						translate([0,-motor_hole_margin_1,-BIG_NUMBER/2]) cylinder(BIG_NUMBER,motor_hole_radius,motor_hole_radius);
                        translate([0,0,-BIG_NUMBER/2]) cylinder(BIG_NUMBER,motor_inner_hole_radius,motor_inner_hole_radius);
					}
                    translate([0,0,-BIG_NUMBER+rod_radius_outer-motor_mount_strength+base_top_depth])cylinder(BIG_NUMBER,motor_radius,motor_radius); //motor screw hole
                }
            }
        }
    }
}
}
}//rotate everything


translate([base_width,0,0]) {
    cube([50,50,50]);
}


straight = total_width - 2*motor_outer_radius;
diagonal_a = (total_width/2-base_bottom_radius-motor_outer_radius);
diagonal_b = straight/2;
diagonal = sqrt(diagonal_a*diagonal_a+diagonal_b*diagonal_b);
echo("in case of quad: 4 rods with length of ",straight);
echo("in case of quad: 4 rods with length of ",diagonal);