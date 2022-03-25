
//strength of wood
s = 18;

num_rows = 3;
num_floors = num_rows+1;

module_h = 128.5;

hp = 5.08;

//inner width
iw = 100 * hp;

add_v = 1;

oh = s + num_rows*(s + module_h+add_v);

ow = iw + 2*s;
d = 200;

difference() {
cube([ow,d+s,oh]);
translate([s,0,s]) cube([iw,d,module_h]);
translate([s,0,module_h+2*s]) cube([iw,d,module_h]);
translate([s,0,2*module_h+3*s]) cube([iw,d,module_h]);




}


echo("TOTAL: height",oh, "depth", d, "width", ow);

echo("##################");

echo("(2x) sides: ",oh,"x",d);
echo("(",num_floors,"x) floors: ",iw,"x",d);
echo("backplate: ",ow,"x",oh);
echo("(2x) module_covers: ",iw-1,"x",module_h-0.5);


echo("##################");
