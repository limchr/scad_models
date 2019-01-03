w = 50;
s = 3;

hr = 2.5;
hm = 0.75;

difference() {
cube([w+s,w+s,w+s]);
translate([s,s,s])cube([w,w,w]);
translate([w+s,0,0])rotate([0,0,45])cube([w+s,w*2+s*2,w+s]);
    
translate([(w+s)*hm,2*s,(w+s)*hm])rotate([90,0,0])cylinder(s*9,hr,hr);
translate([0,(w+s)*hm,(w+s)*hm])rotate([0,90,0])cylinder(s*9,hr,hr);
translate([w,0,0])cube([w+s*2,w+s*2,w+s*2]);
translate([0,w,0])cube([w+s*2,w+s*2,w+s*2]);
}

