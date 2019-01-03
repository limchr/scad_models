height = 8;
ff_width = 16.63;
ff_height = 18.63;
s = 1.2;
side_w = 50;
numw = 10;
numl = 30;
print_left = true;
print_right = false;

usb_w = 7;
usb_h = 4;

button_r = 3;
button_distance = 20;
gap_h = 2;

width = (numw)*ff_height;
length = (numl)*ff_width;


difference(){
    union(){
            
        for(w = [0:numw]) {
            translate([w*ff_height,side_w-s,0])cube([s,length+s,height]);
        }

        for(l = [0:numl]) {
            translate([0,l*ff_width+side_w-s,0])cube([width+s,s,height]);
        }

        difference(){
        translate([0,0,0])cube([width+s,side_w,height]);
        translate([s,s,s])cube([width-s,side_w-2*s,height]);
        translate([0,side_w/2-usb_w/2,height/2-usb_h/2]) cube([s,usb_w,usb_h]);
        translate([width/2,0,height/2]) rotate([-90,0,0]) cylinder(s,button_r,button_r);
        translate([width/2+button_distance,0,height/2]) rotate([-90,0,0]) cylinder(s,button_r,button_r);
        translate([width/2+button_distance*2,0,height/2]) rotate([-90,0,0]) cylinder(s,button_r,button_r);
            
        }

        difference(){
        translate([0,length+side_w-s,0])cube([width+s,side_w,height]);
        translate([s,length+side_w,s])cube([width-s,side_w-2*s,height]);
        }
    }
    if(!print_left){
        cube([width+s,length/2+side_w-s,height]);
    }
    if(!print_right) {
        translate(length/2+side_w) cube([width+s,length/2+side_w,height]);
    }
    translate([s,side_w-s,height-gap_h]){cube([width-s,s,gap_h]);}
    translate([s,side_w-s+length,height-gap_h]){cube([width-s,s,gap_h]);}
}