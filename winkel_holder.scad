l1 = 30;
l2 = 15;
w = 15;
d = 3;

h = 2;

difference(){
    union() {
cube([l1,w,d]);
translate([d*3,0,d]) cube([l1-d*3,w,d]);

cube([d*1.5,w,l2]);
    }
translate([l1-5,w/2,0]) cylinder(d*2,h,h);
//translate([0,w/2,l2-5]) rotate([0,90,0])cylinder(d,h,h);

}


