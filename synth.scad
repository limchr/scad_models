//width
w = 250;
//height (y)
h = 200;
//depth (z)
d = 40;
//strength (thickness of outer walls)
s = 2;

//radius of edges
r = 15;

//screw holder width
sm = 8;
//hole radius
hr = 2;

//key width
kw = 23;
//key length
kl = 150;
//small key length
skl = 90;
//key gap
kg = 0.7;
//key depth (depth of upper plate
kd = 3;

slider_length = 55;

slider_y = 40;
knob_y = (h+slider_length)/2;
knob2_y = h-40;



//margin of keys begin
center_keys_margin = (w-(7*kw)-kg)/2;


//push button height
pbh = 5;

//include <roundedcube.scad>

module myroundedcube(size=[1,1,1],radius=0.5) {
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


difference(){
//upper plate
myroundedcube([w,h,kd],radius=r);

//cut off big keys
for(i = [0:7])
    translate([center_keys_margin+i*kw,0,0])cube([kg,kl,kd]);

//cut holes for small keys
for(i = [1,2,4,5,6])
    translate([center_keys_margin+i*kw-(kw+2*kg)/4,kl-skl,0])cube([kw/2+2*kg,skl,kd]);


translate([center_keys_margin/2-1.5,slider_y,0]) cube([3,slider_length,kd]);
translate([center_keys_margin/2,knob_y,0]) cylinder(3.5,3.5,kd);
translate([center_keys_margin/2,knob2_y,0]) cylinder(5,5,kd);

translate([w-center_keys_margin/2-1.5,slider_y,0]) cube([3,55,kd]);
translate([w-center_keys_margin/2,knob_y,0]) cylinder(3.5,3.5,kd);
translate([w-center_keys_margin/2,knob2_y,0]) cylinder(5,5,kd);

//holes at the edges
        translate([r*0.6,r*0.6,0])cylinder(kd,hr,hr*2);
        translate([w-r+r*0.4,r*0.6,0])cylinder(kd,hr,hr*2);
        translate([r*0.6,h-r+r*0.4,0])cylinder(kd,hr,hr*2);
        translate([w-r+r*0.4,h-r+r*0.4,0])cylinder(kd,hr,hr*2);

        

}//difference

//small keys
for(i = [1,2,4,5,6])
    translate([center_keys_margin+i*kw-(kw-2*kg)/4,kl-skl+kg,0]) cube([kw/2,skl-kg,kd]);


//bottom
translate([0,0,-d-10]){
    difference(){
        union(){
            myroundedcube([w,h,d],radius=r);
        }
            translate([s,s,s])myroundedcube([w-2*s,h-2*s,d-s],radius=r);
            translate([center_keys_margin,0,d-s]) cube([7*kw+kg,s,s]);
    }
    difference(){
        union(){
            intersection(){translate([r,r,0])cylinder(d,r,r);cube([r,r,d]);}
            translate([0,h,0])rotate([0,0,270])intersection(){translate([r,r,0])cylinder(d,r,r);cube([r,r,d]);}
            translate([w,0,0])rotate([0,0,90])intersection(){translate([r,r,0])cylinder(d,r,r);cube([r,r,d]);}
            translate([w,h,0])rotate([0,0,180])intersection(){translate([r,r,0])cylinder(d,r,r);cube([r,r,d]);}
        }
        translate([r*0.6,r*0.6,0])cylinder(d,hr,hr);
        translate([w-r+r*0.4,r*0.6,0])cylinder(d,hr,hr);
        translate([r*0.6,h-r+r*0.4,0])cylinder(d,hr,hr);
        translate([w-r+r*0.4,h-r+r*0.4,0])cylinder(d,hr,hr);
        
        
        
    }
    
    translate([center_keys_margin,s,0]) cube([7*kw+kg,10,d-pbh]);
    translate([center_keys_margin,kl-skl,0]) cube([7*kw+kg,10,d-pbh]);

    
}