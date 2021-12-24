// width
w = 250;
// depth
d = 400;
// height
h = 200;
//thickness
t = 15;
//venting paths width
pw = 25;
//number of venting paths in labyrinth
np = 4;
//radius speaker hole
rs = 143/2;
//margin speaker hole
msh = (h - t - rs*2)/2 + t;






//create slice of part or print full part
slice_part = false;
//number of slices
ns = 4;
//slice i
si = 0;
//slice height
sh = (si == 0) ? (h-t) / ns + t : (h-t) / ns;
//slice z
sz = (si == 0) ? 0 : t + sh * si;


include <simple_rounded_cube.scad>;

module case_half(){
    difference() {
    cube([w,d,h]);
    translate([t,t,t]) cube([w-2*t,d-2*t,h]);
    translate([rs+msh,0,rs+msh])rotate([-90,0,0])cylinder(t,rs,rs,$fn=100); //driver cutout
    translate([w-t-pw,0,t]) cube([pw,t,h-t]);
    }

    translate([w-t*2-pw,0,t]) sr_cube([t,d-t-pw,h-t],t/2); //venting path to the front

    translate([t+pw,d-t*2-pw,t]) sr_cube([w-2*t-2*pw,t,h-t],t/2);
    translate([t+pw,d-t*4-pw*3,t]) sr_cube([w-2*t-2*pw,t,h-t],t/2);

    translate([0,d-t*3-pw*2,t]) sr_cube([w-2*t-2*pw,t,h-t],t/2);
    translate([0,d-t*5-pw*4,t]) sr_cube([w-2*t-2*pw,t,h-t],t/2);

    translate([t,t,t]) rotate([90,0,90]) waves(20,h-t,10);
    translate([w-t*2-pw,t,h]) rotate([-90,0,90]) waves(24,h-t,10);

}

module case_full(){
    case_half();
    translate([w*2-t,0,0])mirror([1,0,0]) case_half();
}

module slice_part(){
    translate([0,0,-sz]){
        intersection(){
            case_full();
            echo(sh);
            translate([0,0,sz])cube([w*2-t,d,sh]);
        }
    }
}

module waves(n,d,h){
    
    for(i = [0:1:n]) {
        translate([i*h,0,0]){
            if(i%2 == 0) {
                difference() {
                    cube([h,d,h/2], center=false);
                    translate([h/2,0,h/2])rotate([-90,0,0])cylinder(d,h/2,h/2,false);
                }
            } else {
                    cube([h,d,h/2], center=false);
                    translate([h/2,0,h/2])rotate([-90,0,0])cylinder(d,h/2,h/2,false);

            
            }
        }
    }
}

if(!slice_part){
    case_full();
} else{
    if((si >= ns/2)) {
        translate([w*2-t,0,sh])rotate([180,0,180]) slice_part();
    } else {
        slice_part();
    }
}