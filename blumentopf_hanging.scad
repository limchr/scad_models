h = 100;
w = 70;
s = 2;

hole_r = 2;

hs = 4;
hd = 21;
hw = w*2;
hl = 30;
support_with = 0.7;

difference() {
difference() {cylinder(h,w,w); translate([-w,0,-0.1])cube([w*2,w*2,h*2]);}
difference() { translate([0,0,s]) cylinder(h*2,w-s,w-s); translate([-w,-s,-0.1])cube([w*2,w*2,h*2]);}
translate([0,-(w-s-s-hole_r*2),-0.1])cylinder(s*2,hole_r,hole_r);
translate([-s*2,-(w-s-s-hole_r*2),-0.1])cylinder(s*2,hole_r,hole_r);
translate([s*2,-(w-s-s-hole_r*2),-0.1])cylinder(s*2,hole_r,hole_r);

}

translate([-w,0,h-hs-hl]) {
translate([0,hd,0]) cube([hw,hs,hl]);
translate([0,0,hl]) cube([hw,hd+hs,hs]);
}


translate([-w,hd+hs/2,0]) cube([w*2,support_with,h-hl-hs]);

translate([-w,0,0]) cube([w*2,hd+3*hs,support_with]);

translate([-w,hd+hs/2,h-hl]) rotate([25,0,0])cube([w*2,support_with,hl]);
translate([-w,-support_with,h-hl]) rotate([-15,0,0])cube([w*2,support_with,hl]);
