include <roundedcube.scad>;


$fn = 50;

print_bottom = false;
print_mid = false;
print_mid_top = false;
print_top = false;
print_baseplate = false;
print_baseplate_2 = false;
print_baseplate_round = false;
print_visualizations = false;
print_wheel = true;

l1_h = 68;
l2_h = 60;
l3_h = 70;


r = 80;
s = 2;

//error while printing
eps = 0.8;

//connector h from top (thinner) connection
connector_h = s*3;
//holder height that holds a base plate (floor)
holder_h = s*2;

//legs
legs_offset = 15;

leg_w = 30;
leg_w_bottom = 56;
leg_h = 50; // height of upper part of leg
leg_h_bottom = 55;
leg_d = 34;
leg_fillet = 5;
leg_w_top = 10;
leg_h_top = 40;

leg3_w = 15;
leg3_w_bottom = 35;
leg3_h = 40; // height of upper part of leg
leg3_h_bottom = 50;
leg3_d = 50;
leg3_fillet = 5;
leg3_w_top = 8;
leg3_h_top = 30;


servo_holder_w = 5;
servo_holder_l = 20;
servo_holder_h = 3;


front_wheel_height = 30;
front_wheel_screw_distance = 55;
front_wheel_screw_radius = 2.3;

servo_w = 37;
servo_l = 40;
servo_h = 20;
servo_axis_x = 30;
wheel_w = 20;
wheel_r = front_wheel_height+s+servo_h/2;
wheel_margin = 8; // margin for wheel holes
wheel_whole_offset_y = 4;
wheel_inner_hole_r = 10.4+eps;


if(print_wheel){
    translate([-300,0,0]) {
        difference() {
            cylinder(wheel_w,wheel_r,wheel_r);
            
            //hole for servo
            translate([0,0,0])cylinder(s,wheel_inner_hole_r,wheel_inner_hole_r);
            
            //hollow wheel
            translate([0,0,2*s])cylinder(wheel_w-s*2,wheel_r*0.5,wheel_r*0.9);
            
            //tire profile
            for(deg = [0 : 10 : 360]) {
                rotate([0,0,deg]) translate([wheel_r-3,0,0]) cube([3,3,wheel_w]);
            }
            //inner wheel holes
            for(deg = [0 : 45 : 360]) {
                rotate([0,0,deg]) translate([15,0,0]) rotate([0,0,0]) linear_extrude(wheel_w) polygon([[0,-2.5],[20,-4],[20,4], [0,2.5]]);
                }
                for(ph = [3, wheel_w/2, wheel_w-3]) {
            difference(){
                translate([0,0,ph-0.5])cylinder(1,wheel_r,wheel_r);
                translate([0,0,ph-0.5])cylinder(1,wheel_r-0.5,wheel_r-0.5);
                }
            }
            
            
        }
        difference(){
        translate([0,0,-2*s])sphere(wheel_r/2.5);
        translate([0,0,-100+2*s])cylinder(100,100,100);
            }
            }
}

module servo() {
    cube([servo_l, servo_w, servo_h]);
    translate([servo_axis_x,servo_l,servo_h/2]) rotate([90,0,0])cylinder(servo_l,2,2);
    translate([servo_axis_x,servo_w+wheel_w,servo_h/2]) rotate([90,0,0])cylinder(wheel_w,wheel_r,wheel_r);
    }
    
    
if(print_visualizations) {
    translate([legs_offset-servo_axis_x,r-servo_w,s]) {
    servo();
    }
    rotate([180,0,0])translate([legs_offset-servo_axis_x,r-servo_w,-s-servo_h]) {
    servo();
    }
        translate([-r-leg3_d/2,0,-front_wheel_height])cylinder(front_wheel_height, front_wheel_screw_distance/2-5 ,front_wheel_screw_distance/2-5);
    }


module leg_bottom_polygon(leg_w,leg_w_bottom,leg_h, leg_h_bottom, leg_fillet,shrinkage){
    polygon([
        [0,shrinkage],
        [leg_w_bottom-leg_fillet-shrinkage/2,shrinkage],[leg_w_bottom-shrinkage,leg_fillet+shrinkage/2],
        [leg_w_bottom-shrinkage,leg_h_bottom-leg_fillet*3-shrinkage/2],[leg_w-shrinkage,leg_h_bottom-shrinkage/2],
        [leg_w-shrinkage,leg_h],[0,leg_h]
    ]);
}
//!difference(){
//    leg_bottom_polygon(leg_w,leg_w_bottom,l1_h, leg_h_bottom, leg_fillet,0);
//    translate([0,0,0])leg_bottom_polygon(leg_w,leg_w_bottom,l1_h, leg_h_bottom, leg_fillet,s);
//    }
    
module complete_bottom_leg(leg_w,leg_w_bottom,leg_h, leg_h_bottom, leg_fillet,shrinkage) {
    leg_bottom_polygon(leg_w,leg_w_bottom,leg_h, leg_h_bottom, leg_fillet,shrinkage);
    mirror() leg_bottom_polygon(leg_w,leg_w_bottom,leg_h, leg_h_bottom, leg_fillet,shrinkage);
}

module leg_upper_polygon(leg_w,leg_w_top,leg_h, leg_h_top, leg_fillet,shrinkage){
    leg_h_bottom = leg_h-leg_h_top;
    polygon([
        [0,0],
        [leg_w-shrinkage,0],
        [leg_w-shrinkage,leg_h_bottom-shrinkage/2], [leg_w_top-shrinkage,leg_h_bottom-shrinkage/2+leg_fillet],
        [leg_w_top-shrinkage,leg_h-shrinkage/2], [leg_w_top-shrinkage/2-leg_fillet,leg_h-shrinkage+leg_fillet],
        [0,leg_h-shrinkage+leg_fillet],
    ]);
}

module complete_upper_leg(leg_w,leg_w_top,leg_h, leg_h_top, leg_fillet,shrinkage) {
    leg_upper_polygon(leg_w,leg_w_top,leg_h, leg_h_top, leg_fillet,shrinkage);
    mirror() leg_upper_polygon(leg_w,leg_w_top,leg_h, leg_h_top, leg_fillet,shrinkage);
}

module base_plate(e,s) {
    cylinder(s,r-e,r-e);
    translate([legs_offset-leg_w+e,-r-leg_d+e,0]) 
        cube([leg_w*2-2*e,2*leg_d+2*r-2*e,s]);
    translate([-r-leg3_d+e,-leg3_w+e,0]) 
        cube([leg3_d*2-e*2,leg3_w*2-e*2,s]);
}



// bottom layer
if(print_bottom){
    difference() {
        union(){
            //base cylinder
            cylinder(l1_h,r,r);
            //legs
            translate([legs_offset,r+leg_d,0])     rotate([90,0,0]) linear_extrude(leg_d*2+2*r){
            complete_bottom_leg(leg_w,leg_w_bottom,l1_h, leg_h_bottom, leg_fillet,0);
            }
                // 3. leg
            translate([-r-leg3_d,0,0])     rotate([90,0,90]) linear_extrude(leg3_d*2){
                complete_bottom_leg(leg3_w,leg3_w_bottom,l1_h, leg3_h_bottom, leg3_fillet,0);
            }


        }
        //cut cylinder
        translate([0,0,s]) cylinder(l1_h-s,r-s,r-s);
        
        //cut legs
        translate([legs_offset,r+leg_d-s,0]) rotate([90,0,0]) linear_extrude(leg_d*2+2*r-2*s){
            complete_bottom_leg(leg_w,leg_w_bottom,l1_h, leg_h_bottom, leg_fillet,s);
        }
        // cut 3. leg
        translate([-r-leg3_d+s,0,0])     rotate([90,0,90]) linear_extrude(leg3_d*2-s){
            complete_bottom_leg(leg3_w,leg3_w_bottom,l1_h, leg3_h_bottom, leg3_fillet,s);
        }


        //cut wheel wholes
        translate([legs_offset-wheel_r-wheel_margin,r-wheel_margin+wheel_whole_offset_y,0]) {
            cube([2*wheel_r+2*wheel_margin,wheel_w+2*wheel_margin,s*5]);
            }
        translate([legs_offset-wheel_r-wheel_margin, -r+wheel_margin-wheel_w-2*wheel_margin-wheel_whole_offset_y,0]) {
            cube([2*wheel_r+2*wheel_margin,wheel_w+2*wheel_margin,s*5]);
            }
            
        //cut port
        port_w = 20;
        port_h = 10;
        translate([-r-leg3_d,0,l1_h/2])roundedcube([5*s,port_w,port_h],center=true,radius=3,$fn=10);

        //cut switch hole
            switch_h = 20;
            switch_w = 13;
            rotate([0,0,-35])translate([-r,0,l1_h/2-switch_h/2]) cube([s*2,switch_w,switch_h]);

        //cut holes for front wheel
            
        translate([-r-leg3_d/2,0,0]) {
            translate([0,-front_wheel_screw_distance/2,0]) cylinder(s,front_wheel_screw_radius,front_wheel_screw_radius);
            translate([0,front_wheel_screw_distance/2,0]) cylinder(s,front_wheel_screw_radius,front_wheel_screw_radius);

        }
    }

    // servo alignments
    translate([legs_offset-servo_axis_x,r-servo_w,s]) {
        translate([-servo_holder_w-eps,-servo_holder_w-eps,0]) cube([servo_l+2*servo_holder_w+2*eps,servo_holder_w,servo_holder_h]);
        translate([-servo_holder_w-eps,-eps,0]) cube([servo_holder_w,servo_holder_l,servo_holder_h]);
        translate([servo_l+eps,-eps,0]) cube([servo_holder_w,servo_holder_l,servo_holder_h]);
    }

    translate([legs_offset-servo_axis_x,-r+servo_w,s]) {
        translate([-servo_holder_w-eps,eps,0]) cube([servo_l+2*servo_holder_w+2*eps,servo_holder_w,servo_holder_h]);
        translate([-servo_holder_w-eps,eps-servo_holder_l,0]) cube([servo_holder_w,servo_holder_l,servo_holder_h]);
        translate([servo_l+eps,eps-servo_holder_l,0]) cube([servo_holder_w,servo_holder_l,servo_holder_h]);
    }


    // plate holder ring
    translate([0,0,l1_h-connector_h-holder_h*(1/3)-s]) {
        difference(){
            base_plate(s,holder_h/3);
            base_plate(2*s,holder_h/3);
        }
    }
    translate([0,0,l1_h-connector_h-holder_h*(2/3)-s]) {
        difference(){
            base_plate(s,holder_h/3);
            base_plate(1.6*s,holder_h/3);
        }
    }
    translate([0,0,l1_h-connector_h-holder_h-s]) {
        difference(){
            base_plate(s,holder_h/3);
            base_plate(1.3*s,holder_h/3);
        }
    }

}



// floor plate
if(print_baseplate) translate([0,0,l1_h*1.5-s-connector_h]) {
    base_plate(s+eps,s);
}



// 2. floor
if(print_mid) translate([0,0,l1_h*2]){
        // plate upper connector
        translate([0,0,0]) {
            difference(){
                base_plate(s+eps,connector_h);
                base_plate(s*2+eps,connector_h);
            }
        }

        // second connector connection
        translate([0,0,connector_h]) {
            difference(){
                base_plate(0,s);
                base_plate(s*2+eps,s);
            }
        }

        //etage
        translate([0,0,connector_h]) {
            difference(){
                base_plate(0,l2_h);
                base_plate(s,l2_h);
            }
        }
        
    // plate holder ring
    translate([0,0,l2_h-holder_h*(1/3)-s]) {
        difference(){
            base_plate(s,holder_h/3);
            base_plate(2*s,holder_h/3);
        }
    }
    translate([0,0,l2_h-holder_h*(2/3)-s]) {
        difference(){
            base_plate(s,holder_h/3);
            base_plate(1.6*s,holder_h/3);
        }
    }
    translate([0,0,l2_h-holder_h-s]) {
        difference(){
            base_plate(s,holder_h/3);
            base_plate(1.3*s,holder_h/3);
        }
    }

}



// floor plate
if(print_baseplate_2) translate([0,0,l1_h*2+l2_h*1.5-s-connector_h]) {
    base_plate(s+eps,s);
}



// 3rd etage
if(print_mid_top) translate([0,0,l1_h*2+l2_h*2]) {

    // plate upper connector
    translate([0,0,0]) {
        difference(){
            base_plate(s+eps,connector_h);
            base_plate(s*2+eps,connector_h);
        }
    }

    // second connector connection
    translate([0,0,connector_h]) {
        difference(){
            base_plate(0,s);
            base_plate(s*2+eps,s);
        }
    }


    translate([0,0,connector_h])difference() {
        union(){
            //base cylinder
            cylinder(l3_h,r,r);
            //legs
            translate([legs_offset,r+leg_d,0])     rotate([90,0,0]) linear_extrude(leg_d*2+2*r){ complete_upper_leg(leg_w,leg_w_top,leg_h, leg_h_top, leg_fillet,0);    }
        // 3. leg
            translate([-r-leg3_d,0,0])     rotate([90,0,90]) linear_extrude(leg3_d*2){ complete_upper_leg(leg3_w,leg3_w_top,leg3_h, leg3_h_top, leg3_fillet,0);    }
        }
        //union(){
        //cut cylinder
        translate([0,0,0]) cylinder(l3_h,r-s,r-s);
        
        //cut legs
        translate([legs_offset,r+leg_d-s,0]) rotate([90,0,0]) linear_extrude(leg_d*2+2*r-2*s){
            complete_upper_leg(leg_w,leg_w_top,leg_h, leg_h_top, leg_fillet,s);    
        }
        // cut 3. leg
        translate([-r-leg3_d+s,0,0]) rotate([90,0,90]) linear_extrude(leg3_d*2-s){
            complete_upper_leg(leg3_w,leg3_w_top,leg3_h, leg3_h_top, leg3_fillet,s);    
        }
    //}
    }


    // plate holder ring
    translate([0,0,l3_h-holder_h*(1/3)-s]) {
        difference(){
            cylinder(holder_h/3,r-s,r-s);
            cylinder(holder_h/3,r-s*2,r-s*2);
        }
    }
    translate([0,0,l3_h-holder_h*(2/3)-s]) {
        difference(){
             cylinder(holder_h/3,r-s,r-s);
            cylinder(holder_h/3,r-s*1.6,r-s*1.6);
        }
    }
    translate([0,0,l3_h-holder_h-s]) {
        difference(){
             cylinder(holder_h/3,r-s,r-s);
            cylinder(holder_h/3,r-s*1.3,r-s*1.3);
        }
    }



}



// round baseplate
if(print_baseplate_round) translate([0,0,l1_h*2+l2_h*2+l3_h*1.5]) {
                cylinder(s,r-s-eps,r-s-eps);
}



//roof
if(print_top) translate([0,0,(l1_h+l2_h+l3_h)*2]) {
    // plate upper connector
    translate([0,0,0]) {
        difference(){
            cylinder(connector_h,r-s-eps,r-s-eps);
            cylinder(connector_h,r-s*2-eps,r-s*2-eps);
        }
    }

    // second connector connection
    translate([0,0,connector_h]) {
        difference(){
            cylinder(s,r,r);
            cylinder(s,r-2*s-eps,r-2*s-eps);
        }
    }
    
    //roof
    translate([0,0,connector_h+s]) {
        difference(){
            sphere(r);
            sphere(r-s);
            translate([-500,-500,-500]) cube([1000,1000,500]);
        }     
    }
}

