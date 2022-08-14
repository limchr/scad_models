include <simple_rounded_cube.scad>

$fn = 200;

//length
l = 100;
//width
w = 20;
//height
h = 10;
//border radius
br = 5;

//cut depth
cd = h-3;
//cut radius
cr = 500;
//cut width
cw = 0.6;
//cut width lower
cwl = 0.3;

difference() {
sr_cube([l,w,h],br);
    
    translate([l/2,cr+w/2-cw/2,h-cd])
        difference() {
            cylinder(cd,cr+cwl/2,cr+cw/2);
            cylinder(cd,cr-cwl/2,cr-cw/2);
            
        }
}