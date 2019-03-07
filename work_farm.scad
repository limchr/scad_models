s = 2;
num_edges = 6;
r = 70;
h = 150;
b_h = 30;
b_i_h = b_h/2;
holes_r = 3;
holes_num = 10;
holes_pos = r/2;
increment = 360 / num_edges;
mu = 0.4;

//l_edge = (2 * PI * r)/num_edges;
l_edge = 2*r * sin(increment/2);
holder_w = 10;

difference() {
    cylinder(h,r,r,$fn=num_edges);
    cylinder(h,r-s,r-s,$fn=num_edges);

    for (angle = [0 : increment : 360]) {
        translate([0,0,holder_w])rotate([0,0,angle]) translate([r,0,0]) rotate([0,0,increment/2]) {
            translate([-s,holder_w,0])cube([s*2,l_edge-holder_w*2,h]);
        }
    }

}




//for (angle = [0 : increment : 360]) {
//    rotate([0,0,angle]) translate([r,0,0]) {
//        rotate([0,0,increment/2]) translate([0,-edge_fill,0]) cube([2,10,10]);
//        rotate([0,0,-increment/2]) translate([0,-10+edge_fill,0]) cube([2,10,10]);        
//    }
//}
