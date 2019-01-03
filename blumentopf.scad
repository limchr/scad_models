print_bottom = false;
print_top = true;

h = 60;
rb = 45;
rt = rb;
s = 2;

fn = 60;

m=0.5;

hx = 10;
hy = 10;
hr = 1;

whr = 30;
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
    translate([0,0,h]) {
        difference() {
                difference() {
                    cylinder(s,rt+s,rt+s,$fn=fn); //top
                    cylinder(s,rt-m-s,rt-m-s,$fn=fn); //cut top
                    translate([rb+s+m,0,0]) cylinder(h-s-m,whr+m,whr+m,$fn=fn); //cut off
                } 
        }

    }

    difference() {
        translate([0,0,s+m]) cylinder(h-s-m,rt-m,rt-m,$fn=fn); //outer
        translate([0,0,s+m+s]) cylinder(h-s-m,rt-m-m,rt-m-m,$fn=fn); //inner
        translate([rb+s,0,s+m]) cylinder(h-s-m,whr+m,whr+m,$fn=fn); //cut off
        for(x = [0:hx]) {
            for(y = [0:hy]) {
                translate([(rb)/2-x*(rb/hx),(rb)/2-y*(rb/hy),s+m]) cylinder(s,hr,hr); //water holes
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