use <bezier.scad>

print_base = false;
print_roof = true;

$fn = 150;

//length and width
l = 170;
//height
h = 120;
//height inner
hi = 70;
//center cut out length
cl = 33;



//thickness of walls
s = 2;

//for compensate imprecise print
e = 1;

//big integer
b = 1000000;

//horizontal holder offset
hdx = 90;
//vertical holder offset
hdy = 11.5*8;

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
 
hole_height = h/3;
hole_r = 30;
air_hole_r = 3; 
stand_r = 8;
stand_l = 50;

module holder(hw1,hw2,hd1,hd2,hl) {
    translate([0,-hl/2,-hw1/2])cube([hd1,hl,hw1]);
    translate([hd1,-hl/2,-hw2/2]) cube([hd2,hl,hw2]);
} 

module holder_hook(hw1,hw2,hd1,hd2,hl) {
    translate([0,-hl/2,-hw1/2])cube([hd1,hl,hw1]);
    translate([hd1,-hl/2,-hw1/2]) cube([hd2,hl,hw2]);
} 

if(print_base) {

    translate([0,hdx,hw2/2])rotate([0,0,180])holder(hw1,hw2,hd1,hd2,hl);
    translate([hdx,0,hw2/2])rotate([0,0,-90])holder(hw1,hw2,hd1,hd2,hl);
    translate([0,hdx,hw2/2+hdy])rotate([0,0,180])holder_hook(hw1,hw2,hd1,hd2,hl);
    translate([hdx,0,hw2/2+hdy])rotate([0,0,-90])holder_hook(hw1,hw2,hd1,hd2,hl);

    difference(){
        intersection() {
        cube([l,l,h]);
        cylinder(h,l,l);
         }
            
        intersection(){
         translate([s,s,s])cube([l-2*s,l-2*s,h]);
        cylinder(h,l-s,l-s);
        }
        
        //cut out innermost cube
        cube([cl,cl,h]);
        

        //cut holes in bottom
        rotate([0,0,25])translate([l*0.4,0,0]) cylinder(s,air_hole_r,air_hole_r);
        rotate([0,0,25])translate([l*0.6,0,0]) cylinder(s,air_hole_r,air_hole_r);
        rotate([0,0,25])translate([l*0.8,0,0]) cylinder(s,air_hole_r,air_hole_r);
        rotate([0,0,45])translate([l*0.4,0,0]) cylinder(s,air_hole_r,air_hole_r);
        rotate([0,0,45])translate([l*0.6,0,0]) cylinder(s,air_hole_r,air_hole_r);
        rotate([0,0,45])translate([l*0.8,0,0]) cylinder(s,air_hole_r,air_hole_r);
        rotate([0,0,65])translate([l*0.4,0,0]) cylinder(s,air_hole_r,air_hole_r);
        rotate([0,0,65])translate([l*0.6,0,0]) cylinder(s,air_hole_r,air_hole_r);
        rotate([0,0,65])translate([l*0.8,0,0]) cylinder(s,air_hole_r,air_hole_r);
        

        //front hole
        translate([l/2,l/2,hole_height]) rotate([0,90,45])cylinder(b,hole_r,hole_r);

        
        }
        difference() {
         rotate([0,0,45])translate([l-s,0,0]) rotate([0,90,0]) cylinder(stand_l,stand_r,stand_r);
         translate([0,0,-1000])cube(1000,1000,1000);
            }


        difference(){
            cube([cl+s,cl+s,h]);
            cube([cl,cl,h]);
        }
        
   
    }

roof_edge = 10;
if(print_roof) {
    translate([0,0,h]) {
        difference(){
            intersection() {
        cube([l+s+e,l+s+e,s+roof_edge]);
        cylinder(s+roof_edge,l+s+e,l+s+e);
         }
        cylinder(roof_edge,l+e,l+e);
         
        //cut out innermost cube
        cube([cl-s-e,cl-s-e,h]);
        
        
     }
     translate([cl-s-e,0,0]) cube([s,cl-e,roof_edge]);
     translate([0,cl-s-e,0]) cube([cl-e,s,roof_edge]);

     }
    
}

