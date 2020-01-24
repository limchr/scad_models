//
//general
//
$fn = 30;
tube_dia = 4;
eps = 0.2;

//
//extruder guide
//
//strength of material
ex_s = 3;
//distance from extruder filament input to holder (depth of part)
ex_depth = 15;

//lower length of extruder holder
ex_hlower = 40;
ex_hupper = 30;

ex_hole_dia = 3;
ex_hole_head_dia = 5;
ex_hole_head_depth = ex_depth - 3;

//cable tie holes
ex_num_cth = 5;
ex_cth_w = 6;
ex_cth_h = 3;

//
//guide next to filament spool
//
//strength of material
fil_s = 5;
//depth of part
fil_depth = 20;

//lower length of extruder holder
fil_hlower = 30;
fil_hupper = 70;

fil_hole_dia = 4+0.2;
fil_hole_head_dia = 8;
fil_hole_head_depth = fil_depth - 3;

//cable tie holes
fil_num_cth = 3;
fil_cth_w = 6;
fil_cth_h = 3;




module tube_guide(s, tube_dia, lower_height, upper_height, depth, hole_dia, hole_head_dia, hole_head_depth, num_cth, cth_w, cth_h,add_profile_guide=false) {
    h = lower_height + upper_height;
    w = tube_dia + 2*s;

    difference(){
    cube([depth,w,h]);
    translate([depth,w/2,0]) cylinder(h, tube_dia/2,tube_dia/2);
    translate([depth,w/2,lower_height]) rotate([0,-90,0]) {cylinder(hole_head_depth, hole_head_dia/2,hole_head_dia/2);
    cylinder(depth, hole_dia/2,hole_dia/2);
    }



    step_cth = (h - 2*s)/num_cth;
    for(z = [0:num_cth]) {
        translate([depth-tube_dia/2-s-cth_h,0,s + z*step_cth+ (step_cth-cth_w)/2])cube([cth_h,w,cth_w]);
        
        }


    }
    if(add_profile_guide) {
        difference(){
            union(){
                translate([-2,0,lower_height-10-eps-2]) cube([2,w,2]); 
                translate([-2,0,lower_height+10+eps]) cube([2,w,2]); 
            }
            translate([-2,w/2-tube_dia/2,0])cube([2,tube_dia,h]);
       }
    }
}


tube_guide(ex_s, tube_dia, ex_hlower, ex_hupper, ex_depth, ex_hole_dia, ex_hole_head_dia, ex_hole_head_depth, ex_num_cth, ex_cth_w, ex_cth_h);
translate([0,30,0])tube_guide(fil_s, tube_dia, fil_hlower, fil_hupper, fil_depth, fil_hole_dia, fil_hole_head_dia, fil_hole_head_depth, fil_num_cth, fil_cth_w, fil_cth_h, true);