$fn = 20;

//parts to print
print_base = false;
print_lid = true;


//printing error
e = 0.5;

//inner dimensions
w = 60;
l = 100;
h = 35;

//strengths of walls
s = 2;

module pcb_holder() {
    difference(){
        cylinder(6,7/2,7/2);
        translate([0,0,s]) cylinder(6-s,3/2,3/2+e);
        
        }
    }


module screw_holder() {
    difference() {
        polyhedron([[0,0,0],[0,0,20],[7,0,20],[0,7,20]], 
        [[0,1,2],[0,3,1],[0,2,3],[1,3,2]]);
        translate([1.4,1.4,0])cylinder(20,3/2,3/2);
    }
}


use</home/chris/src/scad_models/resources/fonts/Bungee/Bungee-Regular.ttf>
module engrave_label(label,size) {
    translate([0,0,0.5*s]) linear_extrude(s)text(label, size = size, font="Bungee-Regular", halign="center", valign="center");    
}


if(print_base) {
translate([-s-e,-s-e,-s]) difference(){
    cube([w+2*(s+e),l+2*(s+e),h+s]);
    translate([s,s,s]) {
        cube([w+2*e,l+2*e,h]);
    }
    
    // both in and out sockets holes
    translate([0,l*0.33+s+e,h*0.66]) rotate([0,90,0])cylinder(2*w,8/2+e,8/2+e);
    
    // hole for power supply
        translate([w/2+s+e,l,h*0.66]) rotate([-90,0,0])cylinder(2*w,8/2+e,8/2+e);

}

translate([4*2.54,4*2.54,s]) pcb_holder();
translate([w-4*2.54,l-4*2.54,s]) pcb_holder();
translate([w-4*2.54,4*2.54,s]) pcb_holder();
translate([4*2.54,l-4*2.54,s]) pcb_holder();

translate([-e,-e,h-20]) rotate([0,0,0]) screw_holder();
translate([w+e,-e,h-20]) rotate([0,0,90]) screw_holder();
translate([-e,l+e,h-20]) rotate([0,0,-90]) screw_holder();
translate([w+e,l+e,h-20]) rotate([0,0,180]) screw_holder();

}


if(print_lid) {

translate([0,0,h + 20]) {
    difference() {
        translate([-s-e,-s-e,0])cube([w+(s+e)*2,l+(s+e)*2,s]);
        translate([1.4,1.4,0]) cylinder(20,3/2,3/2);
        translate([1.4,l-1.4,0]) cylinder(20,3/2,3/2);
        translate([w-1.4,1.4,0]) cylinder(20,3/2,3/2);
        translate([w-1.4,l-1.4,0]) cylinder(20,3/2,3/2);
        
        translate([w/2,17,0]) cylinder(2,3+e,3+e);
        translate([w*0.25,l*0.8,0]) cylinder(2,3.5+e,3.5+e);
        translate([w*0.75,l*0.8,0]) cylinder(2,3.5+e,3.5+e);
        translate([w*0.75,l*0.5,0]) cylinder(2,3.5+e,3.5+e);



    }
translate([w*0.1,l*0.46,0])rotate([0,0,90])engrave_label("FUZZY",11);
translate([w*0.3,l*0.46,0])rotate([0,0,90])engrave_label("BEARD",11);


translate([w*0.5,l*0.06,0])rotate([0,0,0])engrave_label("TRUE BYPASS",6);

translate([w*0.25,l*0.92,0])rotate([0,0,0])engrave_label("DRIVE",6);

translate([w*0.75,l*0.92,0])rotate([0,0,0])engrave_label("TONE",6);

translate([w*0.75,l*0.62,0])rotate([0,0,0])engrave_label("VOL",6);


    }

}