print_outer = true;
print_inner = false;

//length and width
l = 200;
//height
h = 150;

//thickness of walls
s = 3;

//margin for window
m = 20;

//for compensate imprecise print
e = 1;

//bit integer
b = 1000000;

//vertical distance between holder
hdy = 50;
//horizontal distance between holder
hdx = 100;

//holder width 1
hw1 = 10;
//holder width 2
hw2 = 12;
//holder length 1
hd1 = 3;
//holder length 2
hd2 = 5;
//holder zize
hl = 30;
 
module holder(hw1,hw2,hd1,hd2,hl) {
    translate([0,-hl/2,-hw1/2])cube([hd1,hl,hw1]);
    translate([hd1,-hl/2,-hw2/2]) cube([hd2,hl,hw2]);
} 



if(print_outer){
    translate([0,(l-hdx)/2,(h-hdy)/2])rotate([0,0,180])holder(hw1,hw2,hd1,hd2,hl);
    translate([0,(l+hdx)/2,(h-hdy)/2])rotate([0,0,180])holder(hw1,hw2,hd1,hd2,hl);
    translate([0,(l-hdx)/2,(h+hdy)/2])rotate([0,0,180])holder(hw1,hw2,hd1,hd2,hl);
    translate([0,(l+hdx)/2,(h+hdy)/2])rotate([0,0,180])holder(hw1,hw2,hd1,hd2,hl);

    translate([(l-hdx)/2,0,(h-hdy)/2])rotate([0,0,-90])holder(hw1,hw2,hd1,hd2,hl);
    translate([(l+hdx)/2,0,(h-hdy)/2])rotate([0,0,-90])holder(hw1,hw2,hd1,hd2,hl);
    translate([(l-hdx)/2,0,(h+hdy)/2])rotate([0,0,-90])holder(hw1,hw2,hd1,hd2,hl);
    translate([(l+hdx)/2,0,(h+hdy)/2])rotate([0,0,-90])holder(hw1,hw2,hd1,hd2,hl);


    difference(){
        cube([l,l,h]);
        translate([s,s,s])cube([l-2*s,l-2*s,h]);
        translate([s+m,s+m,s+m]) {
            cube([b,b,b]);    

        }
    }
}
if(print_inner) {
    difference(){
        translate([s+e,s+e,s])cube([l-s*2-e*2,l-s*2-e*2,h-s]);
        translate([s*2+e,s*2+e,s*2])cube([l-s*4-e*2,l-s*4-e*2,h-s]);
        translate([s+m,s+m,s+m]) {
            cube([l-2*(s+m),b,b]);    
            cube([b,l-2*(s+m),b]);    

        }
    }
}