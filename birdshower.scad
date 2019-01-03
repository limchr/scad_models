h = 200;
r = 100;
s = 2;
big = 100000;

bottom_height = 50;
tube_r = 10;

difference() {
union() {
cylinder(h,r,r);
translate([0,0,h])sphere(r);
//rotate([0,0,-90])translate([r,0,0])cylinder(big,tube_r+2,tube_r+2);

}
translate([-big/2,0,bottom_height])cube([big,big,big]);
translate([0,0,bottom_height])cylinder(h-bottom_height,r-s,r-s);
translate([0,0,s])cylinder(bottom_height,r-s,r-s);
translate([0,0,h])sphere(r-s);

//rotate([0,0,-90])translate([r,0,0])cylinder(big,tube_r+s,tube_r+s);

cylinder(s,tube_r,tube_r);
translate([0,r*0.8,0])cylinder(s,tube_r,tube_r);


}


//intersection(){
//difference() {
//rotate([0,0,-90])translate([r,0,0])cylinder(big,tube_r+s,tube_r+s);
//rotate([0,0,-90])translate([r,0,0])cylinder(big,tube_r,tube_r);
//}
//union() {
//cylinder(h,r,r);
//translate([0,0,h])sphere(r);
////rotate([0,0,-90])translate([r,0,0])cylinder(big,tube_r+2,tube_r+2);
//
//}
//}
use <bezier.scad>
    sl = 20;
    sh=20;
    //border for sitting
    difference(){
    translate([0,0,bottom_height-sh/2])
        rotate_extrude(angle=180)
        translate([r-s/2,0,0])
        polygon(bezier([[0,0],[-s/2,sh*0.6],[-sl,sh],[sl,sh],[s/2,sh*0.6],[0,0]],20));

    }





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
    translate([-hd1*5,-hl/2,-hw1/2])cube([hd1*5,hl,hw1]); //longer thing, bugfix
    translate([hd1,-hl/2,-hw2/2]) cube([hd2,hl,hw2]);
} 
difference(){
    union(){
rotate([0,0,-135]){
translate([r,0,bottom_height/2])holder(hw1,hw2,hd1,hd2,hl);
rotate([0,0,90])translate([r,0,bottom_height/2])holder(hw1,hw2,hd1,hd2,hl);
}
translate([0,0,h/2])rotate([0,0,-135]){
translate([r,0,bottom_height/2])holder(hw1,hw2,hd1,hd2,hl);
rotate([0,0,90])translate([r,0,bottom_height/2])holder(hw1,hw2,hd1,hd2,hl);
}
}
cylinder(h-bottom_height,r-s,r-s);
}