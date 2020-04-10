w = 100;
l = 100;
s = 5;
h = 10;
s2 = 8;

shr = (4+0.3)/2;

difference() {
    cube([l,w,s2]);

    translate([l*0.1,w*0.2,0]) cylinder(s2,shr,shr);
    translate([l*0.4,w*0.8,0]) cylinder(s2,shr,shr);
    translate([l*0.1,w*0.8,0]) cylinder(s2,shr,shr);
    translate([l*0.4,w*0.2,0]) cylinder(s2,shr,shr);



    translate([l*0.6,w*0.2,0]) cylinder(s2,shr,shr);
    translate([l*0.9,w*0.8,0]) cylinder(s2,shr,shr);
    translate([l*0.6,w*0.8,0]) cylinder(s2,shr,shr);
    translate([l*0.9,w*0.2,0]) cylinder(s2,shr,shr);
}

translate([l/2-s/2,0,s2]) cube([s,w,h]);
