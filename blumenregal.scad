
//vertical bretter
translate([75,0,0]) rotate([90,-90,0]) cube([750,75,20]); //small brett
translate([750,0,0]) rotate([90,-90,0]) cube([750,75,20]); //small brett
translate([75,125+20,0]) rotate([90,-90,0]) cube([750,75,20]); //small brett
translate([750,125+20,0]) rotate([90,-90,0]) cube([750,75,20]); //small brett

height1 = 0;
height2 = 500;

//topf unten
translate([0,0,height1+20]) rotate([0,0,0]) cube([60,125,60]); //block
translate([0,0,height1+20+60]) rotate([0,0,0]) cube([60,125,60]); //block
translate([0,0,height1+20+120]) rotate([0,0,0]) cube([60,125,60]); //block

translate([750-60,0,height1+20]) rotate([0,0,0]) cube([60,125,60]); //block
translate([750-60,0,height1+20+60]) rotate([0,0,0]) cube([60,125,60]); //block
translate([750-60,0,height1+20+120]) rotate([0,0,0]) cube([60,125,60]); //block

translate([0,-20,height1+0]) rotate([90,0,0]) cube([750,95,20]); //middle brett
translate([0,-20,height1+95]) rotate([90,0,0]) cube([750,75,20]); //small brett

translate([0,165,height1+0]) rotate([90,0,0]) cube([750,95,20]); //middle brett
translate([0,165,height1+95]) rotate([90,0,0]) cube([750,75,20]); //small brett

translate([0,0,height1+0]) rotate([0,0,0]) cube([750,125,20]); //wide brett


//topf oben
translate([0,0,height2+20]) rotate([0,0,0]) cube([60,125,60]); //block
translate([0,0,height2+20+60]) rotate([0,0,0]) cube([60,125,60]); //block
translate([0,0,height2+20+120]) rotate([0,0,0]) cube([60,125,60]); //block

translate([750-60,0,height2+20]) rotate([0,0,0]) cube([60,125,60]); //block
translate([750-60,0,height2+20+60]) rotate([0,0,0]) cube([60,125,60]); //block
translate([750-60,0,height2+20+120]) rotate([0,0,0]) cube([60,125,60]); //block

translate([0,-20,height2+0]) rotate([90,0,0]) cube([750,95,20]); //middle brett
translate([0,-20,height2+95]) rotate([90,0,0]) cube([750,75,20]); //small brett

translate([0,165,height2+0]) rotate([90,0,0]) cube([750,95,20]); //middle brett
translate([0,165,height2+95]) rotate([90,0,0]) cube([750,75,20]); //small brett

translate([0,0,height2+0]) rotate([0,0,0]) cube([750,125,20]); //wide brett





