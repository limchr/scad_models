l = 30;
w = 10;
d = 5;

hr = 2; 

$fn = 30;

hole_margin = 2;
margin_height = 2;

small = 1;


difference() {
linear_extrude(w) polygon([
    [0,0],
    [l,0],
    [l-1,d-2],
    [l-2,d-1],
    [l-5,d],
    [d*1.5+3,d*1.5],
    [d*1.5+1,d*1.5+1 ],
    [d*1.5,d*1.5+3],
    [d,l-5],
    [d-1,l-2],
    [d-2,l-1],
    [0,l]
    ]);
small = 1;
translate([l-5-hr-hole_margin,d,w/2]) rotate([90,0,0]) {
    cylinder(margin_height+small,hr+hole_margin,hr,center=true);
    cylinder(10000,hr,hr,center=true);
 }
translate([d,l-5-hr-hole_margin,w/2]) rotate([0,-90,0]) {
    cylinder(margin_height+small,hr+hole_margin,hr,center=true);
    cylinder(10000,hr,hr,center=true);    
    }
}