
w = 20;
s = 3;
num = 7;
h = 5;
inc = 0.1;

difference() {
    cube([s+(w+s)*num,w*2+3*s,h]);
    translate([s+(w+s)*0,s,0]) cube([w,w,h]);
    translate([s+(w+s)*1,s,0]) cube([w+1*inc,w+1*inc,h]);
    translate([s+(w+s)*2,s,0]) cube([w+2*inc,w+2*inc,h]);
    translate([s+(w+s)*3,s,0]) cube([w+3*inc,w+3*inc,h]);
    translate([s+(w+s)*4,s,0]) cube([w+4*inc,w+4*inc,h]);
    translate([s+(w+s)*5,s,0]) cube([w+5*inc,w+5*inc,h]);
    translate([s+(w+s)*6,s,0]) cube([w+6*inc,w+6*inc,h]);
    translate([s+(w+s)*0,w+2*s,0]) cube([w+7*inc,w+7*inc,h]);
    translate([s+(w+s)*1,w+2*s,0]) cube([w+8*inc,w+8*inc,h]);
    translate([s+(w+s)*2,w+2*s,0]) cube([w+9*inc,w+9*inc,h]);
    translate([s+(w+s)*3,w+2*s,0]) cube([w+10*inc,w+10*inc,h]);
    translate([s+(w+s)*4,w+2*s,0]) cube([w+11*inc,w+11*inc,h]);
    translate([s+(w+s)*5,w+2*s,0]) cube([w+12*inc,w+12*inc,h]);
    translate([s+(w+s)*6,w+2*s,0]) cube([w+13*inc,w+13*inc,h]);
}