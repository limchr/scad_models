$fn = 50;

//height
h = 100;
//total radius
r = 6;
//strength (wall thickness)
s = 1.2;
//holes_margin
h_m = 5;

//light mount depth
l_d = 15;
//light radius
l_r = 2.85;
//light radius bottom (smaller because light has to be stuck in)
l_r_b = 0.75 * l_r;

//line hole radius
h_r = 0.5;
//line hole width
h_w =3;

rotate([180,0,0])
difference(){
    cylinder(h,r,r);
    translate([0,r,h_m-s])rotate([90,0,0]) cylinder(2*r,h_r,h_r);
    translate([0,0,h_m*2]) cylinder(h-3*h_m-l_d,r-s,r-s);
    translate([0,0,h-l_d]) cylinder(l_d,l_r_b,l_r);
    translate([r,0,0]) rotate([0,-90,0]) linear_extrude(2*r) polygon([[0,h_w/2],[0,r],[h_m*2-s,r],[h_m,h_w/2]]);
    translate([-r,0,0]) rotate([0,90,0]) rotate([0,0,180]) linear_extrude(2*r) polygon([[0,h_w/2],[0,r],[h_m*2-s,r],[h_m,h_w/2]]);
    
translate([-r,-r,0])
difference(){
    cube([r*2,r*2,h_m]);
    translate([r,r*2,r])rotate([90,0,0])cylinder(r*2,r,r);
}    
}
