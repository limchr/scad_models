
include <simple_rounded_cube.scad>


//
//main variables
//
//strength of parts
s = 3;

// gears width
gears_w = 5;

//tolerance (e.g. for gears)
eps = 0.3;

//gear distance
gear_d = 80;

//total length
l = gear_d+2*gears_w+2*s+2*eps;


//distance of small gear from base plate
sm_h = 10;

// outer margin
om = 5;

//radius of motor shaft
motor_welle_r = 5.8/2;


//motor radius
motor_r = 25/2;

//motor length
motor_l = 40;

glas_umpfang = 420;
glas_r = glas_umpfang/(2*3.1415);


rotate_sm = [0,0,0];
rotate_bg = [3,0,0];
rotate_top = [1.2,0,0];



// gears library from: https://www.thingiverse.com/thing:1604369
include <Getriebe.scad>;

sm_modul=1;
sm_zahnzahl=15; 
sm_breite=5;
sm_bohrung=motor_welle_r*2;
sm_eingriffswinkel=20;
sm_schraegungswinkel=30;
sm_optimiert=false;

bg_modul=sm_modul;
bg_zahnzahl=60; 
bg_breite=sm_breite;
bg_bohrung=8;
bg_eingriffswinkel=sm_eingriffswinkel;
bg_schraegungswinkel=-sm_schraegungswinkel;
bg_optimiert=true;

top_modul=sm_modul;
top_zahnzahl=140; 
top_breite=sm_breite;
top_bohrung=4;
top_eingriffswinkel=sm_eingriffswinkel;
top_schraegungswinkel=sm_schraegungswinkel;
top_optimiert=true;

//
//calculations for gear dimensions
//
sm_d = sm_modul * sm_zahnzahl;
sm_r = sm_d / 2;
sm_alpha_stirn = atan(tan(sm_eingriffswinkel)/cos(sm_schraegungswinkel));
sm_db = sm_d * cos(sm_alpha_stirn);
sm_rb = sm_db / 2;
sm_da = (sm_modul <1)? sm_d + sm_modul * 2.2 : sm_d + sm_modul * 2;
sm_ra = sm_da / 2;
sm_c =  (sm_zahnzahl <3)? 0 : sm_modul/6;
sm_df = sm_d - 2 * (sm_modul + sm_c);
sm_rf = sm_df / 2;
sm_rho_ra = acos(sm_rb/sm_ra);

sm_r_inner = sm_rf; //radius inner
sm_r_outer = pol_zu_kart(ev(sm_rb,sm_rho_ra))[0]; //radius outer


bg_d = bg_modul * bg_zahnzahl;
bg_r = bg_d / 2;
bg_alpha_stirn = atan(tan(bg_eingriffswinkel)/cos(bg_schraegungswinkel));
bg_db = bg_d * cos(bg_alpha_stirn);
bg_rb = bg_db / 2;
bg_da = (bg_modul <1)? bg_d + bg_modul * 2.2 : bg_d + bg_modul * 2;
bg_ra = bg_da / 2;
bg_c =  (bg_zahnzahl <3)? 0 : bg_modul/6;
bg_df = bg_d - 2 * (bg_modul + bg_c);
bg_rf = bg_df / 2;
bg_rho_ra = acos(bg_rb/bg_ra);

bg_r_inner = bg_rf; //radius inner
bg_r_outer = pol_zu_kart(ev(bg_rb,bg_rho_ra))[0]; //radius outer


top_d = top_modul * top_zahnzahl;
top_r = top_d / 2;
top_alpha_stirn = atan(tan(top_eingriffswinkel)/cos(top_schraegungswinkel));
top_db = top_d * cos(top_alpha_stirn);
top_rb = top_db / 2;
top_da = (top_modul <1)? top_d + top_modul * 2.2 : top_d + top_modul * 2;
top_ra = top_da / 2;
top_c =  (top_zahnzahl <3)? 0 : top_modul/6;
top_df = top_d - 2 * (top_modul + top_c);
top_rf = top_df / 2;
top_rho_ra = acos(top_rb/top_ra);

top_r_inner = top_rf; //radius inner
top_r_outer = pol_zu_kart(ev(top_rb,top_rho_ra))[0]; //radius outer











//
// some more complex calculations of actual gear positioning
// 

function get_circle_coords(r,a) = [r*cos(a),r*sin(a)];


bg_margin_xz = get_circle_coords(sm_r_inner+eps+bg_r_outer,30);
alpha = asin(bg_margin_xz[0]/(bg_r_inner+eps+top_r_outer));
glas_margin_xz = get_circle_coords(bg_r_inner+eps+top_r_outer,90+alpha);

//mounting height of small gear
sm_gear_z = sm_r_outer+s+sm_h;
//mounting height of big gears
bg_gears_z = s+sm_h+sm_r_outer+bg_margin_xz[1];
//mounting height of top gear (for can)
top_gear_z = glas_margin_xz[1]+bg_gears_z;

//total width
w = bg_margin_xz[0]*2+bg_bohrung+2*om;

//total height
h = bg_gears_z+ bg_bohrung/2 + om-s;


//
// finally the actual part
//

cube([l,w,s]);

difference(){
translate([s+10*eps+gears_w,w/2-motor_r,s]) cube([motor_l,motor_r*2, sm_gear_z-s]);
translate([s+10*eps+gears_w,w/2,s+sm_gear_z]) rotate([0,90,0])cylinder(motor_l, motor_r, motor_r);
}


hull() {
translate([0,0,s])cube([s,w,s]);
translate([s+10*eps+gears_w,w/2-motor_r,s]) cube([motor_l,motor_r*2, s]);
}

difference(){
union(){
translate([0,0,s])cube([s,w,h]);
translate([l-s,0,s])cube([s,w,h]);
}

translate([0,w/2+bg_margin_xz[0],bg_gears_z]) rotate([0,90,0]) cylinder(l,(bg_bohrung+eps)/2,(bg_bohrung+eps)/2);
translate([0,w/2-bg_margin_xz[0],bg_gears_z]) rotate([0,90,0]) cylinder(l,(bg_bohrung+eps)/2,(bg_bohrung+eps)/2);
}

translate([0,w/2+bg_margin_xz[0],bg_gears_z]) rotate([0,90,0]) cylinder(l,(bg_bohrung-eps)/2,(bg_bohrung-eps)/2);
translate([0,w/2-bg_margin_xz[0],bg_gears_z]) rotate([0,90,0]) cylinder(l,(bg_bohrung-eps)/2,(bg_bohrung-eps)/2);




//small gear for motor mounting
translate([s,w/2,sm_gear_z]) rotate(rotate_sm) rotate([0,90,0])

difference(){
pfeilrad (modul=sm_modul, zahnzahl=sm_zahnzahl, breite=sm_breite, bohrung=sm_bohrung-2, eingriffswinkel=sm_eingriffswinkel, schraegungswinkel=sm_schraegungswinkel, optimiert=sm_optimiert);
    cylinder(sm_breite,motor_welle_r+eps,motor_welle_r+eps,$fn=6);

}


// big gears sideways
translate([s,w/2+bg_margin_xz[0],bg_gears_z]) rotate(rotate_bg) rotate([0,90,0]) pfeilrad (modul=bg_modul, zahnzahl=bg_zahnzahl, breite=bg_breite, bohrung=bg_bohrung, eingriffswinkel=bg_eingriffswinkel, schraegungswinkel=bg_schraegungswinkel, optimiert=bg_optimiert);
translate([s,w/2-bg_margin_xz[0],bg_gears_z]) rotate(rotate_bg) rotate([0,90,0]) pfeilrad (modul=bg_modul, zahnzahl=bg_zahnzahl, breite=bg_breite, bohrung=bg_bohrung, eingriffswinkel=bg_eingriffswinkel, schraegungswinkel=bg_schraegungswinkel, optimiert=bg_optimiert);



// top hollow gear for mounting a blass bottle or can
translate([s,w/2,top_gear_z]) rotate(rotate_top) rotate([0,90,0]) difference(){
        pfeilrad (modul=top_modul, zahnzahl=top_zahnzahl, breite=top_breite, bohrung=top_bohrung, eingriffswinkel=top_eingriffswinkel, schraegungswinkel=top_schraegungswinkel, optimiert=top_optimiert);
        translate([0,0,-eps]) cylinder(top_breite+eps*2,glas_r,glas_r);
    }


//
// mirrored parts
//


// big gears sideways
translate([l-s-gears_w-eps,w/2+bg_margin_xz[0],bg_gears_z]) rotate(rotate_bg) rotate([0,90,0]) pfeilrad (modul=bg_modul, zahnzahl=bg_zahnzahl, breite=bg_breite, bohrung=bg_bohrung, eingriffswinkel=bg_eingriffswinkel, schraegungswinkel=bg_schraegungswinkel, optimiert=bg_optimiert);
translate([l-s-gears_w-eps,w/2-bg_margin_xz[0],bg_gears_z]) rotate(rotate_bg) rotate([0,90,0]) pfeilrad (modul=bg_modul, zahnzahl=bg_zahnzahl, breite=bg_breite, bohrung=bg_bohrung, eingriffswinkel=bg_eingriffswinkel, schraegungswinkel=bg_schraegungswinkel, optimiert=bg_optimiert);



// top hollow gear for mounting a blass bottle or can
translate([l-s-gears_w-eps,w/2,top_gear_z]) rotate(rotate_top) rotate([0,90,0]) difference(){
        pfeilrad (modul=top_modul, zahnzahl=top_zahnzahl, breite=top_breite, bohrung=top_bohrung, eingriffswinkel=top_eingriffswinkel, schraegungswinkel=top_schraegungswinkel, optimiert=top_optimiert);
        translate([0,0,-eps]) cylinder(top_breite+eps*2,glas_r,glas_r);
    }



