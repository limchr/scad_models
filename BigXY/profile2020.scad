module cutout() {
    polygon([[0,7],[2,7],[2,3],[6,7],[6,13],[2,17],[2,13],[0,13]]);
}

module profile2020(l) {
    color([0,0,1])
        linear_extrude(l)
            difference(){
                square(20);
                cutout();
                translate([20,0,0])rotate([0,0,90]) cutout();
                translate([20,20,0])rotate([0,0,180]) cutout();
                translate([0,20,0])rotate([0,0,270]) cutout();
                translate([10,10,0])circle(3);
            }
}
