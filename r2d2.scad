h = 150;
r = 80;
s = 2;


leg_w = 30;

first_cut_h = 100;



leg_polygon_points = [
[0,0],
[r/2-5,0],[r/2,5],
[r/2,h/5-5],[r/2-5,h/5+5],
[r/4,h/3],
[r/4,h-r/4],[r/5,h-r/5+5],[r/6,h-r/7+7],
[0,h]];

leg_polygon_points_cut = [
[0,s],
[r/2-5-s,s],[r/2-s,5+s],
[r/2-s,h/5-5-s],[r/2-5-s,h/5+5-s],
[r/4-s,h/3-s],
[r/4-s,h-r/4-s],[r/5-s,h-r/5+5-s],[r/6-s,h-r/7+7-s],
[0,h-s]];


module leg() {
    rotate([90,0,0]) linear_extrude(leg_w*2+2*r){
        polygon(leg_polygon_points);
        mirror()polygon(leg_polygon_points);
    }
}


difference(){
    union(){
        cylinder(h,r,r);
        translate([0,0,h])sphere(r);
        translate([0,r+leg_w,0]) leg();
    }
    translate([0,0,s]) cylinder(h-s,r-s,r-s);
    translate([-500,-500,first_cut_h]) cube([1000,1000,1000]);
    translate([0,r+leg_w-s,0]) rotate([90,0,0]) linear_extrude(leg_w*2+2*r-2*s){
        polygon(leg_polygon_points_cut);
        mirror()polygon(leg_polygon_points_cut);
    }
}


