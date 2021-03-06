
include <globals.scad>

module rail(l) {
    linear_extrude(l) polygon([[0,0],[rail_w,0],[rail_w,rail_h*0.6],[rail_w-1, rail_h*0.65],[rail_w-1,rail_h*0.75],[rail_w, rail_h*0.8],[rail_w,rail_h],
        [0,rail_h],[0,rail_h*0.8],[1,rail_h*0.75],[1,rail_h*0.65],[0,rail_h*0.6]
    ]);
      
}

module carriage() {
    difference(){
    cube([carriage_l,carriage_w,carriage_h]);
    translate([carriage_hole_x_margin,carriage_hole_y_margin,0]){
        cylinder(carriage_h,carriage_screw_dia/2,carriage_screw_dia/2);
        translate([carriage_hole_distance,carriage_hole_distance,0])cylinder(carriage_h,carriage_screw_dia/2,carriage_screw_dia/2);
        translate([carriage_hole_distance,0,0])cylinder(carriage_h,carriage_screw_dia/2,carriage_screw_dia/2);
        translate([0,carriage_hole_distance,0])cylinder(carriage_h,carriage_screw_dia/2,carriage_screw_dia/2);
        
        }
    
        translate([0,(carriage_w-rail_w)/2,0]) cube([carriage_l,rail_w,(rail_h+carriage_h)-railandcarriage_h]);
        
        }
}