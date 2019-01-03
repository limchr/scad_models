inner_diameter = 5;
outer_diameter = 8;
length = 25;
$fn = 50;
difference() {
cylinder(length,outer_diameter/2,outer_diameter/2);
cylinder(length,inner_diameter/2,inner_diameter/2);
}