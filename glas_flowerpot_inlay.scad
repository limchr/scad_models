include<bezier.scad>


//cylinder resolution
$fn = 200;

//strength of walls
s = 1;
//error in printing (one sided)
eps = 0.25;

//inner diameter of glass
d = 75;
//outer diameter addition (for upper holder)
doa = 5;
//outer diameter height (cone shape)
hoa = 5;
//height of inlay
h = 130;
//height of top part (bezier model)
ht = 40;

//water hole dia
hd = 2;
//number of water holes x
hx = 20;
//number of water holes z
hz = 8;
//hole distance in z direction
hdz = 15;

difference(){
    union(){
        cylinder(h,d/2-eps,d/2-eps);
        //translate([0,0,h-hoa]) cylinder(hoa,d/2-eps,d/2-eps+doa);
    translate([0,0,h-s]) bezier_model([[d/2-s+eps,0],[d/2-s+ht/20,ht*0.75],[d/2+ht/2.7,ht]],$fn,s);

        }
    translate([0,0,s]) cylinder(h,d/2-s-eps,d/2-s-eps);
    
    for(z = [0:hz]) {
        for(x = [0:(360/hx):360]) {
            translate([0,0,s+hd/2+z*hdz]) rotate([90,0,x]) cylinder(d,hd/2+eps,hd/2+eps,$fn=6);
            
        }
    }
    
}
