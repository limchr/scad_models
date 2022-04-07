$fn = 40;
e = 0.3;
s = 1;
r = 7;
bh = 10;
d = 1.5;
hr = 1.5;

translate([0,0,5+2]) difference() {
cylinder(2, 500, 500);
translate([0,0,-0.01])cylinder(2.1,r,r);
}

// main button
translate([0,0,s+d])difference(){
    union() {
        cylinder(bh+s-d,r-e,r-e);
        cylinder(s, r+4*e, r+4*e);
    }
    cylinder(bh-d,r-e-s,r-e-s);
}

// bottom part
difference(){
    union() {
        cylinder(s*2+d,r+6*e+s,r+12*e+s);        
    }
    translate([0,0,s]) cylinder(s+d+0.01,r+6*e,r+6*e);
    translate([r-s-hr-e,0,0]) cylinder(s,hr,hr);
}