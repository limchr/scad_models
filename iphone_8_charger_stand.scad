phone_w = 70;
phone_l = 138;
phone_h = 9;

charger_h = 9;
charger_dia = 100;

eps = 1;
s = 4;

border_w = 7;
stand_d = 73;
stand_angle = 20;

usb_hole_degree = 125;
usb_hole_w = 5;
usb_hole_l = 8;

front_radius = 3;
back_radius = 10;


include<simple_rounded_cube.scad>


intersection() {

difference() {

translate([0,phone_h+2*s,0]) rotate([-stand_angle,0,0])translate([0,-phone_h-2*s,0])

difference(){
    union(){
sr_cube([phone_w+2*s,phone_h+2*s + 1000,phone_l+s],radius=front_radius);
        
    translate([(phone_w+2*s)/2,phone_h+s,s+phone_l/2]) rotate([-90,0,0]) 
    cylinder(charger_h+s,charger_dia/2+s+eps,charger_dia/2+s+eps);
    translate([(phone_w+2*s)/2,phone_h+s+charger_h+s,s+phone_l/2]) rotate([-90,0,0]) 
    cylinder(10,charger_dia/2+s+eps,phone_w/2);

    }
    
    translate([s-eps,s-eps,s]) cube([phone_w+2*eps,phone_h+2*eps,phone_l]);
    translate([s+border_w,0,s]) cube([phone_w-2*border_w,phone_h,phone_l]);
    
    //translate([(phone_w+2*s)/2,phone_h+s+eps,s+phone_l/2]) rotate([-90,0,0]) 
    //cylinder(charger_h+2*eps,charger_dia/2+eps,charger_dia/2+eps);
    translate([(phone_w+2*s)/2,0,s+phone_l/2]) {
    
    rotate([-90,0,0]) 
    cylinder(charger_h+2*eps+phone_h + s,charger_dia/2+eps+5,charger_dia/2+eps);
    
        translate([-usb_hole_w/2,-usb_hole_w/2+phone_h+s+charger_h/2+eps,0]) rotate([0,usb_hole_degree,0])  sr_cube([usb_hole_l,usb_hole_w,1000]);
        
        }
    
}



translate([0,0,-10000])cube([10000,10000,10000]);
translate([0,stand_d,0])cube([10000,10000,10000]);

}

union(){
translate([0,-500,0]) sr_cube([phone_w+2*s,stand_d+500,phone_l+s],radius=back_radius);

translate([-500,0,0])cube([1000,stand_d-back_radius,phone_l+s]);
}
}