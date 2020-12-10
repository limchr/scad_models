print_top = true;
print_base = false;


resolution = 30;    
$fn = resolution;
    
radius = 80;
height = 30;
strength = 2;


scale_factor = 0.4;
r1_base = 70*scale_factor;
r2_base = 80*scale_factor;
h_base = 20*scale_factor;

r1_top = 50*scale_factor;
r2_top = 65*scale_factor;
h_top = 60*scale_factor;


hole_r = 1.5;
hole_ang = 60;
hole_layer = 2;



include<bezier.scad>


basepoly = [[r1_base,0],
[(r1_base+r2_base)/2*1.05,h_base*0.5],
[r2_base,h_base]

];

toppoly = [[r1_top,0],
[(r1_top+r2_top)/2*1.05,h_top*0.5],
[r2_top,h_top]
];

//base
if(print_base)difference() {

union() {
translate([0,0,0]) cylinder(r=r1_base,h=strength);

translate([0,0,strength])difference() {
    
        cylinder(strength,r1_top+strength+(r1_base-r1_top),r1_top+strength);
        cylinder(strength,r1_top+strength,r1_top+strength);

    
    }

bezier_model(basepoly,resolution,strength);
}
//translate([0,0,strength*0.7]) cylinder(r=r1_top+2*strength,h=strength);
}

//top
if(print_top)translate([0,0,strength])difference() {

union() {
    translate([0,0,0]) cylinder(r=r1_top,h=strength);

bezier_model(toppoly,resolution,strength);
}


for (i =  [0 : hole_ang : 360]) {
for (j =  [0 : hole_layer]) {
    if(j % 2 == 0) {rotate([0,0,i+hole_ang/2])translate([hole_r*3+j*(r1_top-hole_r*4-strength)/hole_layer,0,0]) cylinder(strength,hole_r,hole_r,$fn=10);
    } else {
        rotate([0,0,i])translate([hole_r*3+j*(r1_top-hole_r*4-strength)/hole_layer,0,0]) cylinder(strength,hole_r,hole_r,$fn=10);
        }
}
}

}