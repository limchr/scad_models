l = 100;
w = 150;
h = 10;
s = 2;


difference() {
    cube([l,w,h]);
    translate([s,s,s]) cube([l-2*s,w-2*s,h]);    
}