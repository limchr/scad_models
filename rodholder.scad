
difference() {
union() {
    cylinder(10,10,10);
    translate([-10,0,0])cube([20,20,10]);
}
translate([0,0,3.5]) {
    translate([0,0,-10])cylinder(20,2,2);
    translate([0,0,-1.5]) cylinder(1.6,2,4);
    translate([0,13,-10])cylinder(20,2,2);
    translate([0,13,-1.5]) cylinder(1.6,2,4);

    cylinder(10,8,8);
    translate([-8,0,0])cube([16,30,10]);
}
}