include <simple_rounded_cube.scad>

$fn = 40;

//printer imprecision (critical parts are printed bigger/smaller by this variable)
eps = 0.3;


//outer width
ow = 65.5;
//outer length
ol = 43.1;
//outer height
oh = 3.1;

//frame width
fw = 4.3;

//cover width
cw = fw * 2;
//cover height
ch = oh;

difference(){
sr_cube([ow+cw*2,ol+cw*2,oh+ch],radius=1.5);

translate([cw-eps,cw-eps,ch]) cube([ow+eps*2,ol+eps*2,oh]);
translate([cw+fw,cw+fw,0]) cube([ow-2*fw,ol-2*fw,oh+ch]);

}