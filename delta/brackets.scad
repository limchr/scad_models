include<globals.scad>
include<profile2040.scad>
include<dbracket.scad>


//base cylinder
translate([0,0,-base_h]) cylinder(base_h,base_r_outer,base_r_outer);
    for (a = [0,120,240]) {
        rotate([0,0,a]) translate([0,base_r,0]){
        profile2040(800);
        delta_bracket(top=false,center=true);
    }
}


