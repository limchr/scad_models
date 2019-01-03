//variables

with_base = false;
with_roof = true;

with_support = true;
support_thickness = 0.3;

wall_thickness = 8;

height = 180;
width = 155;
depth = 155;

hole_height = 45;
hole_radius = 15;

with_bar = true;
bar_radius = 4;
bar_length = 25;

roof_base_combiner_height = 20;
roof_base_security_margin = 1;
roof_height = 90;
roof_overhang_side = 10;
roof_overhang_front = 25;

with_air_supply_holes = true;
air_hole_radius = 3;
air_hole_margin = 40;

with_bottom_water_drop_line = true;

with_side_screw_holes = true;
screw_hole_radius = 2;


with_mounting_hooks = true;
mounting_hook_size = 15;

color("Blue") {


//
//basement
//
if(with_base) {
difference() {
        union() {
            //body
            difference() {
                roundedcube([width,depth,height], false, wall_thickness/2, "zmin");
                translate([wall_thickness,wall_thickness,wall_thickness])
                cube([width-wall_thickness*2,depth-wall_thickness*2,height]);
            }
        
            //roof base combiner
        translate([0,0,height-roof_base_combiner_height])difference() {
            //combiner outer
            translate([roof_base_security_margin+wall_thickness,roof_base_security_margin+wall_thickness,0])
                cube([width-wall_thickness*2-roof_base_security_margin*2,depth-wall_thickness*2-roof_base_security_margin*2,roof_base_combiner_height*2]);
            //cutoff inner combiner
            translate([wall_thickness*1.5,wall_thickness*1.5,-1]) 
                cube([width-wall_thickness*3,depth-wall_thickness*3,roof_base_combiner_height*2+10]);
            
            
            
        }
        
        
        }



    //air supply holes
    if(with_air_supply_holes) {
        translate([0,0,-1]) {
            translate([air_hole_margin,air_hole_margin,0])
                cylinder(h= 2*wall_thickness, r = air_hole_radius);
            translate([width-air_hole_margin,air_hole_margin,0])
                cylinder(h= 2*wall_thickness, r = air_hole_radius);
            translate([air_hole_margin,depth-air_hole_margin,0])
                cylinder(h= 2*wall_thickness, r = air_hole_radius);
            translate([width-air_hole_margin,depth-air_hole_margin,0])
                cylinder(h= 2*wall_thickness, r = air_hole_radius);
        }
    }



    //bottom water drop line
    if(with_bottom_water_drop_line) {
        translate([0,0,-wall_thickness/4]) {
            translate([air_hole_margin/2,air_hole_margin/2,0])rotate([0,0,0])cube([width-air_hole_margin, wall_thickness/2,wall_thickness/2]);
            translate([air_hole_margin/2,depth-air_hole_margin/2,0])rotate([0,0,0])cube([width-air_hole_margin+wall_thickness/2, wall_thickness/2,wall_thickness/2]);
            
            translate([air_hole_margin/2,air_hole_margin/2,0])rotate([0,0,0])cube([wall_thickness/2, depth-air_hole_margin, wall_thickness/2]);
            translate([width-air_hole_margin/2,air_hole_margin/2,0])rotate([0,0,0])cube([wall_thickness/2, depth-air_hole_margin, wall_thickness/2]);
        }
    }
    
    
    //screw holes for the roof on the side
    if(with_side_screw_holes) {
        translate([wall_thickness/2,depth/2,height+roof_base_combiner_height/2]) 
            rotate([0,90,0])
                cylinder(h=wall_thickness*4, r=screw_hole_radius,center = true);
        translate([width-wall_thickness/2,depth/2,height+roof_base_combiner_height/2]) 
            rotate([0,90,0])
                cylinder(h=wall_thickness*4, r=screw_hole_radius,center = true);
    }

    

}



//mounting hooks on the rear
if(with_mounting_hooks) {
    translate([width/2-mounting_hook_size,depth,height/8]) {
        difference() {
            cube([mounting_hook_size*2,mounting_hook_size,mounting_hook_size*3]);
            translate([0,0,mounting_hook_size])cube([mounting_hook_size*2,mounting_hook_size/2,mounting_hook_size]);
            rotate([40,0,0])translate([0,0,-mounting_hook_size])cube([mounting_hook_size*2,mounting_hook_size*2,mounting_hook_size]);
            translate([0,0,mounting_hook_size*3])rotate([-40,0,0])cube([mounting_hook_size*2,mounting_hook_size*2,mounting_hook_size]);
        }

    }
    translate([width/2-mounting_hook_size,depth,7*height/8-3*mounting_hook_size]) {
        difference() {
            cube([mounting_hook_size*2,mounting_hook_size,mounting_hook_size*3]);
            translate([0,0,mounting_hook_size])cube([mounting_hook_size*2,mounting_hook_size/2,mounting_hook_size]);
            rotate([40,0,0])translate([0,0,-mounting_hook_size])cube([mounting_hook_size*2,mounting_hook_size*2,mounting_hook_size]);
            translate([0,0,mounting_hook_size*3])rotate([-40,0,0])cube([mounting_hook_size*2,mounting_hook_size*2,mounting_hook_size]);
        }

    }
}



} //if with base











//
//roof
//
if(with_roof) {
translate([width+50,0,0]) {


    difference() {            
        //cutoff inner
        difference() {
            union() {
                //main part of the roof
                roundedcube([width,depth,roof_height],false,wall_thickness/2,"z");
                //hole eyecandy
                translate([width/2,0,hole_height])
                    rotate([0,45,0])
                        roundedcube([50,wall_thickness*2,50], true, wall_thickness/2, "ymin");
                    //bar
                if(with_bar) {
                    translate([width/2,-bar_length/2,hole_height-hole_radius-6])
                        rotate([90,0,0])
                            cylinder (h = bar_length, r=bar_radius, center = true);
                }
                                
                
                }
            translate([wall_thickness,wall_thickness,-1])
                cube([width-wall_thickness*2,depth-wall_thickness*2,200]);
        }

        //cutoff for diagonal roof
        translate([-roof_overhang_side,-roof_overhang_front,roof_height])
            rotate([-10,0,0])
                cube([width+roof_overhang_side*2,depth+roof_overhang_front+50,wall_thickness*100]);   
         
     
             //hole
        translate([width/2,wall_thickness/2,hole_height])
            rotate([90,0,0]) {
                cylinder (h = wall_thickness*4, r=hole_radius, center = true);
            }
            
             //screw holes for the roof on the side
    if(with_side_screw_holes) {
        translate([wall_thickness*1.5,depth/2,roof_base_combiner_height/2]) 
            rotate([0,90,0])
                cylinder(h=wall_thickness*4, r=screw_hole_radius,center = true);
        translate([width-wall_thickness*1.5,depth/2,roof_base_combiner_height/2]) 
            rotate([0,90,0])
                cylinder(h=wall_thickness*4, r=screw_hole_radius,center = true);
    }
        
    }
    

    
//actual roof
translate([-roof_overhang_side,-roof_overhang_front,roof_height])
    rotate([-10,0,0])
        roundedcube([width+roof_overhang_side*2,depth+roof_overhang_front,wall_thickness], false, wall_thickness/4, "all");

roof_eyecandy_size = 30;
//eyecandy for roof
translate([-roof_overhang_side,-roof_overhang_front,roof_height+wall_thickness])
    rotate([-10,0,0]) {
        translate([roof_overhang_side+width/8-roof_eyecandy_size/2,0,0])roundedcube([roof_eyecandy_size,depth+roof_overhang_front,wall_thickness/2], false, wall_thickness/4, "zmin");
        translate([roof_overhang_side+width/2-roof_eyecandy_size/2,0,0])roundedcube([roof_eyecandy_size,depth+roof_overhang_front,wall_thickness/2], false, wall_thickness/4, "zmin");
        translate([width+roof_overhang_side-width/8-roof_eyecandy_size/2,0,0])roundedcube([roof_eyecandy_size,depth+roof_overhang_front,wall_thickness/2], false, wall_thickness/4, "zmin");
    } 
   
   
   

//support for roof
if(with_support) {
    translate([width/2,-bar_length,0]) cube([support_thickness,bar_length,hole_height-hole_radius-10]);
    cube([width,depth,support_thickness]);
}

   
   
    
}


}//if with roof

}






//Used from https://danielupshaw.com/openscad-rounded-corners/
// Higher definition curves
$fs = 0.2;

module roundedcube(size = [1, 1, 1], center = false, radius = 5, apply_to = "all") {
	// If single value, convert to [x, y, z] vector
	size = (size[0] == undef) ? [size, size, size] : size;

	translate_min = radius;
	translate_xmax = size[0] - radius;
	translate_ymax = size[1] - radius;
	translate_zmax = size[2] - radius;

	diameter = radius * 2;

	module build_point(type = "sphere", rotate = [0, 0, 0]) {
		if (type == "sphere") {
			sphere(r = radius);
		} else if (type == "cylinder") {
			rotate(a = rotate)
			cylinder(h = diameter, r = radius, center = true);
		}
	}

	obj_translate = (center == false) ?
		[0, 0, 0] : [
			-(size[0] / 2),
			-(size[1] / 2),
			-(size[2] / 2)
		];

	translate(v = obj_translate) {
		hull() {
			for (translate_x = [translate_min, translate_xmax]) {
				x_at = (translate_x == translate_min) ? "min" : "max";
				for (translate_y = [translate_min, translate_ymax]) {
					y_at = (translate_y == translate_min) ? "min" : "max";
					for (translate_z = [translate_min, translate_zmax]) {
						z_at = (translate_z == translate_min) ? "min" : "max";

						translate(v = [translate_x, translate_y, translate_z])
						if (
							(apply_to == "all") ||
							(apply_to == "xmin" && x_at == "min") || (apply_to == "xmax" && x_at == "max") ||
							(apply_to == "ymin" && y_at == "min") || (apply_to == "ymax" && y_at == "max") ||
							(apply_to == "zmin" && z_at == "min") || (apply_to == "zmax" && z_at == "max")
						) {
							build_point("sphere");
						} else {
							rotate = 
								(apply_to == "xmin" || apply_to == "xmax" || apply_to == "x") ? [0, 90, 0] : (
								(apply_to == "ymin" || apply_to == "ymax" || apply_to == "y") ? [90, 90, 0] :
								[0, 0, 0]
							);
							build_point("cylinder", rotate);
						}
					}
				}
			}
		}
	}
}


