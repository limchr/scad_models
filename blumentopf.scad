print_bottom = false;
print_top = true;

//can be set to a higher number to have a round shape, low number for debugging
fn = 100;
$fn = fn;


//height
h = 50;

//radius (height and bottom must be same)
rb = 45;
rt = rb;
//strength of outer walls
s = 1.2;

//eps for distance between top and bottom piece
m=1;

//number of holes in x direction
hx = 7;
//number of holes in y direction
hy = 10;
//hole radius
hr = 1.5;

//radius of water container
whr = 20;
//hole radius from water container to flower pot
hor = 5;

//outer
if(print_bottom) {
    difference() {
    union() {
        difference() {
            cylinder(h,rb+s,rt+s,$fn=fn);
            translate([0,0,s]) cylinder(h,rb,rt,$fn=fn);
        }
        translate([rb+s,0,whr]) union() {sphere(whr);cylinder(h-whr,whr,whr,$fn=fn); }
    }

translate([rb+s,0,whr]) {
    cylinder(h-whr,whr-s,whr-s,$fn=fn); 
    sphere(whr-s);
    translate([-whr,0,-whr+hor+s])rotate([0,90,0])cylinder(whr,hor,hor);
    }

}
    
}


//inner
if(print_top) {
translate([0,0,30]) {
    translate([0,0,h-s]) {
        difference() {
                difference() {
                    cylinder(s*2,rt-m,rt+s,$fn=fn); //top
                    cylinder(s*2,rt-s-m,rt-m,$fn=fn); //cut top
                    translate([rb+s+m,0,0]) cylinder(h-s-m,whr+m,whr+m,$fn=fn); //cut off
                } 
        }

    }

    difference() {
        translate([0,0,s+m]) cylinder(h-s-m,rt-m,rt-m,$fn=fn); //outer
        translate([0,0,s+m+s]) cylinder(h-s-m,rt-m-m,rt-m-m,$fn=fn); //inner
        translate([rb+s,0,s+m]) cylinder(h-s-m,whr+m,whr+m,$fn=fn); //cut off
        
        //hole distance x
        hdx = rb / hx;
        hdy = rb / hy;
        
        for(x = [0:hx-1]) {
            for(y = [0:hy-1]) {
                translate([(rb)/2-hdx*0.5-x*hdx,(rb)/2-hdy*0.5-y*hdy,s+m]) cylinder(s,hr,hr,$fn=5); //water holes
            }
        }
        
        
    }

    
    intersection() {
        translate([rb+s,0,s+m]) cylinder(h-s-m,whr+s*2,whr+s*2,$fn=fn);
            difference() {
                translate([0,0,s+m]) cylinder(h-s-m,rt-m,rt-m,$fn=fn); //outer
                translate([rb+s,0,s+m]) cylinder(h-s-m,whr+m,whr+m,$fn=fn); //cut off
            }
    }
    
}

}