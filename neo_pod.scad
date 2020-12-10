//strength of outer walls
so = 1.2;
//strength of inner walls
si = 0.8;


//error of printer in mm
e = 0.3;

//height
h = 80;

//outer width
w = 260;
//inner width (width of soil holder)
wi = 220;

//number of edges
ne = 3;

//number of water holes
nwh = ne;
//water hole radius
whr = 2;


//do not change this
r = w/2;
//do not change this
ri = wi/2;

//half degree
hd = (360/ne)/2;

    difference() {
    //main cylinder
    cylinder(h,r,r,$fn=ne);
    //main cutout
    translate([0,0,so]) cylinder(h,r-so,r-so,$fn=ne);    
    }
    
    translate([0,0,so]) 
        difference() {
            cylinder(h-so,ri+si+e,ri+si+e,$fn=ne);
            cylinder(h,ri+e,ri+e,$fn=ne);
            
            for(i = [-90:360/nwh:269]) {
                echo(i);
                translate([0,0,whr])rotate([90,0,i])cylinder(r,whr,whr);
            }
               

            
        }



