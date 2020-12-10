include <../simple_rounded_cube.scad>

print_back = true;
print_front = false;

print_back_plugs = false;
print_side_hole = true;

psu_l = 210;
psu_w = 114;
psu_h = 51;

eps = 0.3;
s = 4;


l_back = 50;
l_front = 30;
l_front_addition = 20;
l_front_total = l_front + l_front_addition;

edge_dia = 5;


feet_l = 15;
feet_w = 15;
feet_h = psu_h;
feet_s = 3;
feet_r = min(feet_l,feet_h) - feet_s;
feet_screw_dia = 4.5;
feet_screw_outer_dia = 7;
feet_edge_dia = feet_l-2*feet_s;

feet_margin = 2*s + feet_w/2;
front_feet_distance = l_front_total - 2*feet_margin;

back_feet_distance = l_back + s - 2*feet_margin;


c13_h = 28;
c13_w = 49;
c13_hole_distance = 40;
c13_hole_r = 3/2 + eps; 
c13_y = psu_w/3*2;
c13_z = psu_h/2;


xt60_h = 15.735;
xt60_w = 8.128;
xt60_e = 3;
xt60_x = psu_w/3-20;
xt60_z = psu_h/2;

module feet() {
        translate([-feet_l/2, -feet_w/2,0]) {
            difference(){
                intersection(){
                union(){
            cube([feet_l, feet_w, feet_s]);
            translate([0,feet_w-feet_s,0]) cube([feet_l,s,feet_h]);
            translate([0,0,feet_s]) difference() {
                cube([feet_l,feet_w-s,feet_h-s]); 
                translate([feet_l,feet_w-feet_r-s,feet_r]) rotate([0,-90,0]) cylinder(feet_l,feet_r,feet_r); 
                cube([feet_l,feet_w-feet_r-feet_s,feet_h]); 
                translate([0,0,feet_edge_dia/2 + feet_s*2]) cube([feet_l,feet_w,feet_h]);
                }
        }
    sr_cube([feet_l,feet_w,10000], radius = feet_edge_dia/2, corners=[1,1,0,0]);
        }
        
        
            translate([feet_l/2,feet_w/2,0]) cylinder(1000,feet_screw_dia/2, feet_screw_dia/2);
            translate([feet_l/2,feet_w/2,feet_s]) cylinder(1000,feet_screw_outer_dia/2, feet_screw_outer_dia/2);

            }
            }

    }


// cupe representing power supply unit
//cube([psu_l,psu_w,psu_h]);

difference(){

    union(){
        if(print_front) {
            difference() {
                union(){
                    translate([l_front,-s,-s]) rotate([0,-90,0]) sr_cube([psu_h+2*s, psu_w+2*s, l_front_total], radius=edge_dia/2, corners=[0,1,1,0]);
                    
                    //feets//
                    translate([-l_front_addition+feet_margin,-feet_w/2,-s]) feet();
                    translate([-l_front_addition+feet_margin+front_feet_distance,-feet_w/2,-s]) feet();

                    translate([-l_front_addition+feet_margin,psu_w+feet_w/2,-s]) rotate([0,0,180])feet();
                    translate([-l_front_addition+feet_margin+front_feet_distance,psu_w+feet_w/2,-s]) rotate([0,0,180])feet();
                }

            //c13 power input (get dimensions from plug thing with switch and fuse
            if(print_back_plugs) {
                translate([-l_front_addition,c13_y-c13_w/2,c13_z-c13_h/2]) {
                cube([s,c13_w,c13_h]);
            }
            translate([-l_front_addition,c13_y,c13_z+c13_hole_distance/2])  rotate([0,90,0]) cylinder(l_front_addition-s,c13_hole_r,c13_hole_r); 
            translate([-l_front_addition,c13_y,c13_z-c13_hole_distance/2])  rotate([0,90,0]) cylinder(l_front_addition-s,c13_hole_r,c13_hole_r); 
            
            
            
            //power output via drone plug
                    translate([-l_front_addition,xt60_x-xt60_w/2,xt60_z-xt60_h/2])
        
       rotate([90,0,0])rotate([0,90,0]) linear_extrude(s)  polygon([[0,0],[xt60_w,0],[xt60_w,xt60_h-xt60_e],[xt60_w-xt60_e,xt60_h],[xt60_e,xt60_h],[0,xt60_h-xt60_e]]);
        }
        
        if(print_side_hole) {
            
            translate([-l_front_addition/2,
            s,psu_h/3]) rotate([90,0,0]) cylinder(s*2,5,5);
            translate([-l_front_addition/2,
            s,psu_h/3*2]) rotate([90,0,0]) cylinder(s*2,5,5);
            
            }
        
        
        
        
        }

        }

        if(print_back) {
                difference(){
                    translate([psu_l+s, -s, -s]) rotate([0,-90,0]) sr_cube([psu_h+2*s,psu_w+2*s,l_back+s], radius=edge_dia/2, corners=[0,1,1,0]);
                    translate([psu_l-l_back, psu_w-30, s*2]) cylinder(psu_h, 30,30);
                    }
                translate([psu_l+s-feet_margin,-feet_w/2,-s]) feet();
                translate([psu_l+s-feet_margin, psu_w+feet_w/2,-s]) rotate([0,0,180])feet();

                translate([psu_l+s-feet_margin-back_feet_distance,-feet_w/2,-s]) feet();
                translate([psu_l+s-feet_margin-back_feet_distance, psu_w+feet_w/2,-s]) rotate([0,0,180])feet();

        }
    }
    translate([0,-eps,-eps]) cube([psu_l,psu_w+2*eps,psu_h+2*eps]);
    translate([-l_front_addition+s,s,s]) cube([l_front_addition,psu_w-2*s,psu_h-2*s]);
}
