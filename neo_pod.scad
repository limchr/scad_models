//error of printer in mm
e = 0.3;

//strength of outer walls
so = 1.2;
//strength of inner walls
si = 0.8;

//number of edges
ne = 12;
//height
h = 40;
//outer width
w = 160;
//width ratio of inner soil holder
wr = 0.8;

//number of water holes
nwh = ne/2;
//water hole radius
whr = 1.5;

//outer width multipliers for polynomial shape
owm = [1.291,1.282,1.270,1.256,1.235,1.206,1.169,1.130,1.095,1.065,1.045,1.030,1.021,1.015,1.011,1.007,1.004,1.002,1,1,1,1,1,1,1,1,1,1,1];
owmm = 4;


//
//do not change
//

//do not change this inner width (width of soil holder)
wi = wr * w;
//do not change this radius of outer width
r = w/2;
//do not change this radius of inner width
ri = wi/2;
//do not change half degree
hd = (360/ne)/2;
//do not change height step
hs = h/(len(owm)-1);


    difference() {
    //main cylinder
    for(i = [0:len(owm)-2]) {
        echo(i);
        translate([0,0,i*hs])cylinder(hs,(owm[i]+owmm-1)/owmm*r,(owm[i+1]+owmm-1)/owmm*r,$fn=ne);
    }
    
    //main cutout
    translate([0,0,so]) cylinder(h,r-so,r-so,$fn=ne);    
    }
    
    translate([0,0,so]) 
        difference() {
            cylinder(h-so,ri+si+e,ri+si+e,$fn=ne);
            cylinder(h,ri+e,ri+e,$fn=ne);
            
            for(i = [-90:360/nwh:269]) {
                translate([0,0,whr])rotate([90,0,i])cylinder(r,whr,whr);
            }
               

            
        }



