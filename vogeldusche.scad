s = 1;
r = 30;
h = 50;
hr = 1.3;


//base
bh = 120;
rb = 110;
bhh = 50;



holder_w = 5;
holder_d = 10;

$fn = 100;

num_holes_x = 4;
num_holes_rad = 10;

print_base = false;
print_head = true;


if(print_base) {
    difference(){
        cylinder(bhh,rb,rb);
        radi = 170;
        translate([0,0,radi+3*s])sphere(radi-s);
    }

    translate([r-holder_d,-holder_w/2,s]) cube([holder_d,holder_w,bh]);
    rotate([0,0,120])translate([r-holder_d,-holder_w/2,s]) cube([holder_d,holder_w,bh]);
    rotate([0,0,240])translate([r-holder_d,-holder_w/2,s]) cube([holder_d,holder_w,bh]);

}
pr = 5;
translate([0,0,bh])if(print_head) {
    rotate_extrude() 
            polygon([[r,0],[pr,h],[pr,h+10],[pr+s,h+10],[pr+s,h],[r+s,0]]);

    difference() {
        cylinder(s,r,r);
        for(j=[1:num_holes_rad]) {
                rotate([0,0,j*(360/num_holes_rad)]) for(i=[2:num_holes_x]) {
                    translate([i*((r-4*s)/num_holes_x),0,0]) cylinder(2,hr,hr,$fn=20);
                }
        }
    }
}
