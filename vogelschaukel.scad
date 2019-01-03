//length

l = 280;

//width

w = 250;

//thickness

s = 12;


//hook thickness

hw = 9;
hl = 15;

//strengthen width
sw = 20;

$fn = 30;


difference(){

union(){


//hook outer

translate([l,-w+s,hw/2]) rotate([-90,0,0])cylinder(s,hw/2,hw/2);

translate([l,0,hw/2]) rotate([-90,0,0])cylinder(s,hw/2,hw/2);

translate([l-hl,-w+s,hw*2/3]) cube([hl,s,hw/3]);
translate([l-hl,0,hw*2/3]) cube([hl,s,hw/3]);


//strengthen 
linear_extrude(s) polygon([[0,0],[0,-sw],[sw,0]]);
translate([0,-w+2*s,0])linear_extrude(s) polygon([[0,0],[0,sw],[sw,0]]);


difference(){

union(){


//holders

cube([l,s,s]);

translate([0,-w+s,0])cube([l,s,s]);


//sitting rod

translate([0,s,s/2])rotate([90,0,0])cylinder(w,s/2,s/2);


}


//make the holder flat on the upside

translate([l-hl,-w,hw/3]) rotate([0,-85,0]) cube([10000,10000,10000]);
translate([l-hl,-w,hw/3]) cube([10000,10000,10000]);

}


}


translate([l-hw/2,-w+s,hw/2]) rotate([-90,0,0])cylinder(s,hw/6,hw/6);

translate([l-hw/2,0,hw/2]) rotate([-90,0,0])cylinder(s,hw/6,hw/6);


}


