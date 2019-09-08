include <raspberrypi.scad>


s = 2;

w = 120;
l = 140;
h = 50;


printer_w = 60;
printer_l = 100;
printer_x = 10;
printer_y = l-printer_l-10;

ch = 5;

c = 30;

eps = 0.3;





module box(l,w,h) {
translate([0,c,0]) cube([w-c,l-c,h]);
translate([c,0,0]) cube([w-c,l-c,h]);
translate([c,c,0]) cylinder(h,c,c);
translate([w-c,l-c,0]) cylinder(h,c,c);
}


difference(){
box(l,w,h);
translate([s,s,s])box(l-2*s,w-2*s,h);

translate([printer_x,printer_y,0]) cube([printer_w,printer_l,s]);

translate([w-s,s,s]) cube([s,60,20]);
translate([w-80,0,s]) cube([60,s,10]);


translate([(w-printer_w-printer_x)/2+printer_w+printer_x,l-40,0]) cylinder(s,ch,ch);

translate([w-20,20,-10+s/2])rotate([0,180,0])scale([0.3, 0.3, 0.1])
  surface(file = "resources/gfx/pixbox.png", center = true, invert = true);


}

translate([w-17,35,s])rotate([0,0,90]) zero(1);





translate([0,0,300+h+s]) {
translate([s+eps,s+eps,-s])box(l-2*s-2*eps,w-2*s-2*eps,s);
box(l,w,s);

    
    }