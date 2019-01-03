width = 130;
height = 100;
thick = 5;
rodthick = 30;
rodthick_inner = 34;
printBase = false;
printRod = true;

if(printBase) {
    difference() {
        cylinder(height,width/2,width/2);
        union() {
            translate([0,0,thick])cylinder(height,width/2-thick,width/2-thick); //inner cylinder
            translate([-width/2,0,height])rotate([0,90,0])cylinder(width+2,rodthick/2,rodthick/2); //rod_holes
        }
    }
}

if(printRod) {
    translate([-30,-70,width/2])rotate([0,90,0])
    union() {
        translate([-width/2,0,height])rotate([0,90,0])cylinder(width,rodthick/2,rodthick/2);
        intersection() {
            translate([0,0,height/2])cylinder(height,width/2-thick,width/2-thick); //inner cylinder
            translate([-width/2,0,height])rotate([0,90,0])cylinder(width,rodthick_inner/2,rodthick_inner/2);
        }
    }
}