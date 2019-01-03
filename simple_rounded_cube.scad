module sr_cube(size=[1,1,1],radius=0.5) {
    difference(){    
    cube(size);
    
        translate([radius,radius,0])rotate([0,0,180])difference(){
                cube([radius*2,radius*2,size[2]]);
                cylinder(size[2],radius,radius);
        }
        translate([size[0]-radius,radius,0])rotate([0,0,270])difference(){
                cube([radius*2,radius*2,size[2]]);
                cylinder(size[2],radius,radius);
        }
        translate([size[0]-radius,size[1]-radius,0])rotate([0,0,0])difference(){
                cube([radius*2,radius*2,size[2]]);
                cylinder(size[2],radius,radius);
        }
        translate([radius,size[1]-radius,0])rotate([0,0,90])difference(){
                cube([radius*2,radius*2,size[2]]);
                cylinder(size[2],radius,radius);
        }
        }
        
}
