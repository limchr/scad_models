phone_length = 155;
phone_height = 78;
phone_depth = 10;

strength = 5;
screen_holder_width = 7;
plug_width = 20;
holder_length = 30;

rotation_degree = 15;
color("blue")
rotate([-rotation_degree,0,0])
difference() {
union() {
cube([phone_length+strength*2,phone_depth+strength*2,phone_height+strength]);
translate([+phone_length+2*strength,phone_depth+2*strength,0])rotate([0,-90,0])linear_extrude(phone_length+2*strength) polygon([[0,0],[0,holder_length],[phone_height+strength,0]]);
}
translate([strength,strength,strength])cube([phone_length,phone_depth,phone_height+strength]);
translate([strength+screen_holder_width,0,strength])cube([phone_length-screen_holder_width*2,strength,phone_height]);
translate([phone_length+strength,strength,phone_height/2-plug_width/2+strength]) cube([strength,phone_depth,plug_width]);


rotate([rotation_degree,0,0])translate([0,-0,-500])cube([500,500,500]);
}




