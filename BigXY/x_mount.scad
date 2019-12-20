include<globals.scad>

include<../simple_rounded_cube.scad>

x_mount_x = 100;
x_mount_y = xy_mount_y+xy_mount_w/2-carriage_w/2;
x_mount_z = railandcarriage_h + xy_mount_h/2 + 20 + railandcarriage_h;


//translate([x_mount_x,x_mount_y,x_mount_z - carriage_h]) carriage();




//x_mount starts here
//x_mount ends here

x_mount_h = 50;
x_mount_s = 5;
x_mount_w = pulley_y23_dist - 2 - x_mount_s*2 - 2;

difference() {

translate([x_mount_x,x_mount_y-(x_mount_w-carriage_w)/2,x_mount_z-x_mount_h+x_mount_s-nema17_l-eps]){
    difference(){
        union(){
        sr_cube([carriage_l,x_mount_w,x_mount_h+nema17_l+eps],radius=5);
                translate([0,x_mount_w-x_mount_s,0])sr_cube([carriage_l,x_mount_s,x_mount_h+nema17_l+20+eps],radius=5,corners=[0,0,1,1]);

            }
            translate([0,x_mount_s,nema17_l+x_mount_s]) cube([carriage_l,x_mount_w-2*x_mount_s,x_mount_h-x_mount_s*2]);
        translate([0,0,0])cube([carriage_l,x_mount_w-x_mount_s,nema17_l+eps]);
        
        
        translate([(carriage_l-nema17_l)/2,0,0]) {
        translate([nema17_screw_margin_x,50,nema17_screw_margin_x]) rotate([90,0,0]) cylinder(100, m3_hole_r, m3_hole_r);
        translate([nema17_screw_margin_x+nema17_screw_dist_x,50,nema17_screw_margin_x]) rotate([90,0,0]) cylinder(100, m3_hole_r, m3_hole_r);
        translate([nema17_screw_margin_x,50,nema17_screw_margin_x+nema17_screw_dist_x]) rotate([90,0,0]) cylinder(100, m3_hole_r, m3_hole_r);
        translate([nema17_screw_margin_x+nema17_screw_dist_x,50,nema17_screw_margin_x+nema17_screw_dist_x]) rotate([90,0,0]) cylinder(100, m3_hole_r, m3_hole_r);

        }




    }

}

translate([x_mount_x+carriage_hole_x_margin,x_mount_y+carriage_hole_y_margin,x_mount_z]) {
    
    carriage_screw_hole();
                translate([carriage_hole_distance,0,0]) carriage_screw_hole();
                translate([carriage_hole_distance,carriage_hole_distance,0]) carriage_screw_hole();
                translate([0,carriage_hole_distance,0]) carriage_screw_hole();


}

translate([x_mount_x+10,x_mount_y-500,pulley_z1]) cube([5,1000,9]);
translate([x_mount_x+10,x_mount_y-500,pulley_z2]) cube([5,1000,9]);

translate([x_mount_x+carriage_l-15,x_mount_y-500,pulley_z1]) cube([5,1000,9]);
translate([x_mount_x+carriage_l-15,x_mount_y-500,pulley_z2]) cube([5,1000,9]);

translate([x_mount_x+10,x_mount_y-500,x_mount_z+x_mount_s]) cube([m3_screw_r*2,1000,15]);
translate([x_mount_x+carriage_l-15,x_mount_y-500,x_mount_z+x_mount_s]) cube([m3_screw_r*2,1000,15]);



}

