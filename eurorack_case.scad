$fn = 50;

//horizontal pitch unit
hp = 5.08;

//printing error
e = 0.45;

//effective module height
mh = 128.5;
//screw margin from top/bottom borders
smv = 3;
//screw distance
sd = mh - 2*smv;


// rail definition

//rail height
rh = 10;

//rail depth
rd = 38;


// some rails have cutouts. Use the 2 parameters for defining them to have a perfect fit strengtening the rail
// rail cutout in z direction
rcoz = 3;
// rail cutout in x direction (from the front view)
rcox = 8;


//rail screw position xy (from outside wall)
rsp = [[12,4],[32,4]];

//rail screw radius
rsr = 2+e;
//rail screw head depth
rshd = 4+e;
//rail screw head radius
rshr = 3.5+e;


//module screw margin in z direction (the module nuts in the rails can have a vertical margin that have to taken into account for calculating the total height of the case to be in eurorack standard)
mnmz = rh/2;

//total height
th = sd + (rh-mnmz)*2;
echo("TOTAL HEIGHT: ",th);


//depth
td = 120;

//strength
s = 8;

//wood screw radius
wsr = 1.5;
//wood screw head radius
wshr = 3.5 + e;
//wood screw hed depth
wshd = 3;

// wood holder length
whl = td-rd-s;

// num screws x
nsx = 3;

// num screws z
nsz = 5;

//screw hole margin x
smx = 2*s;

// screw distance x
sdx = ((whl-smx*2)/(nsx-1));

//screw hole margin x
smz = 2*s;

// screw distance x
sdz = ((th-smz*2)/(nsz-1));

// for calculating dimensions of needed wood and for displaying complete case

// wood strength (for calculating wood dimensions)
ws = 9;

// rail length (for calculating wood dimensions)
rl = 87*hp;

// wood total length
wtl = rl+2*s;

// wood total depth
wtd = td+ws;

// wood total height
wth = th;

// wood screw hole
module wsh(){
    cylinder(20,wsr,wsr);
    translate([0,0,s]) cylinder(20,wshr,wshr);
    translate([0,0,s-wshd]) cylinder(wshd,wsr,wshr);
}

// wood screw holder
module we(length, width, ns, sd, sm,flattenedge=false) {
    difference(){
        cube([width,length,width+s]);
        translate([width,0,s+width]) rotate([-90,0,0]) cylinder(length,20,20);
        for(i = [0:1:ns-1]) {
            translate([width*0.66,sm+sd*i,0])  wsh();
        }
        //if(flattenedge) translate([0,0,rh]) rotate([45,0,0]) cube([width,width*2,width*2]);
    }
}


module case(){
translate([s,0,rh+e]) cube([hp,rd,th-2*rh-2*e]);
translate([s,rcox,rh-rcoz+e]) cube([hp,td-rcox,th-2*rh+rcoz*2-2*e]);
difference() {
    cube([s,td,th]);
    for(i = [0:1:len(rsp)-1]) {
        translate([0,rsp[i][0],rsp[i][1]]) rotate([0,90,0]) {cylinder(rshd,rshr,rshr);cylinder(s,rsr,rsr);}
        translate([0,rsp[i][0],th-rsp[i][1]]) rotate([0,90,0]) {cylinder(rshd,rshr,rshr);cylinder(s,rsr,rsr);}
    }
}

translate([s,rd,0]) we(whl, 20, nsx, sdx, smx,true);
translate([s,td-whl-s,th]) mirror([0,1,0]) rotate([180,0,0]) we(whl, 20, nsx, sdx, smx,true);
translate([s,td,0]) rotate([90,0,0]) we(th, 20, nsz, sdz, smz);

}




//case();
//translate([wtl,0,0])mirror([1,0,0]) case();

print_case = false;

echo("Wood dimensions needed for rail length",rl,"and wood strength",ws);
echo("2x (top and bottom) ",wtl," x ", wtd);
echo("1x (rear) ",wtl," x ", wth);

if(print_case) {
color("blue") {
    translate([0,0,-ws])cube([wtl,wtd,ws]);
    translate([0,0,th])cube([wtl,wtd,ws]);
    translate([0,td,0])cube([wtl,ws,wth]);
    }
}


module middle_holder() {
                translate([0,0,-s/2]) we(20, 20, 1, sdx, 10,flattenedge=false);
            translate([0,20,th-2*e+s/2])rotate([180,0,0])we(20, 20, 1, sdx, 10,flattenedge=false);
            difference() {
                translate([-s,0,-s])cube([10,20,th+s*2]);
                translate([-s,10,th/3]) rotate([0,90,0])wsh();
                translate([-s,10,th*2/3]) rotate([0,90,0])wsh();
            }

    
    }

translate([0,0,0]) {
    intersection() {
        translate([s,0,0]) middle_holder();
            translate([0,0,e])cube([30,20,th-2*e]);
        
    }
}
