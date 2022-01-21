
//holzschnitt:
// h = hoehe
// b = breite
// t = tiefe
// hs = holzstaerke

// 2x hxb
// kb_h + hs x b+2*hs (frontblende keyboard)
// t x b (keyboard auflage)
// kb_h x b + 2*hs (blende ueberhalb kb)
// 2x (50 x b) rackmounts fuer pedalboardplatte
// 100 x b + 2*hs (dach)
// 50 x b (streben rueckseite)

// pedalboardplatte und eurorack covers

// 2 x (module_h x b + 2*hs)


//keyboard angle
kb_a = 20;

//keyboard dimensions
kb_l = 490;
kb_h = 38.1;
kb_w = 160;

//bottom height
b_h = 70;

module_h = 128.5;
module_d = 100;

//height module 1
hm1 = 150;

//modules angle
m_a = 80;

//distance between modules
dbm = 130;


// width upper
wu = 120;

wb = 270;


rotate([90,0,0]) linear_extrude(kb_l) 

translate([wu,0,0])
union() {

    color("blue")
    translate([-wu,0,0]) {
        
        square([94,580]);
        square([wu,220]);
        square([wb,106]);

    }

    translate([-wu+wb-14,b_h,0])rotate([0,0,-kb_a])translate([-kb_w,0,0])square([kb_w,kb_h]);


    translate([0,b_h+hm1,0])rotate([0,0,-m_a])translate([-module_h,-module_d,0])square([module_h,module_d]);
    translate([0,b_h+hm1+dbm,0])rotate([0,0,-m_a])translate([-module_h,-module_d,0])square([module_h,module_d]);
    translate([0,b_h+hm1+2*dbm,0])rotate([0,0,-m_a])translate([-module_h,-module_d,0])square([module_h,module_d]);

}