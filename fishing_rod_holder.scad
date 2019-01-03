

w = 20;
l = 300;
h =16;

holder_height = 5;
holder_x2 = 68;
holder_x1 = 47;

middle_r = 2.8;
middle_translate = w-6;

side_r = 4;
side_d = h;

support_holder = 3;

border_radius = 10;

include <simple_rounded_cube.scad>;
include<threads.scad>

$fn = 20;


difference(){
sr_cube([l,w,h],radius=border_radius);
translate([l/2,middle_translate,0]) //metric_thread (diameter=8, length=h, internal=true);
    cylinder(h,middle_r,middle_r);
    
    //translate([2*side_r,w/2,h-side_d]) cylinder(side_d,side_r,side_r,$fn=6);
    //translate([l-2*side_r,w/2,h-side_d]) cylinder(side_d,side_r,side_r,$fn=6);
    translate([3*side_r,w/2,h-side_d]) english_thread (diameter=3.1/8, threads_per_inch=20, length=h/25.3, internal=true);
    translate([l-3*side_r,w/2,h-side_d]) english_thread (diameter=3.1/8, threads_per_inch=20, length=h/25.3, internal=true);
}

translate([(l-holder_x2)/2,0,-holder_height]) {
    
difference(){
    translate([-support_holder,0,0])cube([holder_x2+support_holder*2,w,holder_height]);
    linear_extrude(holder_height)polygon([[0,0],[holder_x2,0],[(holder_x2-holder_x1)/2+holder_x1,w],[(holder_x2-holder_x1)/2,w]]);
}

}