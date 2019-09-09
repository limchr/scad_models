include <raspberrypi.scad>

$fn = 100;


print_pi = true;
print_logo = true;

eps = 0.4;

s = 2;

w = 100;
l = 140;
h = 50;


printer_w = 55;
printer_l = 79;
printer_x = 5;
printer_y = l-printer_l-30;

power_port_x = 30;


cam_w = 25;
cam_l = 25;
cam_h = 7;
cam_whole_margin_x = 12;
cam_whole_margin_y = 20;
cam_screw_r = 1.5;
cam_holder_outer_r =3;

cam_m = (cam_w - cam_whole_margin_y)/2;
cam_mount_h = 3;

switch_w = 8;


module cam() {
        difference(){

    cube([cam_w, cam_l, cam_h]);
        translate([cam_m,cam_m,0]){
            cylinder(100,cam_screw_r,cam_screw_r);
            translate([cam_whole_margin_y,0,0]) cylinder(100,cam_screw_r,cam_screw_r);
            translate([0,cam_whole_margin_x,0]) cylinder(100,cam_screw_r,cam_screw_r);
            translate([cam_whole_margin_y,cam_whole_margin_x,0]) cylinder(100,cam_screw_r,cam_screw_r);
            }
    }
}


ch = 5;

c = 30;





module box(l,w,h) {
translate([0,c,0]) cube([w-c,l-c,h]);
translate([c,0,0]) cube([w-c,l-c,h]);
translate([c,c,0]) cylinder(h,c,c);
translate([w-c,l-c,0]) cylinder(h,c,c);
}

cam_pos = [(w-printer_w-printer_x)/2+printer_w+printer_x,l-40,0];
difference(){
box(l,w,h);
translate([s,s,s])box(l-2*s,w-2*s,h);

translate([printer_x,printer_y,0]) cube([printer_w,printer_l,s]);

translate([w-s,s+5,s]) cube([s,15,8]);
translate([w-s,s+35,s]) cube([s,26,8]);
translate([73,0,s]) cube([17,s,8]);



translate(cam_pos) cylinder(s,ch,ch);


translate([power_port_x,0,s]) cube([10,s,5]);
translate([power_port_x+15,0,s]) cube([10,s,5]);


translate([s*2,l-switch_w-s-s,0]) cube([switch_w,switch_w,s]);

translate([s*2+20,l-switch_w/2-s*2,0]) cylinder(s,2,2);


if(print_logo) translate([w-20,20,-10+s/2])rotate([0,180,0])scale([0.3, 0.3, 0.1]) surface(file = "resources/gfx/pixbox.png", center = true, invert = true);


}


translate([s,l-8-s*2,s*3]) cube([s,switch_w,switch_w]);
translate([s*2,l-s*2,s*3]) cube([switch_w,s,switch_w]);




translate(cam_pos) translate([-cam_w/2,-cam_w/2-2,cam_mount_h+s])cam();



module screw_holder(h,or,ir) {
    difference() {
        cylinder(h, or, or);
        cylinder(h, ir, ir);
        }
    }

translate(cam_pos) translate([-cam_w/2+cam_m,-cam_w/2+cam_m-2,s]) {
   
    
            screw_holder(cam_mount_h,cam_holder_outer_r,cam_screw_r);
            translate([cam_whole_margin_y,0,0]) screw_holder(cam_mount_h,cam_holder_outer_r,cam_screw_r);
            translate([0,cam_whole_margin_x,0]) screw_holder(cam_mount_h,cam_holder_outer_r,cam_screw_r);
            translate([cam_whole_margin_y,cam_whole_margin_x,0]) screw_holder(cam_mount_h,cam_holder_outer_r,cam_screw_r);


}

h_m = 13.5;
h_o = 5;
h_i = 2;


translate([h_m,h_m,0]) screw_holder(h-s,h_o,h_i);
translate([w-h_m,l-h_m,0]) screw_holder(h-s,h_o,h_i);



if(print_pi) translate([w-17,35,s*2])rotate([0,0,90]) zero(1);

rotate([180,0,0]){
cube([switch_w-eps,switch_w-eps,s*2],center=true);
translate([0,0,s])cube([switch_w-eps+2*s,switch_w-eps+2*s,s],center=true);
}

translate([0,0,300+h+s]) {
    difference(){
        union(){
translate([s+eps,s+eps,-s])box(l-2*s-2*eps,w-2*s-2*eps,s);
box(l,w,s);
        }
        
translate([h_m,h_m,-s]) cylinder(2*s, h_i,h_i);
translate([w-h_m,l-h_m,-s]) cylinder(2*s, h_i,h_i);
    }
    
    }