module rpi_zero_mount(height) {
    w = 30;
    l = 65;
    holes_margin = 4;
    holes_r = 1.5;
    holes_mounting_r = holes_margin;
    
    translate([holes_margin,holes_margin,0]) difference() {
        cylinder(height,holes_mounting_r,holes_mounting_r);
        cylinder(height,holes_r,holes_r);
    }
    translate([l-holes_margin,holes_margin,0]) difference() {
        cylinder(height,holes_mounting_r,holes_mounting_r);
        cylinder(height,holes_r,holes_r);
    }
    translate([holes_margin,w-holes_margin,0]) difference() {
        cylinder(height,holes_mounting_r,holes_mounting_r);
        cylinder(height,holes_r,holes_r);
    }
    translate([l-holes_margin,w-holes_margin,0]) difference() {
        cylinder(height,holes_mounting_r,holes_mounting_r);
        cylinder(height,holes_r,holes_r);
    }
}
//rpi_zero_mount(5);

