h = 150;
r = 50;
s = 2;



space_top = 0;
space_bottom = 0;

increment_x = 8;
increment_y = 8;
$fn = 360/increment_x;

hole_r = 3;



difference(){
    cylinder(h,r,r);
    translate([0,0,s]) cylinder(h,r-s,r-s);
        for(y = [s+space_bottom+hole_r : increment_y : h-space_top-hole_r]) {

            for(x = [0 : increment_x : 360]) {
                 translate([0,0, y]) rotate([90,0,x]) cylinder(500,hole_r,hole_r);
                 }
         }

    
}