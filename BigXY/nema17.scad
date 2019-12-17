include<globals.scad>


module nema17(){
    difference(){
        cube([nema17_l,nema17_w,nema17_h]);
        translate([nema17_screw_margin_x,nema17_screw_margin_y,0]){
            cylinder(nema17_h,nema17_screw_dia/2,nema17_screw_dia/2);
            translate([nema17_screw_dist_x,nema17_screw_dist_y,0]) cylinder(nema17_h,nema17_screw_dia/2,nema17_screw_dia/2);
            translate([nema17_screw_dist_x,0,0]) cylinder(nema17_h,nema17_screw_dia/2,nema17_screw_dia/2);
            translate([0,nema17_screw_dist_y,0]) cylinder(nema17_h,nema17_screw_dia/2,nema17_screw_dia/2);
        }
    }

    translate([nema17_l/2,nema17_w/2,nema17_h]) {
        cylinder(nema17_shaft_border_h,nema17_shaft_border_dia/2,nema17_shaft_border_dia/2);
        cylinder(nema17_shaft_h,nema17_shaft_dia/2,nema17_shaft_dia/2);
    }
        
}
    

//nema17();