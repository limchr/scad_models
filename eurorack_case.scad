$fn = 40;

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
nsx = 3;

// num screws z
nsz = 5;

difference() {
cube([s,td,th]);
translate([0,rsx,rsy]) rotate([0,90,0])cylinder(s,rsr,rsr);
}

translate([s,rd,0]) 
difference(){
    cube([20,whl,20+s]);
    translate([20,0,s+20]) rotate([-90,0,0]) cylinder(whl,20,20);
    translate([20/2,whl/2,0]) {
        cylinder(20,wsr,wsr);
        translate([0,0,s]) cylinder(20,wsr*2,wsr*2);
        translate([0,0,s/2]) cylinder(s/2,wsr,wsr*2);
        }
}