
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



difference(){
    union(){
        linear_extrude(30) leg_upper_polygon(30,20,70,50,5,0);
        mirror() linear_extrude(30) leg_upper_polygon(30,20,70,50,5,0);
    }

    linear_extrude(25)leg_upper_polygon(30,20,70,50,5,5);
    mirror() linear_extrude(25)leg_upper_polygon(30,20,70,50,5,5);
}
