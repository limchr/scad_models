use <threads.scad>

holder_height = 100;
screw_radius = 3;
rod_length = 160;
rod_radius = 10;

print_base = false;
print_cam_holder = false;
print_adapter = true;

if(print_adapter) {
     translate([0,0,0])rotate([0,90,0])cylinder(rod_length,rod_radius,rod_radius);
    translate([rod_length,0,0])rotate([0,90,0]) english_thread (diameter=1/4, threads_per_inch=20, length=0.2);
    difference() {
            union(){
                    rotate([0,-90,0]) {
                        cylinder(40,rod_radius+5,rod_radius+5);
                        translate([0,0,-10]) cylinder(10,rod_radius,rod_radius+5);
                }
            }
            rotate([0,-90,0]) translate([0,0,10])cylinder(40,rod_radius,rod_radius);
        }
}

if(print_base) {
    difference() {
        scale([0.2,0.5,1]) sphere(r=holder_height/2); 
        translate([-50,-50,-50])cube([50,1000,1000]);
        translate([0,0,holder_height/3])rotate([0,90,0])cylinder(20,screw_radius,screw_radius);
        translate([0,0,-holder_height/3])rotate([0,90,0])cylinder(20,screw_radius,screw_radius);
        
        }
        
    translate([0,0,0])rotate([0,90,0])cylinder(rod_length,rod_radius,rod_radius);
    translate([rod_length,0,0])rotate([0,90,0]) english_thread (diameter=1/4, threads_per_inch=20, length=0.2);
}

if(print_cam_holder) {
    camera_height = 43;
    camera_width = 62;
    camera_depth = 28;
    strength = 3;
    holder_width = 5;

    difference() {
    cube([camera_width+strength*2,camera_height+strength*2,camera_depth+strength]);
    translate([strength,strength,strength]) cube([camera_width,camera_height,camera_depth]);
    translate([0,strength+holder_width,strength])cube([camera_width+strength*2,camera_height-2*holder_width,camera_depth]);
    translate([camera_width/2-7,camera_height/2+8,0])cylinder(30,17,17,center=false);
    }
    difference() {
    translate([camera_width/2-(rod_radius),camera_height+2*strength,0]) cube([2*rod_radius+2*strength,30,2*rod_radius+2*strength]);
    translate([strength+camera_width/2,0,strength+rod_radius])rotate([-90,0,0]) cylinder(500,rod_radius+1,rod_radius+1);
    }
}