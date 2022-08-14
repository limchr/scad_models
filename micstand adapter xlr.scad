$fn = 100;

rb = 45/2;
rt = 47/2;
h = 40;

s = 5-0.25;

////arm length
al = 20;

//screw hole radius
shr = 5.2/2;

//screw holder length
shl = 10;

//screw hole radius holder
shrh = 4.2/2;
difference() {
    cylinder(h,rb+s,rt+s);
    cylinder(h,rb,rt);
    translate([-rt-s,-s/2,0]) cube([rt+s,s,h]);
}

difference() {
    union() {
translate([-rb-s-shl+1,-s*1.5,0]) cube([shl,s,h]);
translate([-rb-s-shl+1,s*0.5,0]) cube([shl,s,h]);
    }
    
translate([-rb-s-shl/2+1,s*2,s*2]) rotate([90,0,0]) cylinder(100, shrh, shrh);
translate([-rb-s-shl/2+1,s*2,h-s*2]) rotate([90,0,0]) cylinder(100, shrh, shrh);

translate([-rb-s-shl/2+1,s*2,s*2]) rotate([90,0,0]) cylinder(s, shr*1.5, shr*1.5);
translate([-rb-s-shl/2+1,s*2,h-s*2]) rotate([90,0,0]) cylinder(s, shr*1.5, shr*1.5);
    
translate([-rb-s-shl/2+1,-s,s*2]) rotate([90,0,0]) cylinder(s, shr*1.5, shr*1.5);
translate([-rb-s-shl/2+1,-s,h-s*2]) rotate([90,0,0]) cylinder(s, shr*1.5, shr*1.5);

    
}




difference(){
translate([rb+s-1,s/2,0])rotate([90,0,0])linear_extrude(s) polygon([
[0,0],
[al,0],
[al+s,s],
[al+s,2*s],
    [al-2,h*0.66],
[(rt/rb),h]
]
);
translate([rb+al,s/2,s+shr]) rotate([90,0,0]) cylinder(s,shr,shr); 

}

