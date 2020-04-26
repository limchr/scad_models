include<globals.scad>



module delta_bracket(top,center) {
    center_x = center ? -bracket_s-profile_l/2 : 0;
    center_y = center ? -bracket_s-profile_w/2 : 0;

    translate([center_x,center_y,0]) difference(){
    union(){
        hull() {
        cube([profile_l+2*bracket_s,profile_w+2*bracket_s,bracket_h]);
        rotate([0,0,bracket_angle/2])translate([-bracket_l,profile_w+2*bracket_s,0]) rotate([90,0,0])linear_extrude(profile_w+2*bracket_s)polygon([[0,0],[bracket_l,0],[bracket_l,bracket_h]]);
        }
        hull() {
        cube([profile_l+2*bracket_s,profile_w+2*bracket_s,bracket_h]);
translate([(profile_l+2*bracket_s),0,0])rotate([0,0,-bracket_angle/2])translate([bracket_l,0,0])rotate([90,0,180]) linear_extrude(profile_w+2*bracket_s)polygon([[0,0],[bracket_l,0],[bracket_l,bracket_h]]);
        }
    }

    translate([bracket_s-eps/2,bracket_s-eps/2,0]) cube([profile_l+eps,profile_w+eps,bracket_h+eps]);

    rotate([0,0,bracket_angle/2])translate([-bracket_l*0.25,(profile_w+2*bracket_s)/2,0]) {
        cylinder(bracket_h,bracket_sr,bracket_sr);
        translate([0,0,bracket_sl]) cylinder(bracket_h,bracket_shr,bracket_shr);
    }
    rotate([0,0,bracket_angle/2])translate([-bracket_l*0.75,(profile_w+2*bracket_s)/2,0]) {
        cylinder(bracket_h,bracket_sr,bracket_sr);
        translate([0,0,bracket_sl]) cylinder(bracket_h,bracket_shr,bracket_shr);
    }


    translate([profile_l+2*bracket_s,0,0])rotate([0,0,-bracket_angle/2])translate([bracket_l*0.25,(profile_w+2*bracket_s)/2,0]) {
        cylinder(bracket_h,bracket_sr,bracket_sr);
        translate([0,0,bracket_sl]) cylinder(bracket_h,bracket_shr,bracket_shr);
    }
    translate([profile_l+2*bracket_s,0,0])rotate([0,0,-bracket_angle/2])translate([bracket_l*0.75,(profile_w+2*bracket_s)/2,0]) {
        cylinder(bracket_h,bracket_sr,bracket_sr);
        translate([0,0,bracket_sl]) cylinder(bracket_h,bracket_shr,bracket_shr);
    }

    translate([bracket_s+profile_l*0.25,bracket_s,bracket_h/2]) rotate([90,0,0]) {
        cylinder(bracket_h,bracket_sr,bracket_sr);
        translate([0,0,bracket_sl]) cylinder(bracket_h,bracket_shr,bracket_shr);
        }
    translate([bracket_s+profile_l*0.75,bracket_s,bracket_h/2]) rotate([90,0,0]) {
        cylinder(bracket_h,bracket_sr,bracket_sr);
        translate([0,0,bracket_sl]) cylinder(bracket_h,bracket_shr,bracket_shr);
        }

        
    translate([bracket_s+profile_l*0.25,profile_w+2*bracket_s,bracket_h/2]) rotate([90,0,0]) {
        cylinder(bracket_h,bracket_sr,bracket_sr);
        cylinder(bracket_s-bracket_sl,bracket_shr,bracket_shr);
        }
    translate([bracket_s+profile_l*0.75,profile_w+2*bracket_s,bracket_h/2]) rotate([90,0,0]) {
        cylinder(bracket_h,bracket_sr,bracket_sr);
        cylinder(bracket_s-bracket_sl,bracket_shr,bracket_shr);
        }


    }
} //module delta_bracket


//delta_bracket(top=false,center=true);