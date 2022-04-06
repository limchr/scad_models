$fn = 40;

//printing error
e = 0.3;
// strength
s = 5;

//total length
tl = 200-e;
//total height
th = 30;

// number of elements
n = 8;
//width of element
w = 20;
//length of element
l = 70;

// cable width
cw = 5.07+e*2;

// number of holes
nh = 3;
// hole diameter
hd = 4+e;
//hole distance
hdist = 85;
//hole margin top
hmt = 8;




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



module hook() {
    translate([0,0,0]) {
        cube([w,l,s]);
        translate([w/2-s/2,0,s]) cube([s,l,s]);
        translate([0,l,0]) rotate([60,0,0]) sr_cube([w,s*3,s],radius=s/2,corners=[0,0,1,1]);
        translate([w/2+s/2,0,s*2]) rotate([0,-90,0]) linear_extrude(s)polygon([[0,0],[0,s*2],[s*2,0]]);
    }
}

translate([(tl-w*n-cw*(n-1))/2,0,0]) {
    for(i = [0:1:n-1]) {
        translate([i*(w+cw),0,0]) hook();
    }
}

difference() {
    cube([tl,s,th]);
    translate([(tl-hdist*(nh-1))/2,0,0])
    for(i = [0:1:nh-1]) {
        translate([i*hdist,s,th-hmt])rotate([90,0,0]) {
            cylinder(s,hd/2,hd/2);
            cylinder(s/2,hd,hd/2);
            }
        
    }



}
