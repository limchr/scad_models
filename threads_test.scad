include<threads.scad>

l = 25;
w = 15;
d = 10;


difference(){
cube([l,w,d]);
translate([l/4,w/2,0]) english_thread (diameter=3/8, threads_per_inch=20, length=d/25.4, internal=true);
translate([l*0.75,w/2,0])  metric_thread (diameter=8, length=d, internal=true);
}