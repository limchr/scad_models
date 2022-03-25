$fn = 90;

//printing error
e = 0.30;

//horizontal pitch
hp = 5.08;

//effective module height
mh = 128.5;

//screw hole radius
shr = 1.6;

//screw margin from top/bottom borders
smv = 3;

//horizontal screw margin
smh = 7.5;

//module strength (depth)
ms = 2.0;

//screw distance
sd = mh - 2*smv;

// rail definition

//rail height
rh = 10;

//rail depth
rd = 40;

//rail screw position xy
rsx = 20;
rsy = rh/2;

//rail screw radius
rsr = 2.1;



//total height
th = sd + rh;

//depth
td = 100;

//strength
s = 5;

//wood screw radius
wsr = 1.5;

// wood holder length
whl = td-rd;

// num screws x
nsx = 2;

// num screws z
nsz = 5;

//screw hole margin x
smx = 3*s;

// screw distance x
sdx = ((whl-smx*2)/(nsx-1));

//screw hole margin x
smz = 3*s;

// screw distance x
sdz = ((th-smz*2)/(nsz-1));


// wood screw hole
module wsh(){
    cylinder(20,wsr,wsr);
    translate([0,0,s]) cylinder(20,wsr*2,wsr*2);
    translate([0,0,s/2]) cylinder(s/2,wsr,wsr*2);
}

// wood screw holder
module we(length, width, ns, sd, sm) {
    difference(){
        cube([width,length,width+s]);
        translate([width,0,s+width]) rotate([-90,0,0]) cylinder(length,20,20);
        for(i = [0:1:ns-1]) {
            translate([width/2,sm+sd*i,0])  wsh();
        }
    }
}

module case(){

difference() {
    cube([s,td,th]);
    translate([0,rsx,rsy]) rotate([0,90,0]) cylinder(s,rsr,rsr);
    translate([0,rsx,th-rsy]) rotate([0,90,0]) cylinder(s,rsr,rsr);
}

translate([s,rd,0]) we(whl, 20, nsx, sdx, smx);
translate([s,td,th]) rotate([180,0,0]) we(whl, 20, nsx, sdx, smx);
translate([s,td,0]) rotate([90,0,0]) we(th, 20, nsz, sdz, smz);

}


case();

translate([450,0,0])mirror([1,0,0]) case();