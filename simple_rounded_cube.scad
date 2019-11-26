module sr_cube(size=[1,1,1],radius=0.5,corners=[1,1,1,1]) {
    difference(){    
    cube(size);
    
        if(corners[0])
        translate([radius,radius,0])rotate([0,0,180])difference(){
                cube([radius*2,radius*2,size[2]]);
                cylinder(size[2],radius,radius);
        }
        if(corners[1])
        translate([size[0]-radius,radius,0])rotate([0,0,270])difference(){
                cube([radius*2,radius*2,size[2]]);
                cylinder(size[2],radius,radius);
        }
        if(corners[2])
        translate([size[0]-radius,size[1]-radius,0])rotate([0,0,0])difference(){
                cube([radius*2,radius*2,size[2]]);
                cylinder(size[2],radius,radius);
        }
        if(corners[3])
        translate([radius,size[1]-radius,0])rotate([0,0,90])difference(){
                cube([radius*2,radius*2,size[2]]);
                cylinder(size[2],radius,radius);
        }
        }
        
}


//sr_cube([20,20,5], radius=4,corners=[0,0,0,0]);