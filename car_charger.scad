r1 = 11;
r2 = 17;
s = 1.2;
l = 52;
y=19;
x=9;
w=14;
h=15;

$fn = 100;

print_base = true;
print_hat = false;
rotate([180,0,0]) {
if(print_base) {
difference(){
rotate_extrude()polygon([[r1,0],[r2,3],[r2,l],[r2+s,l],[r2+s,2.3],[r1+s+1,0]]);

translate([-r2+x,0,y]) cube([w,100,100]);
}
}
if(print_hat){
translate([0,0,50]){
translate([0,0,l]) cylinder(s,r2+s,r2+s);
translate([0,0,y+h])difference(){
    cylinder(l-y-h,r2-0.2,r2-0.2);
    cylinder(l-y-h,r2-s-0.2,r2-s-0.2);
    }
}
}
}