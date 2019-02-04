
include<bezier.scad>

resolution = 100;    
$fn = resolution;
    
radius = 30;
height = 150;
strength = 2;

p0 = [radius,0];
p1 = [radius*3,height*0.2];
p2 = [-radius,height*0.4];
p3 = [radius*3,height*0.7];
p4 = [0,height*0.8];
p5 = [radius*0.8,height*1];


translate([0,0,0]) cylinder(r=radius,h=strength);
bezier_model([p0,p1,p2,p3,p4,p5],resolution,strength);

