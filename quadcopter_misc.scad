fc_holder = false;
fc_holder_bottom = true;

fc_hole_r = 1.5;
hr = 2;

hole_margin_fc = 31;
fc_h = 7;
hole_margin_holder = 35;
s = 2;
h_down = 30;

$fn =20;
w = hole_margin_fc+2*s+fc_hole_r*2;
margin_base = 5;
if(fc_holder) {
difference(){
union() {
    translate([-s-fc_hole_r-margin_base,-s-fc_hole_r-margin_base,0])cube([w+2*margin_base,w+2*margin_base,s]);
    cylinder(fc_h,fc_hole_r+s,fc_hole_r+s);
    translate([hole_margin_fc,0,0])cylinder(fc_h,fc_hole_r+s,fc_hole_r+s);
    translate([0,hole_margin_fc,0])cylinder(fc_h,fc_hole_r+s,fc_hole_r+s);
    translate([hole_margin_fc,hole_margin_fc,0])cylinder(fc_h,fc_hole_r+s,fc_hole_r+s);
}
    cylinder(fc_h,fc_hole_r,fc_hole_r);
    translate([hole_margin_fc,0,0])cylinder(fc_h,fc_hole_r,fc_hole_r);
    translate([0,hole_margin_fc,0])cylinder(fc_h,fc_hole_r,fc_hole_r);
    translate([hole_margin_fc,hole_margin_fc,0])cylinder(fc_h,fc_hole_r,fc_hole_r);

translate([-fc_hole_r-s+w/2,-fc_hole_r-s+(w-hole_margin_holder)/2,0]){
        cylinder(s,hr,hr);
        translate([0,hole_margin_holder,0])cylinder(s,hr,hr);
    
    }

}
}

if(fc_holder_bottom) {

translate([-s-fc_hole_r+hr*3+w/2,-s-fc_hole_r,-0]){
    difference(){
    rotate([0,90,90])translate([0,0,-margin_base])linear_extrude(w+2*margin_base)polygon([[0,0],[0,hr*5],[s,hr*5],[s*1.3,s*3],[s*2,s*2],[s*4,s*1],[h_down,s],[h_down,0]]);
    translate([-s*3,(w-hole_margin_holder)/2,-50])cylinder(100,hr,hr);
    translate([-s*3,(w-hole_margin_holder)/2+hole_margin_holder,-50])cylinder(100,hr,hr);
    translate([-s*3,(w-hole_margin_holder)/2,-100-s])cylinder(100,hr*2,hr*2);
    translate([-s*3,(w-hole_margin_holder)/2+hole_margin_holder,-100-s])cylinder(100,hr*2,hr*2);

    }
}
}