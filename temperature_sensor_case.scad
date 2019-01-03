//width
w = 50;
//length
l = 57;
//bottom height
bh = 15;
//top height
th = 10;
//sensor measures
sh = 30;
sw = 16;
sd = 11;
//slide for smd
slide_margin = 3;
slide_height = 2.5;
//measures for usb port
usb_hole_width = 18;
usb_hole_height = 8;

triangle_length = 30;
//thickness of material
s=2;

//real height
h = bh + th + slide_height;

print_base = false;
print_top = true;

if(print_base) {
    difference() {
        union() {
        //main cube
        cube([l+s,w+2*s,h+2*s]);
        //additional cube for sensor
        translate([0,(w-sw)/2,s+bh+slide_height]) cube([sd+s,sw+2*s,sh+s]); 
        //triangle shape for air sensor
        translate([sd+s,w/2+sw/2+s*2,h+s*2])rotate([90,0,0])linear_extrude(sw+2*s)polygon([[0,0],[triangle_length,0],[0,sh-th]]);

        }

        //main cut out
        translate([0,s+slide_margin,s]) cube([l,w-2*slide_margin,h]);
        //cut for pcb slide
        translate([0,s,s+bh])cube([l,w,slide_height]);
        //cut for sensor
        translate([0,s+(w-sw)/2,s+bh+slide_height]) cube([sd,sw,sh]); 
        //sensor air holes
        translate([0,s+w/2-1,h+s*3])cube([100,2,sh-th-s*2]);
        translate([0,s+w/2-6,h+s*3])cube([100,2,sh-th-s*2]);
        translate([0,s+w/2+4,h+s*3])cube([100,2,sh-th-s*2]);
        //usb hole
        translate([0,s+(w-usb_hole_width)/2,s+bh+slide_height])cube([1000,usb_hole_width,usb_hole_height]);
    }
}
if(print_top) {
    
translate([-5,0,0]) {
    translate([0,s+slide_margin,s]) {
                cube([s,w-2*slide_margin,h]);
    }
    translate([-s,0,0]) cube([s,w+2*s,h+2*s]);
    translate([-s,w/2-sw/2,bh+slide_height+s]) cube([s,sw+s*2,sh+s]);

    translate([0,s+w/2-sw/2,bh+slide_height+s]) cube([s,sw,sh]);
}    
    
}