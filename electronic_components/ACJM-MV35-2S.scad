$fn = 20;

fh = 3.4;
fh2 = 3.6;

h = 24;

hj = 4;

translate([10,0,0])
mirror([1,1,0]) {

difference(){
translate([-7.9,-7.9,fh2])cube([15.8,15.8,h-fh2]);
rotate([0,0,45]) translate([8,-5,0])cube([20,20,30]);

}


translate([-6.38,0.56,-fh]) cylinder(fh+fh2,1,1);
translate([4.67,4.67,-fh]) cylinder(fh+fh2,1,1);
translate([-2.4,6.38,-fh]) cylinder(fh+fh2,0.7,0.7);

translate([-6.38,0.56,fh2/2]) cube([1,7,fh2],center=true);
translate([4.67,4.67,fh2/2]) rotate([0,0,45])cube([1,7,fh2],center=true);
translate([-2.4,6.38,fh2/2]) cube([7,1,fh2],center=true);




translate([0,0,h])cylinder(hj,3,3);

}