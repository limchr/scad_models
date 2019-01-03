use <bezier.scad>

$fn = 150;

//length and width
l = 220;
//height
h = 140;
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
hdy = 128;

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
 
 tube_r = 6;
 
 
module holder(hw1,hw2,hd1,hd2,hl) {
    translate([0,-hl/2,-hw1/2])cube([hd1,hl,hw1]);
    translate([hd1,-hl/2,-hw2/2]) cube([hd2,hl,hw2]);
} 

module holder_hook(hw1,hw2,hd1,hd2,hl) {
    translate([0,-hl/2,-hw1/2])cube([hd1,hl,hw1]);
    translate([hd1,-hl/2,-hw1/2]) cube([hd2,hl,hw2]);
} 


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
        
        //cut out for hi (stand)
        translate([s,s,hi])cube([b,b,b]);
           
       //fillet 
        translate([l,0,hi*1.5])rotate([0,-45,0])cube([b,b,b]);
        translate([0,l,hi*1.5])rotate([45,0,0])cube([b,b,b]);

        //cut holes in bottom
        translate([(l/2)/sqrt(2),(l/2)/sqrt(2),0]) cylinder(s,tube_r,tube_r);
        translate([(l*0.75)/sqrt(2),(l*0.75)/sqrt(2),0]) cylinder(s,tube_r,tube_r);
        
        //cut hole for water cleaning
        translate([l/2,l/2,s+tube_r]) rotate([0,90,45])cylinder(b,tube_r,tube_r);
    
        //screw holes for pump
        pump_hole_x = 46;
        pump_hole_y = 9;
        screw_r = 2;
       translate([(l/2)/sqrt(2),(l/2)/sqrt(2),0])rotate([0,0,45]){
            translate([-pump_hole_y,pump_hole_x/2,0]) cylinder(s,screw_r,screw_r);
            translate([-pump_hole_y,-pump_hole_x/2,0]) cylinder(s,screw_r,screw_r);
            
         }
        
        
        
        }
        difference(){
            cube([cl+s,cl+s,h]);
            cube([cl,cl,h]);
        }
        



    sl = 20;
    sh=20;
    
    //border for sitting
    difference(){
    translate([0,0,hi-sh*0.7])rotate_extrude(angle=90)translate([l-s/2,0,0])polygon(bezier([[0,0],[-s/2,sh*0.6],[-sl,sh],[sl,sh],[s/2,sh*0.6],[0,0]],20));
        cube([b,s+e,b]);
        cube([s+e,b,b]);

    }




