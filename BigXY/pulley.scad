pulleys_inner_dia = 12;
pulleys_outer_dia = 18;
pulleys_screw_dia = 5;
pulleys_h = 9;

module pulley(){
    difference(){
        union(){
    cylinder(pulleys_h,pulleys_inner_dia/2,pulleys_inner_dia/2);
    cylinder(1,pulleys_outer_dia/2,pulleys_outer_dia/2);
    translate([0,0,pulleys_h-1])cylinder(1,pulleys_outer_dia/2,pulleys_outer_dia/2);
        }
        cylinder(pulleys_h,pulleys_screw_dia/2,pulleys_screw_dia/2);
    }
}
