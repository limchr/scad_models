print_bottom = false;
print_top = true;
$fn = 100;
s = 2;
eps = 0.2;

//screw_radius
sr = (3 + 0.4)/2 + eps;
//screw head radius
shr = (5)/2 + eps;
//nut radius
nr = 5.5/2 + eps;
//nut holder radius
nhr = (8)/2;
//nut holder height
h = 20;

h1_xm = 14;
h2_xm = 15;
h1_x = 82;
h2_x = 75;
h_y = 48;

outer_margin = 8;
outer_radius = 3;

//fan diameter
fan_mm = 60;
//fan hole distance
fan_hd = 50;
//fan hole dia
fan_hole_dia = 5;


include<../simple_rounded_cube.scad>

if(print_bottom)
difference(){
    sr_cube([h1_x+2*outer_margin,h_y+2*outer_margin,s],radius=outer_radius);

    translate([outer_margin,outer_margin,0]) {
        //holes for arduino
        cylinder(s,shr,sr);
        translate([h2_xm-h1_xm,h_y,0]) cylinder(s,shr,sr);
        translate([h1_x,0,0]) cylinder(s,shr,sr);
        translate([h2_xm-h1_xm + h2_x,h_y,0]) cylinder(s,shr,sr);
        
        //holes for mounting on wood
        translate([h1_x*1/4,h_y/2,0]) cylinder(s,sr,sr*2); 
        translate([h1_x*3/4,h_y/2,0]) cylinder(s,sr,sr*2); 
        
        }

}

if(print_top)
    translate([100+h1_x+2*outer_margin,0,0]) {
        rotate([0,180,0]) difference(){
            union() {
    sr_cube([h1_x+2*outer_margin,h_y+2*outer_margin,s],radius=outer_radius);
                    translate([outer_margin,outer_margin,0]) {

        translate([0,0,-h]) cylinder(h,nhr,nhr);
        translate([h2_xm-h1_xm,h_y,-h]) cylinder(h,nhr,nhr);
        translate([h1_x,0,-h]) cylinder(h,nhr,nhr);
        translate([h2_xm-h1_xm + h2_x,h_y,-h]) cylinder(h,nhr,nhr);
                    }
                
                
                }
                
                translate([outer_margin,outer_margin,-h]) {
                    cylinder(s,nr,nr,$fn=6);
        translate([h2_xm-h1_xm,h_y,0]) cylinder(s,nr,nr,$fn=6);
        translate([h1_x,0,0]) cylinder(s,nr,nr,$fn=6);
        translate([h2_xm-h1_xm + h2_x,h_y,0]) cylinder(s,nr,nr,$fn=6);
                    
                    
                    
                    
                    }
                    
                    translate([outer_margin+h1_x/2,outer_margin+h_y/2,0]) {
                        cylinder(s,fan_mm/2,fan_mm/2);
                        translate([-fan_hd/2,-fan_hd/2,0]) cylinder(s,fan_hole_dia/2,fan_hole_dia/2);
                        translate([fan_hd/2,-fan_hd/2,0]) cylinder(s,fan_hole_dia/2,fan_hole_dia/2);
                        translate([-fan_hd/2,fan_hd/2,0]) cylinder(s,fan_hole_dia/2,fan_hole_dia/2);
                        translate([fan_hd/2,fan_hd/2,0]) cylinder(s,fan_hole_dia/2,fan_hole_dia/2);
                        
                        }
                    
                    
}
        
        }