
h = 100;
w = 150;
s = 2;
br1=0.15;
br2=0.5;
include<simple_rounded_cube.scad>;

module shape(w,h) {
    intersection() {
    sr_cube([w,w,h], radius=w*br1, corners=[1,0,0,0],$fn=100);
    sr_cube([w,w,h], radius=w*br2, corners=[0,0,1,0],$fn=100);
    }
    }


difference(){
shape(w,h);
translate([s,s,s]) shape(w-2*s,h);
    
    intersection(){
    translate([10*s,10*s,0]) shape(w-20*s,s);
    rotate([0,0,45])translate([0,-w/2,0])for(i = [1:20]) {
        translate([i*(w/12),0,0]) sr_cube([4, w, s], radius=1.5);
        }
    }

//for(i = [1:10]) {
//        translate([i*(w/10),s*10,0]) sr_cube([4, w-s*20, s], radius=1.5);
//        }

translate([0,0,h/1.5]) {
    rotate([0,90,45]) cylinder(50,2,2);
    }

translate([-10,-10,h]) rotate([-7,7,0]) cube([w*2,w*2,h*2]);

}
