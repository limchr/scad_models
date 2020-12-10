//strength of walls
s = 2;

//error of printer in mm
e = 0.3;

//height
h = 80;

//outer width
w = 150;
//inner width (width of soil holder)
wi = 80;

//number of edges
ne = 5;

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
    translate([0,0,s]) cylinder(h,r-s,r-s,$fn=ne);    
    }
    
    translate([0,0,s]) 
        difference() {
            cylinder(h-s,ri+s+e,ri+s+e,$fn=ne);
            cylinder(h,ri+e,ri+e,$fn=ne);
            
            for(i = [-90:360/nwh:269]) {
                echo(i);
                translate([0,0,whr])rotate([90,0,i])cylinder(ri,whr,whr);
            }
               

            
        }



