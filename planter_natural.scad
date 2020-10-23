r1_base = 100;
r2_base = 110;
h_base = 20;

r1_top = 50;
r2_top = 60;


include<bezier.scad>

resolution = 100;    
$fn = resolution;
    
radius = 80;
height = 30;
strength = 2;

basepoly = [[r1_base,0],
[(r1_base+r2_base)/2*1.05,h_base*0.5],
[r2_base,h_base]




];


difference() {

union() {
translate([0,0,0]) cylinder(r=r1_base,h=strength);

bezier_model(basepoly,resolution,strength);
}
translate([0,0,strength*0.7]) cylinder(r=r1_top+2*strength,h=strength);
}