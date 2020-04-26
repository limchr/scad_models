//width of haircutter
w = 37.4;

//holder height
hh = 2;
//holder width
hw = 3;



l = 24.5;

//holder pin length
hpl = 1.5;
//holder pin depth
hpd = 3;

phi = 37;

cube([hw,l,hh]); 



translate([hw,0,0]) {
linear_extrude(hh) polygon([[0,0],[0,5],[hpd,5]]);
//translate([0,5+hpl,0]) cube([hpd,28.5,hh]);
}

translate([w+hw,0,0]) cube([hw,l,hh]);
translate([w+hw,0,0]){ 
linear_extrude(hh) polygon([[0,0],[0,5],[-hpd,5]]);
//translate([-hpd,5+hpl,0]) cube([hpd,28.5,hh]);
}

//width of hair glider
ww = 1;
//number of hair glider
num = 8;
dist = (w+2*hw-ww) / num;


h = 22;

difference() {
translate([0,l-hw,0]) rotate([-phi,0,0]) {
    translate([0,0,0])    cube([w+2*hw,hw,h*0.5]);

    difference() {
        for(i = [0:num]) {
        translate([i*dist,0,0])cube([ww,hw,h]);
        }
        translate([0,hw/2,h-hw/2 ]) {
            difference() {
                translate([0,0,0])cube([w+2*hw,hw/2,hw/2]);
                rotate([0,90,0]) cylinder(w+2*hw,hw/2,hw/2,$fn=30);
            }
                }
    }

}
translate([-500,-500,-200]) cube([1000,1000,200]);
}