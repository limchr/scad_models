cylinder_length = 130;
cylinder_radius = 60;
wall_strength = 2;
fa_cylinder = 3;


hole_radius = 20;
num_holes = 3;
fa_holes = 3;



difference() {
difference() {
difference() {
translate([0,0,0])rotate([90,0,0])cylinder(cylinder_length,cylinder_radius,cylinder_radius,$fa=fa_cylinder);
translate([-cylinder_radius,-cylinder_length,-cylinder_radius])cube([cylinder_radius*2,cylinder_length,cylinder_radius]);
}

difference() {
translate([0,-wall_strength,0])rotate([90,0,0])cylinder(cylinder_length-2*wall_strength,cylinder_radius-wall_strength,cylinder_radius-wall_strength,$fa=fa_cylinder);
translate([-cylinder_radius,-cylinder_length,-cylinder_radius+wall_strength])cube([cylinder_radius*2,cylinder_length,cylinder_radius]);
}
}

hi = (cylinder_length-wall_strength*2-hole_radius*2) / (num_holes-1);
for(h = [0:num_holes-1]) {
    translate([0,-hole_radius-wall_strength-h*hi,wall_strength]) cylinder(1000,hole_radius,hole_radius,$fa=fa_holes);
}
}