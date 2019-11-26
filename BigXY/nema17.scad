l = 42.3;
w = 42.3;
h = 40;

shaft_dia = 5;
shaft_h = 24;
shaft_border_dia = 22;
shaft_border_h = 2;

screw_dia = 3;
screw_dist_x = 31;
screw_dist_y = 31;
screw_margin_x = (l-screw_dist_x)/2;
screw_margin_y = (w-screw_dist_y)/2;



eps = 0.3;
holder_s = 5;
holder_w = 20;
holder_outer_dia = 20;
holder_screw_dia = 4;


module nema17(){
    difference(){
        cube([l,w,h]);
        translate([screw_margin_x,screw_margin_y,0]){
            cylinder(h,screw_dia/2,screw_dia/2);
            translate([screw_dist_x,screw_dist_y,0]) cylinder(h,screw_dia/2,screw_dia/2);
            translate([screw_dist_x,0,0]) cylinder(h,screw_dia/2,screw_dia/2);
            translate([0,screw_dist_y,0]) cylinder(h,screw_dia/2,screw_dia/2);
        }
    }

    translate([l/2,w/2,h]) {
        cylinder(shaft_border_h,shaft_border_dia/2,shaft_border_dia/2);
        cylinder(shaft_h,shaft_dia/2,shaft_dia/2);
    }
        
}
    

translate([0,0,holder_s+20]) nema17();

difference() {
hull() {
cube([l,w,holder_s]);
translate([-holder_w,w/2,0]) cylinder(holder_s,holder_outer_dia/2,holder_outer_dia/2);
translate([l+holder_w,w/2,0]) cylinder(holder_s,holder_outer_dia/2,holder_outer_dia/2);
}

translate([-holder_w,w/2,0]) cylinder(holder_s,holder_screw_dia/2,holder_screw_dia/2);
translate([l+holder_w,w/2,0]) cylinder(holder_s,holder_screw_dia/2,holder_screw_dia/2);

        translate([screw_margin_x,screw_margin_y,0]){
            cylinder(h,screw_dia/2,screw_dia/2);
            translate([screw_dist_x,screw_dist_y,0]) cylinder(h,screw_dia/2,screw_dia/2);
            translate([screw_dist_x,0,0]) cylinder(h,screw_dia/2,screw_dia/2);
            translate([0,screw_dist_y,0]) cylinder(h,screw_dia/2,screw_dia/2);
        }


}