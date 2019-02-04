
include<bezier.scad>

resolution = 100;    
$fn = resolution;
    
radius = 80;
height = 30;
strength = 2;

p0 = [radius,0];
p2 = [radius+5,height*0.4];
p3 = [radius+15,height*0.7];


translate([0,0,0]) cylinder(r=radius,h=strength);

bezier_model([p0,p2,p3],resolution,strength);

