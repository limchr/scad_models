r = 6;
scale_z = 2.5;
s = 1.3;
$fn = 20;

top_radius = 3.6;
top_height = 2.7;
top_scale = 0.8;

top_hole_radius = 1.2;

holder_height = 17;
light_radius = 2.85;
holder_radius = light_radius+s;
light_deepness = 15;

top_margin = r*0.99;
bottom_margin = r/1.5;
use <bezier.scad>


difference() {
    union() {
        scale([1.0,1.0,scale_z])sphere(r);
        
        scale([top_scale,top_scale,1])hull()bezier_model([[top_radius,r*scale_z-top_margin],[top_radius,r*scale_z+top_height],[top_radius/2,r*scale_z+top_height]],10,2);
 
        translate([0,0,-r*scale_z-holder_height+bottom_margin])cylinder(holder_height,holder_radius,holder_radius);
    }
    translate([0,0,r*scale_z+top_height/2]) rotate([90,0,0]) cylinder(1000,top_hole_radius,top_hole_radius,center=true);
   scale([1.0,1.0,scale_z]) sphere(r-s);
    translate([0,0,-r*scale_z-holder_height+bottom_margin]) cylinder(light_deepness,light_radius,light_radius);
}



//calculate needed weight
v = 3.1415*(4/3)*pow((r-s)/10,3)*scale_z;
echo("NECCECARY WEIGHT",v);
//f = m*a