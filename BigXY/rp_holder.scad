$fn = 100;
s = 2;
eps = 0.2;

//screw_radius
sr = (2.75)/2 + eps;
//screw head radius
shr = (4.5)/2 + eps;
//nut radius
nr = 5.5/2 + eps;

//holder height
h = 2;
//holder radius
hr = 6.2/2;



dist_x = 58;
dist_y = 49;


outer_margin = 8;
outer_radius = 3;

//fan diameter
fan_mm = 60;
//fan hole distance
fan_hd = 50;
//fan hole dia
fan_hole_dia = 5;


include<../simple_rounded_cube.scad>
difference(){
    union() {
    sr_cube([dist_x+2*outer_margin,dist_y+2*outer_margin,s],radius=outer_radius);
    
    translate([outer_margin,outer_margin,s]) {
        //holes for arduino
        cylinder(h,hr,hr);
        translate([dist_x,dist_y,0]) cylinder(h,hr,hr);
        translate([dist_x,0,0]) cylinder(h,hr,hr);
        translate([0,dist_y,0]) cylinder(h,hr,hr);
        
        
    }
        
        
        
        }
    translate([outer_margin,outer_margin,0]) {
        //holes for arduino
        cylinder(s,shr,shr);
        translate([dist_x,dist_y,0]) cylinder(s,shr,shr);
        translate([dist_x,0,0]) cylinder(s,shr,shr);
        translate([0,dist_y,0]) cylinder(s,shr,shr);
        translate([0,0,s])cylinder(h,sr,sr);
        translate([dist_x,dist_y,s]) cylinder(h,sr,sr);
        translate([dist_x,0,s]) cylinder(h,sr,sr);
        translate([0,dist_y,s]) cylinder(h,sr,sr);
        
        //holes for mounting on wood
        translate([dist_x*1/4,dist_y/2,0]) cylinder(s,sr,sr*2); 
        translate([dist_x*3/4,dist_y/2,0]) cylinder(s,sr,sr*2); 
        
        }

}
