h = 100;
w = 40;
l = h-sqrt(2*w*w)+2*w;

//for compensating openscad rendering glitches 
eps = 0.002;

module vpart(){
    difference(){
        translate([l-w,0,0])rotate([0,-45,0]) cube([w,w,h+sqrt(2*w*w)]);
    translate([-eps,-eps,h+eps]) cube([w+2*eps,w+2*eps,w+2*eps]);
    translate([-w-eps,-eps,0]) cube([w+2*eps,w+2*eps,h+sqrt(2*w*w)]);
        }
    translate([l-w,0,0]) cube([w,w,h]);

    
    }

module n64_logo() {
vpart();
translate([l,0,0]) rotate([0,0,90]) vpart();
translate([l,l,0]) rotate([0,0,180]) vpart();
translate([0,l,0]) rotate([0,0,270]) vpart();
}

color([0.3,0.7,0.1]) rotate([0,0,$t*360]) translate([-l/2,-l/2,0]) n64_logo();