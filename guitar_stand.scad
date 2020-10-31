
//enter the depth (thickness) of your guitar here
guitar_w = 102;


//variable to set up the resolution of cylinders, increase for 'rounder' circles
$fn = 500;

//strength of parts
s = 7;

//error term (critical parts are eps wider for a better fit)
eps = 1;



//length of the guitar holder (don't need to be changed, maybe set to maximum dimensions of your printer)
l = guitar_w*2;

//dia of cutout cylinder (increase for a flatter ground)
l2 = guitar_w *7.5;


//cutout radius for a super cool design
cutout_r = (l)/2-s*4;

//cutout radius for the stand itself
cutout_r2 = (l)/2+s*0;

// stand addition for wider stand
//stand_addition = s;
stand_addition = 0;

//hole for bottom belt button, set to 0 if your guitar does not have a belt button
center_hole_dia = 18;

//center hole y (set to guitar_w/2 for centered belt buttons)
center_hole_y = guitar_w/2;
//center_hole_y = 50;


translate([l/2,0,0])difference() {
        union() {
            // main part
            rotate([-90,0,0]) cylinder(guitar_w+2*s+2*eps,l/2,l/2);
            
            // stands to the side
            cylinder(s,l/2+stand_addition,l/2+stand_addition);
            translate([0,guitar_w+2*s+2*eps,0]) cylinder(s,l/2+stand_addition,l/2+stand_addition);
    }

// main part to be cut out
translate([0,s+eps,l2/2+s]) rotate([-90,0,0]) cylinder(guitar_w+2*eps,l2/2,l2/2);

//ground part to be cut out    
translate([-500,-500,-500]) cube([1000,1000,500]);
    // hole for belt button
    translate([0,center_hole_y+s+eps,0]) cylinder(100,center_hole_dia/2+eps,center_hole_dia/2+eps);
    
    // design cutouts
    translate([0,0,l/2]) rotate([-90,0,0]) cylinder(500,cutout_r,cutout_r);
    
    // design cutouts for stand parts
    translate([0,-l/2,0]) cylinder(500,cutout_r2,cutout_r2);
translate([0,guitar_w+2*s+2*eps+l/2,0]) cylinder(500,cutout_r2,cutout_r2);
}