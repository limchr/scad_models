w = 110;
l = 194;
h = 10;
h2 = 20;
s = 2;


fm = 71;
fmh = 80;

hr = 2.4;
hr2 = 2.0;

hd = 6;
hx1 = 14;
hx2 = 136;

hy = 10;

difference(){
union(){
cube([l,w,h]);
cube([s,w,h2]);
}
translate([s,s,s]) cube([l-2*s,w-2*s,h]);

mx = (l-2*fm)/3;
my = (w-fm)/2;

translate([mx,my,0])cylinder(s,hr,hr);
translate([mx,w-my,0])cylinder(s,hr,hr);
translate([mx+fm,my,0])cylinder(s,hr,hr);
translate([mx+fm,my+fm,0])cylinder(s,hr,hr);

translate([mx*2+fm,my,0])cylinder(s,hr,hr);
translate([mx*2+fm,w-my,0])cylinder(s,hr,hr);
translate([l-mx,my,0])cylinder(s,hr,hr);
translate([l-mx,my+fm,0])cylinder(s,hr,hr);

translate([mx+fm/2,my+fm/2,0])cylinder(s,fmh/2,fmh/2);
translate([l-(mx+fm/2),my+fm/2,0])cylinder(s,fmh/2,fmh/2);


translate([hx1,0,hd])rotate([-90,0,0])cylinder(w,hr2,hr2);
translate([hx2,0,hd])rotate([-90,0,0])cylinder(w,hr2,hr2);

translate([s,hy,hd])rotate([0,90,0])cylinder(l,hr2,hr2);
translate([s,w-hy,hd])rotate([0,90,0])cylinder(l,hr2,hr2);


}