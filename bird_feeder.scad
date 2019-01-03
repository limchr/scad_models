print_outer = true;
print_inner = false;
use <bezier.scad>

$fn = 150;

//length and width
l = 130;
//height
h = 12.5;
//height inner
hi = 20;

//center cut out length
cl = 33;


//thickness of walls
s = 2;

//for compensate imprecise print
e = 1;

//big integer
b = 1000000;

//horizontal offset between holder
hdx = 30;

//holder width 1
hw1 = 9.5;
//holder width 2
hw2 = 12.5;
//holder length 1
hd1 = 2;
//holder length 2
hd2 = 3;
//holder zize
hl = 40;
 
module holder(hw1,hw2,hd1,hd2,hl) {
    translate([0,-hl/2,-hw1/2])cube([hd1,hl,hw1]);
    translate([hd1,-hl/2,-hw2/2]) cube([hd2,hl,hw2]);
} 



if(print_outer){
    translate([0,(l+hdx)/2,hw2/2])rotate([0,0,180])holder(hw1,hw2,hd1,hd2,hl);
    translate([(l+hdx)/2,0,hw2/2])rotate([0,0,-90])holder(hw1,hw2,hd1,hd2,hl);

    difference(){
        intersection() {
        cube([l,l,h]);
        cylinder(h,l,l);
         }
            
        intersection(){
         translate([s,s,s])cube([l-2*s,l-2*s,h]);
        cylinder(h,l-s,l-s);
        }
        
cube([cl,cl,h]);
    }
        difference(){
            cube([cl+s,cl+s,h]);
            cube([cl,cl,h]);
        }
        
}

translate([0,0,20])
if(print_inner) {
    sl = 20;
    sh=20;
    
    //border for sitting
    difference(){
    translate([0,0,hi+s+e-sh*0.65])rotate_extrude(angle=90)translate([l-s*1.5-e,0,0])polygon(bezier([[0,0],[-s/2,sh*0.6],[-sl,sh],[sl,sh],[s/2,sh*0.6],[0,0]],20));
        cube([b,s+e,b]);
        cube([s+e,b,b]);

    }







   difference(){
         intersection() {
            translate([s+e,s+e,s+e]) cube([l-2*s-e,l-2*s-e,hi]);
            translate([0,0,s+e])cylinder(hi,l-s-e,l-s-e);
         }
        intersection() {
            translate([s*2+e,s*2+e,s*2+e])cube([l-4*s-2*e,l-4*s-2*e,hi]);
            translate([0,0,s+e])cylinder(hi,l-s*2-e,l-s*2-e);
        }
        
translate([s+e,s+e,s+e]) cube([cl,cl,hi]);
    }
        translate([s+e,s+e,s+e])difference(){
            cube([cl+s,cl+s,hi]);
            cube([cl,cl,hi]);
        }
        
}