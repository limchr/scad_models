//keyboard dimensions
kb_l = 490;
kb_h = 80;
kb_w = 160;

//strength of wood
s = 10;

num_modules = 3;
num_bottom_parts = 2;
module_h = 128.5;


h = s + num_bottom_parts*(s+kb_h) + num_modules*(module_h + s);

w = kb_l + 2*s;
d = kb_w + 2*s;

difference() {
cube([w,d,h]);
translate([s,0,s]) cube([kb_l,kb_w,kb_h]);
translate([s,0,kb_h+2*s]) cube([kb_l,kb_w,kb_h]);

translate([s,0,2*kb_h+3*s]) cube([kb_l,kb_w,module_h]);
translate([s,0,2*kb_h+1*module_h+4*s]) cube([kb_l,kb_w,module_h]);
translate([s,0,2*kb_h+2*module_h+5*s]) cube([kb_l,kb_w,module_h]);





}

echo(h);