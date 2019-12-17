include<globals.scad>
include<nema17.scad>


module nema17holder() {
    difference() {
    hull() {
    cube([nema17_l,nema17_w,nema17_holder_s]);
    translate([-nema17_holder_w,nema17_w/2,0]) cylinder(nema17_holder_s,nema17_holder_outer_dia/2,nema17_holder_outer_dia/2);
    translate([nema17_l+nema17_holder_w,nema17_w/2,0]) cylinder(nema17_holder_s,nema17_holder_outer_dia/2,nema17_holder_outer_dia/2);
    }

    translate([-nema17_holder_w,nema17_w/2,0]) cylinder(nema17_holder_s,nema17_holder_screw_dia/2+eps,nema17_holder_screw_dia/2+eps);
    translate([nema17_l+nema17_holder_w,nema17_w/2,0]) cylinder(nema17_holder_s,nema17_holder_screw_dia/2+eps,nema17_holder_screw_dia/2+eps);

            translate([nema17_screw_margin_x,nema17_screw_margin_y,0]){
                cylinder(nema17_h,nema17_screw_dia/2+eps,nema17_screw_dia/2+eps);
                translate([nema17_screw_dist_x,nema17_screw_dist_y,0]) cylinder(nema17_h,nema17_screw_dia/2+eps,nema17_screw_dia/2+eps);
                translate([nema17_screw_dist_x,0,0]) cylinder(nema17_h,nema17_screw_dia/2+eps,nema17_screw_dia/2+eps);
                translate([0,nema17_screw_dist_y,0]) cylinder(nema17_h,nema17_screw_dia/2+eps,nema17_screw_dia/2+eps);
            }


    }
}

nema17holder();