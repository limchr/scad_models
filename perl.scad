r = 4;
hr = 0.7;
$fn = 50;
difference() {
    sphere(r);
    cylinder(1000,hr,hr,center=true);
}