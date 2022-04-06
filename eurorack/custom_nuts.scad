$fn = 40;

// error term for screw radius (has to be tested for each printer)
es = 0.05;
ed = 0.45;

d = 8;
s = 4;

shr = 1.5;

//strength of outside wall of rail
srw = 1;
//strength of lid holding the square nut
sl = 1;
//desired margin of screw hole to outside rail
//3 if using an original Eurorack rail, which is 6mm)
dm = 5; 


//minimum possible margin
mm = srw+sl+shr;
m = max(dm,mm);

if(mm > dm) {
    echo("ATTENTION: Desired Margin not possible, taking minimum margin of", m);
}


//height addition that comes out of the rails
ha = 1.5;

//total length is 87hp for 19' rack
nhp = 44; //45 44

//hp
hp = 5.08;

difference(){
    union() {
        //rail inset
        translate([ed,ed,0]) cube([nhp*hp-2*ed,d-2*ed,s]);
        //height addition
        translate([ed,sl+ed,s]) cube([nhp*hp-2*ed,d-2*(sl+ed),ha]);
    }
    for(i = [0:1:nhp-1]) {
        translate([i*hp+hp/2,m-srw,0])cylinder(s+ha,shr+es,shr+es);
    }

}