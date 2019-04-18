print_top = true;
print_base = true;
print_arm = true;
print_bottom = true;
print_battery_holder = true;
print_support_sticks = true;


support_stick_width = 20;
support_stick_height = 3;
top_with_camera_hole = false;
bottom_with_camera_hole = true;
bottom_camera_hole_height = 20;
camera_hole_radius = 8;


num_rotor = 6;
base_radius = 75;
base_top_height = 30;
base_top_fillet = 20;
bottom_height = 48;
bottom_fillet = 5;


length_arm = 95;
width_arm = 18;
length_arm_mount = 40;
arm_mount_hole_radius = 1.6;
arm_mount_hole_margin = 4;
arm_top_overlap = 3;
strength = 6;
strength_top = 1.1;
strength_mount = strength*0.66;

margin_motor_to_arm = 3;

screw_hole_length_top_mount = 10;
screw_hole_radius_top_mount = 1.6;

motor_radius = 12;
motor_hole_margin_1 = 5;
motor_hole_margin_2 = 8;
motor_hole_radius = 1.6;
motor_inner_hole_radius = 3;
motor_hole_rotate_angle = 45;

battery_width = 100;
battery_height = 40;
battery_length = 150;
battery_holder_strength = 1;

BIG_INT = 2000;

$fa = 5;
//$fa = 30;









translate([0,0,-100]){
if(print_battery_holder){
difference(){
cube([battery_length,battery_width,battery_height]);
translate([battery_holder_strength,battery_holder_strength,battery_holder_strength]) cube([battery_length,battery_width-2*battery_holder_strength,battery_height-2*battery_holder_strength]);
}
}
}






if(print_support_sticks) {
    translate([0,0,200]) {
        deg = 360/num_rotor;
        len = base_radius+length_arm-motor_radius+margin_motor_to_arm;
        len_stick = 2*len*sin(deg/2);
        len_stick_short = 2*(len-support_stick_width)*sin(deg/2);
        len_stick_dif = (len_stick-len_stick_short)/2;
    linear_extrude(support_stick_height) polygon([[0,0],[len_stick,0],[len_stick-len_stick_dif,support_stick_width],[len_stick_dif,support_stick_width]]);
        //len_c = 1/(sin(deg)/width_arm);
        //polygon([[0,0],[0,len_stick],[support_stick_width,len_stick-len_c],[support_stick_width,len_c]]);
        
    }
}






if(print_bottom) {
//bottom
rotate([180,0,0])translate([0,0,10]){
  
translate([0,0,-strength])  {
    difference() { //bottom base plate combiner
        cylinder(strength*2,base_radius+strength_top*2,base_radius+strength_top*2);
        cylinder(strength*2,base_radius+strength_top,base_radius+strength_top);
        for(i = [0:num_rotor]) { // for each rotor make a hole in the top
            rotate([0,0,i*(360/num_rotor)]) {
                //translate([0,0,strength])rotate([90,0,90]) cylinder(length_arm-motor_radius,width_arm/2,width_arm/2);
                rotate([0,0,90])translate([-width_arm/2,-base_radius*2,0])cube([width_arm,base_radius*4,strength]);

            }
        }
translate([0,0,strength])
for(i = [0:num_rotor]) { // make screwhole in the side for the top/bottom,base part
rotate([0,0,i*(360/num_rotor)+(360/num_rotor)/2]) {
    translate([base_radius-screw_hole_length_top_mount,0,strength/2-strength]) rotate([0,90,0]) cylinder(base_radius/2,screw_hole_radius_top_mount,screw_hole_radius_top_mount);
}
}
	}
} 

difference() { //make hollow bottom

union() {
rotate_extrude(angle = 360)polygon([[0,0],[base_radius+strength_top,0],[base_radius+strength_top,bottom_height],[base_radius+strength_top-bottom_fillet,bottom_height+bottom_fillet],[0,bottom_height+bottom_fillet]]); //outer bottom
}

rotate_extrude(angle = 360)polygon([[0,0],[base_radius,0],[base_radius,bottom_height],[base_radius-bottom_fillet,bottom_height+bottom_fillet-strength_top],[0,bottom_height+bottom_fillet-strength_top]]); //hole out inner top

translate([-BIG_INT,-BIG_INT,-BIG_INT]) cube([BIG_INT*2,BIG_INT*2,BIG_INT]);

if(bottom_with_camera_hole) { //make hole for camera
translate([0,0,0])
rotate([0,0,0]) {
    translate([0,0,bottom_height-bottom_camera_hole_height]) rotate([0,90,0]) cylinder(base_radius*2,camera_hole_radius,camera_hole_radius);

}
}


} //difference


} //translate top
}



if(print_top) {
//top
translate([0,0,20]){
  
translate([0,0,-strength])  {
    difference() { //top base plate combiner
        cylinder(strength*2,base_radius+strength_top,base_radius+strength_top);
        cylinder(strength*2,base_radius,base_radius);
        for(i = [0:num_rotor]) { // for each rotor make a hole in the top
            rotate([0,0,i*(360/num_rotor)]) {
                translate([0,0,strength])rotate([90,0,90]) cylinder(length_arm-motor_radius,width_arm/2,width_arm/2);
                rotate([0,0,90])translate([-width_arm/2,-base_radius*2,0])cube([width_arm,base_radius*4,strength]);

            }
        }
    
translate([0,0,strength])
for(i = [0:num_rotor]) { // make screwhole in the side for the top/bottom,base part
rotate([0,0,i*(360/num_rotor)+(360/num_rotor)/2]) {
    translate([base_radius-screw_hole_length_top_mount,0,strength/2-strength]) rotate([0,90,0]) cylinder(base_radius/2,screw_hole_radius_top_mount,screw_hole_radius_top_mount);
}
}

	}
} 

difference() { //make hollow top

union() {
rotate_extrude(angle = 360)polygon([[0,0],[base_radius,0],[base_radius,base_top_height],[base_radius-base_top_fillet,base_top_height+base_top_fillet],[0,base_top_height+base_top_fillet]]); //outer top
for(i = [0:num_rotor]) { // for each rotor make a overlap
	rotate([0,0,i*(360/num_rotor)]) {
		rotate([90,0,90]) cylinder(base_radius+arm_top_overlap,width_arm/2+strength_top,width_arm/2+strength_top);
	}
}
}

rotate_extrude(angle = 360)polygon([[0,0],[base_radius-strength_top,0],[base_radius-strength_top,base_top_height],[base_radius-base_top_fillet-strength_top,base_top_height+base_top_fillet-strength_top],[0,base_top_height+base_top_fillet-strength_top]]); //hole out inner top


for(i = [0:num_rotor]) { // for each rotor make a hole in the top
	rotate([0,0,i*(360/num_rotor)]) {
		rotate([90,0,90]) cylinder(length_arm-motor_radius,width_arm/2,width_arm/2);
	}
}

translate([-BIG_INT,-BIG_INT,-BIG_INT]) cube([BIG_INT*2,BIG_INT*2,BIG_INT]); // cut off bottom parts of arm overlap


if(top_with_camera_hole) { //make hole for camera
translate([0,0,0])
rotate([0,0,(360/num_rotor)/2]) {
    translate([0,0,base_top_height/2+strength/2]) rotate([0,90,0]) cylinder(base_radius,camera_hole_radius,camera_hole_radius);

}
}

} //difference


} //translate top
}

if(print_base) {
//base
difference() {
linear_extrude(strength) { //main base floor
circle(base_radius);
}

for(i = [0:num_rotor]) { // for each rotor make the arm mount gap with holes
rotate([0,0,i*(360/num_rotor)]) {
	translate([base_radius,-width_arm/2,0]) {
	linear_extrude(strength_mount) difference() { //arm mount
			polygon([[0,0],[-length_arm_mount,width_arm/2],[0,width_arm]]); //gap for mounting
	}
	linear_extrude(300) { //make skrew holes
	translate([-arm_mount_hole_margin,arm_mount_hole_margin+(arm_mount_hole_margin/length_arm_mount)*width_arm/2,0]) circle(arm_mount_hole_radius); //hole 1
	translate([-arm_mount_hole_margin,width_arm-(arm_mount_hole_margin+(arm_mount_hole_margin/length_arm_mount)*width_arm/2),0]) circle(arm_mount_hole_radius); //hole 2
	translate([-length_arm_mount+arm_mount_hole_margin*3,width_arm/2,0]) circle(arm_mount_hole_radius); ////hole 3 attention: margin hack
	}
}

}
}

for(i = [0:num_rotor]) { // make screwhole in the side for the top part
rotate([0,0,i*(360/num_rotor)+(360/num_rotor)/2]) {
    translate([base_radius-screw_hole_length_top_mount,0,strength/2]) rotate([0,90,0]) cylinder(screw_hole_length_top_mount,screw_hole_radius_top_mount,screw_hole_radius_top_mount);
}
}
}
}

if(print_arm) {
//one arm
translate([base_radius*2,0,0])
difference() {
	union() {
		linear_extrude(strength_mount) {
			//circle(base_radius);

			difference(){
				union(){ //bottom parts of arm and motor mount
					translate([0,-width_arm/2,0])square([length_arm,width_arm]);
					translate([length_arm+margin_motor_to_arm,0,0])circle(motor_radius);
				}
				translate([length_arm+margin_motor_to_arm,0,0]) //cut out holes for motor mount
					rotate([0,0,motor_hole_rotate_angle]) {
						translate([motor_hole_margin_2,0,0]) circle(motor_hole_radius);
						translate([0,motor_hole_margin_1,0]) circle(motor_hole_radius);
						translate([-motor_hole_margin_2,0,0]) circle(motor_hole_radius);
						translate([0,-motor_hole_margin_1,0]) circle(motor_hole_radius);
                        translate([0,0,0]) circle(motor_inner_hole_radius);
					}

			}
		}
		
		linear_extrude(strength_mount)translate([0,-width_arm/2,0]) difference() { //arm mount
			polygon([[0,0],[-length_arm_mount,width_arm/2],[0,width_arm]]);
			translate([-arm_mount_hole_margin,arm_mount_hole_margin+(arm_mount_hole_margin/length_arm_mount)*width_arm/2,0]) circle(arm_mount_hole_radius); //hole 1
			translate([-arm_mount_hole_margin,width_arm-(arm_mount_hole_margin+(arm_mount_hole_margin/length_arm_mount)*width_arm/2),0]) circle(arm_mount_hole_radius); //hole 2
			translate([-length_arm_mount+arm_mount_hole_margin*3,width_arm/2,0]) circle(arm_mount_hole_radius); ////hole 3 attention: margin hack

		}

		translate([0,0,strength_mount]){ //roof of arm
			rotate([90,0,90]) {
				difference(){
					cylinder(length_arm-motor_radius,width_arm/2,width_arm/2);
					cylinder(length_arm-motor_radius,width_arm/2-strength_top,width_arm/2-strength_top);
				}		
                
            }
			
		}
	}
	translate([-BIG_INT,-BIG_INT,-BIG_INT]) cube([BIG_INT*2,BIG_INT*2,BIG_INT]);
    //translate([-base_radius+3,0,strength_mount])cylinder(strength-strength_mount,base_radius,base_radius); //cut out base radius in arm (hack)

}
}