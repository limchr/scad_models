mobile_width = 150;
mobile_height = 50;
mobile_depth = 5;

wall_thickness = 3;
angle = 70;

cube([mobile_width+2*wall_thickness,mobile_height/1.5,wall_thickness]);

translate([0,0,wall_thickness])
rotate([angle,0,0])
translate([0,0,-wall_thickness-mobile_depth])

difference() {
cube([mobile_width+2*wall_thickness,mobile_height,wall_thickness+mobile_depth]);
translate([wall_thickness,wall_thickness,0.5*wall_thickness])cube([mobile_width,mobile_height,mobile_depth]);
translate([wall_thickness*2,wall_thickness,0])cube([mobile_width-2*wall_thickness,mobile_height,mobile_depth*4]);
}