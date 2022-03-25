$fn = 20;

// strength of material
s = 3;
// error induced by printing
e = 0.3;



// width of zip bags
w = 40;
// height of zip bags
h = 70;
// length
l = 250;

// number of divisions
nd = 5;
// division strength
ds = 2;
//division width
dw = 5;

// do not change

dd = l / nd;

//division hole
dh = w-2*dw;

difference() {
cube([l+2*s+2*e,w+2*s+2*e,h+s+e]);
    translate([s,s,s]) cube([l+2*e,w+2*e,h+e]);
}

for(i = [1:1:(nd-1)]) {

    translate([s+e+ (dd*i)+ds/2,s,s]) {
        difference() {
            cube([ds,w+2*e,h+e]);
            translate([0,w/2+e,dh/2+dw+e]) rotate([0,90,0]) cylinder(ds,dh/2,dh/2);
            translate([0,dw+e,dw+dh/2+e]) cube([ds,dh,h]);
        }
    }

}