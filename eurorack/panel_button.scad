


//generate button enclosure for push button 

//the different functions take the same parameters for producing 2 button parts and related hole
//parameters: r: radius of button
//s: strength of button parts
//bh: measured button height
//d: depth of button-top
//hr: hole radius for cables
//e: error variable for gap between button and panel (and other things)
//$fn: number of edges for button geometry




module generate_button_top(r,s,bh,d,hr,e,$fn) {
    // main button
    translate([0,0,0])difference(){
        union() {
            cylinder(d,r-2*e,r-2*e,$fn);
            cylinder(s, r+4*e, r+4*e,$fn);
        }
        cylinder(d-s,r-2*e-s,r-2*e-s,$fn);
    }
}

module generate_button_top_solid(r,db,dt,e,$fn) {
    // main button
    translate([0,0,db])
        cylinder(dt,r-2*e,r-2*e,$fn);
        cylinder(db, r+4*e, r+4*e,$fn);
}


module generate_button_bottom(r,s,d1,d2,hr,e,$fn) {
// bottom part
    // cut out for bottom part
    co = bh-(d-s)+3*e;
    assert(co>=0);
    difference(){
            cylinder(co+s,r+6*e+s,r+6*e+s,$fn);        
        translate([0,0,s]) cylinder(co+0.01,r+6*e,r+6*e,$fn);
        translate([r+6*e-hr,0,-0.005]) cylinder(s+0.01,hr,hr,$fn);
    }
}

module generate_button_hole(r,s,bh,d,hr,e,$fn) {
    translate([0,0,-0.005])cylinder(100,r,r,$fn);
}
//
//// usage
//
//    btn_r = 7;
//    btn_s = 1;
//    btn_bh = 7;
//    btn_d = 4;
//    btn_hr = 2;
//    btn_e = 0.4;
//    btn_edges = 6;
//    
//
//generate_button_bottom(btn_r,btn_s,btn_bh,btn_d,btn_hr,btn_e,btn_edges);