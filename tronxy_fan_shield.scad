w = 112;
h = 90;
s = 3;

use <roundedcube.scad>

hmx = 100;
hmy = 80;

fm = 71;
fmh = 80;

hr = 2.4;

difference(){
roundedcube([w,h,s],radius=1,apply_to="z_max");


dx = (w-hmx)/2;
dy = (h-hmy)/2;
translate([dx,dy,0])cylinder(s,hr,hr);
translate([w-dx,dy,0])cylinder(s,hr,hr);
translate([dx,h-dy,0])cylinder(s,hr,hr);
translate([w-dx,h-dy,0])cylinder(s,hr,hr);
    
dfx = (w-fm)/2;
dfy = (h-fm)/2;
translate([dfx,dfy,0])cylinder(s,hr,hr);
translate([w-dfx,dfy,0])cylinder(s,hr,hr);
translate([dfx,h-dfy,0])cylinder(s,hr,hr);
translate([w-dfx,h-dfy,0])cylinder(s,hr,hr);
    
translate([w/2,h/2,0])cylinder(s,fmh/2,fmh/2);
}