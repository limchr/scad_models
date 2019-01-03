r = 20;
s = 2;
$fn =20;

hole_radius = 1.5;

rod_radius = 3.0;
rod_height = 150;

 difference() {
    union(){
            sphere(r);
             cylinder(rod_height+r,rod_radius,rod_radius);
             translate([0,0,rod_height+r]) sphere(rod_radius);

    }
    translate([-r,-r,-r])cube([1000,1000,r]);
    sphere(r-s);
}

difference(){
intersection(){cylinder(s,r,r);sphere(r);}
   rotate([0,90,0])rotate_extrude()translate([hole_radius*3,0,0])circle(hole_radius);
}
//make the line hole
difference(){
   rotate([0,90,0])rotate_extrude()translate([hole_radius*3,0,0])circle(hole_radius+s);
   rotate([0,90,0])rotate_extrude()translate([hole_radius*3,0,0])circle(hole_radius);
   translate([-r,-r,-r])cube([1000,1000,r]);

    }
//calculate needed weight
v =0.5* 3.1415*(4/3)*pow(r/10,3);
echo("NECCECARY WEIGHT",v);
//f = m*a