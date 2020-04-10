//
// global variables
//

//change this to a higher number for smoother circles (better chain movement)
$fn=50;

//adjust this printer error tolerances if necessary (should fit for most printers)
eps = 0.25; //perfect and tight fit
eps2 = 0.4; //looser fit
eps3 = 0.6; //loose fit


//
// presets for different cable chain sizes
//

//config for small chain
//width
w = 10;
//height
h = 8;
//length
l = 20;
//strength of parts
s = 1;

////config for normal size chain
////width
//w = 16;
////height
//h = 12;
////length
//l = 30;
////strength of parts
//s = 1;

////config for big size chain
////width
//w = 20;
////height
//h = 14;
////length
//l = 40;
////strength of parts
//s = 1;


//
// common variables
//

//radius of joints
r = h / 2;
//radius of outer joints (must be larger than r)
ro = r + eps2;


//connector depth of outer joint (must be smaller than cd
cdo = 1;
//connector depth
cdi = cdo + eps2;

//cutout lengths for sides (important for cables while bended)
co1 = r*1.2;
co2 = r*1.55;


//pin radius
pr = h / 5;
//pin radius top (smaller for cone shape - this is better for combined printing)
prt = pr - eps;

//hole radius outer (must be larger than pri)
hro = pr + eps;

//pin length
pl = cdo * 0.3 + (2*eps2);


//
// variables for end connector 1
//

//screw hole radius
e1_shr = (3+eps)/2;


//
// variables for end connector 2
//

//screw hole radius
e2_shr = (3+eps)/2;
//l of screw holder
e2_l = l/1.5;
//number of screw holes (either 1 or 2)
e2_num_holes = 2;


//
// variables for end connector 3
//

//screw hole radius
e3_shr = (3+eps)/2;
//l of screw holder
e3_l = l/1.5;
//number of screw holes (either 1 or 2)
e3_num_holes = 2;


//
// variables for end connector 4
//

//screw hole radius
e4_shr = (3+eps)/2;
//l of screw holder
e4_l = w;


//
// cable chain connectors modules are defined here
//
// there are connectors for different types of endpieces
// also there are uni-directional and bidirectional connectors available

module male_connector(){  
    difference() {
        intersection(){
            translate([0,-h/2,0])cube([ro+r,h,w]);
            union(){
                translate([ro,0,0]) cylinder(w,r,r);
                translate([0,-h/2,0]) cube([ro,h,w]);
            } //union
        } //intersection
        //main inner part
        translate([0,-h/2+s,s+cdi]) cube([ro+r,h-2*s,w-2*s-2*cdi]);
        //holes
        translate([ro,0,0]) cylinder(w,hro,hro);
        //cutout joint 1
        translate([ro,0,w-cdi]) cylinder(cdi,ro,ro);
        translate([ro,0,0]) cylinder(cdi,ro,ro);
        //outer cutouts3
        translate([ro+r-co1,-h/2,cdi+s]) cube([co1,h,w-(cdi+s)*2]);
    } //difference

}

module female_connector(){
    difference() {
            union(){
            translate([0,-h/2,0]) cube([ro,h,w]);
            translate([ro,0,0]) cylinder(w,r,r);
            } //union
        //main inner part
        translate([0,-h/2+s,s+cdi]) cube([r+ro,h-2*s,w-2*s-2*cdi]);
        //cutout joint 2
        translate([ro,0,cdo]) cylinder(w-2*cdo,ro,ro);
        //outer cutouts
        translate([r+ro-co2,-h/2,cdo]) cube([co2,h,w-cdo*2]);
    } //difference
    translate([ro,0,cdo]) cylinder(pl,pr,prt);
    translate([ro,0,w-cdo-pl]) cylinder(pl,prt,pr);
}

module male_connector_single(){  
    difference() {
        intersection(){
            translate([0,-h/2,0])cube([ro+r,h,w]);
            union(){
                translate([ro,0,0]) cylinder(w,r,r);
                translate([0,-h/2,0]) cube([ro,h,w]);
            } //union
        } //intersection
        //main inner part
        translate([0,-h/2+s,s+cdi]) cube([ro+r,h-2*s,w-2*s-2*cdi]);
        //holes
        translate([ro,0,0]) cylinder(w,hro,hro);
        //cutout joint 1
        translate([ro,0,w-cdi]) cylinder(cdi,ro,ro);
        translate([0,-r,w-cdi]) cube([ro,ro,cdi]);

        translate([ro,0,0]) cylinder(cdi,ro,ro);
        translate([0,-r,0]) cube([ro,ro,cdi]);

        //outer cutouts
        translate([ro+r-co1,-h/2,cdi+s]) cube([co1,h,w-(cdi+s)*2]);
    } //difference

}

module female_connector_single(){
    difference() {
            union(){
            translate([0,-h/2,0]) cube([ro,h,w]);
            translate([ro,0,0]) cylinder(w,r,r);
            translate([ro,0,w-s]) cube([r,r,s]);
            translate([ro,0,0]) cube([r,r,s]);
            } //union
        //main inner part
        translate([0,-h/2+s,s+cdi]) cube([r+ro,h-2*s,w-2*s-2*cdi]);
        //cutout joint 2
        translate([ro,0,cdo]) cylinder(w-2*cdo,ro,ro);
        //outer cutouts
        translate([r+ro-co2,-h/2,cdo]) cube([co2,h,w-cdo*2]);
    } //difference
    translate([ro,0,cdo]) cylinder(pl,pr,prt);
    translate([ro,0,w-cdo-pl]) cylinder(pl,prt,pr);
}


module end_connector1() {
    difference() {
            translate([0,-h/2,0]) cube([ro+r,h,w]);
            translate([0,-h/2+s,s+cdi]) cube([r+ro,h-s,w-2*s-2*cdi]);
        }
        difference() {
            union() {
        translate([ro+r,-h/2,-r]) cube([s,h,h+w]);
        translate([ro+r,0,-r]) rotate([0,90,0]) cylinder(s,r,r);
        translate([ro+r,0,w+r]) rotate([0,90,0]) cylinder(s,r,r);       
                }
        translate([ro+r,0,-h/2]) rotate([0,90,0])cylinder(s,e1_shr,e1_shr);
        translate([ro+r,0,w+h/2]) rotate([0,90,0])cylinder(s,e1_shr,e1_shr);

            }
}

module end_connector2() {
    difference() {
        union() {
            translate([0,-h/2,0]) cube([e2_l-r,h,s+cdi]);
            translate([e2_l-r,0,0]) cylinder(s+cdi,r,r);
        }
        translate([e2_l-r,0,0]) cylinder(s+cdi,e2_shr,e2_shr);
        if(e2_num_holes == 2) translate([(e2_l-r)/2,0,0]) cylinder(s+cdi,e2_shr,e2_shr);

    }
}

module end_connector3() {
    translate([0,-h/2,0])difference() {
        union() {
            translate([0,0,0]) cube([e3_l-r,s,w]);
            translate([e3_l-r,0,w/2]) rotate([-90,0,0]) cylinder(s,w/2,w/2);
        }
            translate([e3_l-r,0,w/2]) rotate([-90,0,0]) cylinder(s,e3_shr,e3_shr);
        if(e3_num_holes == 2) translate([(e3_l-r)/2,0,w/2]) rotate([-90,0,0]) cylinder(s,e3_shr,e3_shr);
    }
}

module end_connector4() {
    difference() {
            translate([0,-h/2,0]) cube([ro+r,h,w]);
            translate([0,-h/2+s,s+cdi]) cube([r+ro,h-s,w-2*s-2*cdi]);
        }
        difference() {
            union() {
        translate([ro+r,-h/2,0]) cube([s,h+e4_l-w/2,w]);
        translate([ro+r,h/2+w/2,w/2]) rotate([0,90,0]) cylinder(s,w/2,w/2);
                }
        translate([ro+r,h/2+w/2,w/2]) rotate([0,90,0]) cylinder(s,e4_shr,e4_shr);
            }
}

//
// helper functions
//


//creates the center 'tunnel' part of a chain element
module center_connector_part(rl){
    //since connectors have length r + ro, subtract this from actual length
    difference(){
        translate([0,-h/2,0]) cube([rl,h,w]);
        translate([0,-h/2+s,s+cdi]) cube([rl,h-2*s,w-2*(s+cdi)]);
    }
}

//selects a specific connector by a string
module select_connector(s) {
    if(s == "m") {
        male_connector();
    } else if (s == "f") {
        female_connector();
    } else if (s == "ms") {
        male_connector_single();
    } else if (s == "fs") {
        female_connector_single();
    } else if (s == "e1") {
        end_connector1();
    } else if (s == "e2") {
        end_connector2();
    } else if (s == "e3") {
        end_connector3();
    } else if (s == "e4") {
        end_connector4();
    }    
}

//creates a chain element with a left and a right connector
module combined_chain_element(c1,c2) {
    rotate([0,0,180]) select_connector(c1);
    rl = l-2*(r+ro);
    center_connector_part(rl);
    translate([rl,0,0]) select_connector(c2);
}

//creates a full chain with selectable intermediate and end connector types
module chain(num_elements, start_connector = "m", end_connector = "f", left_connector ="m" ,right_connector = "f") {
    for(i = [0:num_elements-1]) {
           translate([i*(l-r*2),0,0]) if(i==0) {
    combined_chain_element(start_connector,right_connector);
            } else if(i==num_elements-1) {
                combined_chain_element(left_connector,end_connector);
            } else {combined_chain_element(left_connector,right_connector);}
    }
}

//
// example chains and chain elements (uncomment for generating them)
//

//// create a unidirectional chain with 10 elements and male female connections as ends
//rotate([90,0,0]) chain(10,"ms","fs","ms","fs");

//// create a bidirectional chain like above
rotate([90,0,0]) chain(10,"m","f","m","f");

//// create a bidirectional chain with different end connector types
//rotate([90,0,0]) chain(10,"e2","e3");

//// creates chain male and female chain elements with all available types of end connectors
//rotate([90,0,0]) combined_chain_element("m","e1");
//rotate([90,0,0]) combined_chain_element("m","e2");
//rotate([90,0,0]) combined_chain_element("m","e3");
//rotate([90,0,0]) combined_chain_element("m","e4");

//rotate([90,0,0]) combined_chain_element("f","e1");
//rotate([90,0,0]) combined_chain_element("f","e2");
//rotate([90,0,0]) combined_chain_element("f","e3");
//rotate([90,0,0]) combined_chain_element("f","e4");
