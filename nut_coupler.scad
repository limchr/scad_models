$fn = 20;
eps = 0.3;
l = 5;
s = 1.5;
nut_dia = 6.0;
nut_h = 2.4+eps;
sr = (3+eps)/2;

r = (nut_dia + eps) / 2;
or = r + s;
h = l + 2* nut_h;
difference(){
    cylinder(h,or,or);
    cylinder(h,sr,sr);
    translate([0,0,h/2-nut_h]) {cylinder(nut_h+0.1,r,r, $fn=6); translate([r/0.9,0,0]) cylinder(nut_h+0.1,r,r, $fn=6);} 
    translate([0,0,h/2]){ cylinder(nut_h,r,r, $fn=6); translate([r/0.9,0,0]) cylinder(nut_h,r,r, $fn=6);} 
}