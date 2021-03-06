print_left = false;
print_right = false;
print_inner_holder = false;
print_wall_holder = true;
height = 15;
ff_width = 16.63;
ff_height = 18.63;
s = 1.2;
side_w_left = 50;
side_w_right = 30;
numw = 10;
numl = 30;


usb_w = 10;
usb_h = 6;
usb_offset_z = 0; //position above ground

switch_w = 8;
switch_h = 5;

button_r = 3.5;
button_distance = 20;
gap_h = 2;

width = (numw)*ff_height;
length = (numl)*ff_width;

overlap = 3;


holder_r_top = 7;
holder_r_bottom = 9;
holder_h = 13;
holder_inner_r = 2.2;
holder_nut_r = 4.3;
holder_roof_h = 2;


if(print_wall_holder) {
    difference() {
    cube([30,5,30]);
    translate([12,0,0]) cube([6,2,20]);
    translate([12,2,0]) cube([6,2,25]);

        }
    }


difference(){
    union(){
            
        for(w = [0:numw]) {
            translate([w*ff_height,side_w_left-s,0])cube([s,length+s,height]);
        }

        for(l = [0:numl]) {
            translate([0,l*ff_width+side_w_left-s,0])cube([width+s,s,height]);
        }

        difference(){
        translate([0,0,0])cube([width+s,side_w_left,height]);
        translate([s,s,s])cube([width-s,side_w_left-2*s,height]);
            
        
        translate([0,side_w_left/2-usb_w/2,height-usb_h+s-usb_offset_z]) cube([s,usb_w,usb_h]);
        translate([width-button_distance,0,height-button_r]) rotate([-90,0,0]) cylinder(s,button_r,button_r);
        translate([width-2*button_distance,0,height-button_r]) rotate([-90,0,0]) cylinder(s,button_r,button_r);
        translate([width-3*button_distance,0,height-button_r]) rotate([-90,0,0]) cylinder(s,button_r,button_r);
        translate([width-4*button_distance-switch_w/2,0,height-switch_h]) cube([switch_w,s,switch_h]);

        }

        difference(){
        translate([0,length+side_w_left-s,0])cube([width+s,side_w_right,height]);
        translate([s,length+side_w_left,s])cube([width-s,side_w_right-2*s,height]);
        }
        
        //printing overlap
        translate([0,0,height]) difference(){
            cube([width+s,length+side_w_left+side_w_right-s,overlap]);
            translate([s,s,0]) cube([width-s,length+side_w_left+side_w_right-3*s,overlap]);
            
            }
        
    }
    if(!print_left){
        cube([width+s,length/2+side_w_left-s,height+overlap]);
    }
    if(!print_right) {
        translate([0,length/2+side_w_left-s,0]) cube([width+s,length/2+side_w_right,height+overlap]);
    }
    translate([s,side_w_left-s,height-gap_h]){cube([width-s,s,gap_h]);}
    translate([s,side_w_left-s+length,height-gap_h]){cube([width-s,s,gap_h]);}
}

echo("backplate dimensions");
echo([width-s,length+side_w_left+side_w_right-3*s,overlap]);
echo("frontplate dimensions");
echo([width+s,length+side_w_left+side_w_right-s,overlap]);

translate([-200,0,0])if(print_inner_holder) {
    difference(){
        cylinder(holder_h, holder_r_bottom,holder_r_top, $fn=20);
        cylinder(100, holder_inner_r, holder_inner_r, $fn=20);
        cylinder(holder_h-holder_roof_h,holder_nut_r*1.2, holder_nut_r, $fn=6);
        
        }
    
}

