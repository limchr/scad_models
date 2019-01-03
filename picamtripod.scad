leg_height = 50;
leg_radius = 5;
foot_radius = 100;
foot_bias = -90;


cam_height = 23;
cam_width = 25;
cam_holder_strength = 2;
cam_side_clamp_width = 1;
cam_depth = 1;
cam_cable_width = 20;
cam_overhang_height = 15;

//stand
difference() {
union() {
translate([0,0,foot_bias])sphere(foot_radius);
cylinder(leg_height,leg_radius,leg_radius);
}
translate([0,0,-250])cube([500,500,500],center=true);
}



//holder
difference() { //cut hole for cable
translate([0,0,leg_height]) {
    translate([-(cam_width+2*cam_holder_strength)/2,-(cam_depth+2*cam_holder_strength)/2,0]) {
        rotate([-90,0,0])linear_extrude(cam_depth+2*cam_holder_strength)polygon([[0,0],[cam_width/2,0],[cam_width/2,cam_overhang_height]]);
        translate([cam_width+cam_holder_strength*2,0,0])rotate([-90,0,0])linear_extrude(cam_depth+2*cam_holder_strength)polygon([[0,0],[-cam_width/2,0],[-cam_width/2,cam_overhang_height]]);

        difference() {
        cube([cam_width+2*cam_holder_strength,cam_depth+2*cam_holder_strength,cam_height+cam_holder_strength]);
        translate([cam_holder_strength,cam_holder_strength,cam_holder_strength]) { 
            cube([cam_width,cam_depth,cam_height]);
            translate([cam_side_clamp_width,-cam_depth,0]) {
                cube(cam_width-2*cam_side_clamp_width,cam_height,400);
            }
        }
        }
    }
}

translate([-cam_cable_width/2,-50,leg_height]) { //cable hole
    cube([cam_cable_width,100,cam_holder_strength]);
}

}