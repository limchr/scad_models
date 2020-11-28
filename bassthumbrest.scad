//width
w = 13;
//length
l = 64;
//height
h = 12;
//border radius
r = h;
//screw hole distance
hd = 32;
//screw hole radius
hr = 2.5;
//screw head cutout depth and bottom/top radius
hr2 = [3.2,hr,4.75];
//optional screw offset x
smx = 0;
//optional screw offset y
smy = 0;




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

module screw_cutout() {
    cylinder(h,hr,hr,$fn=20); 
    translate([0,0,h-hr2[0]]) cylinder(hr2[0],hr2[1],hr2[2],$fn=20);
}

difference(){
translate([0,w,0])rotate([90,0,0])sr_cube([l,h,w],corners=[0,0,1,1],radius=r,$fn=60);
translate([(l-hd)/2+smx,w/2+smy,0]) screw_cutout(); 
translate([l-(l-hd)/2+smx,w/2+smy,0]) screw_cutout();

}