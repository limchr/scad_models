
$fn = 50;

//hole radius
hr = 1.4;

//height
h = 15;

//strength
s = 6;

// length of foots
l = 12;

assert(s*2 <=l);


module leg(){
    translate([-s/2,0,0]) union() {
        translate([0,0,s]) difference() {
            cube([s,s,s]);
            translate([0,s,s]) rotate([0,90,0])cylinder(s,s,s);
        }

        cube([s,l-s,s]);

        intersection() {
        translate([0,l-s,0]) rotate([0,90,0]) cylinder(s,s,s);
        translate([0,0,0]) cube([s,l,s*2]);
        }
    }
}

difference() {
    union() {
        cylinder(h,s/2,s/2);
        leg();
        rotate([0,0,90]) leg();
        // rotate([0,0,180]) leg();
        // rotate([0,0,270]) leg();    
    }
    cylinder(h,hr,hr);

}

