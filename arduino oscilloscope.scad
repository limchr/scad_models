w = 54;
l= 70;
s = 2;
h = 25+s;
//screw hole r in base plate
sh = 2;

$fn = 10;

//screwholes in case
sho = 3;
shi = 1.5;

bh = 3;

usb_w = 13;
usb_h = 12;
pw_w = 10;
pw_h = 12;

usb_s = 9.5;
pw_s = 40;

h1_x = 3;
h1_y = 16;

h2_x = 50;
h2_y = 14;

h3_x = 18;
h3_y = 66;

h4_x = 46;
h4_y = 66;

dw = 27.5;
dl = 20;
dm = 22;
dhr = 1.2;




base_plate = false;
cover = true;

if(base_plate) {
difference(){
cube([w,l,s]);


translate([h1_x,h1_y,0])cylinder(s,sh,sh);
translate([h2_x,h2_y,0])cylinder(s,sh,sh);
translate([h3_x,h3_y,0])cylinder(s,sh,sh);
translate([h4_x,h4_y,0])cylinder(s,sh,sh);

}

}



translate([0,0,40])if(cover) {
    difference(){
translate([-s,-s,0])cube([w+2*s,l+2*s,h]);
    
            cube([w,l,h-s]);
        
        translate([usb_s,-s,0]) cube([usb_w,s,usb_h+s+bh]);
        translate([pw_s,-s,0]) cube([pw_w,s,pw_h+s+bh]);
        
        
                translate([h1_x,h1_y,s+bh])cylinder(h-s-bh,sho,sho);
        translate([h2_x,h2_y,s+bh])cylinder(h-s-bh,sho,sho);
        translate([h3_x,h3_y,s+bh])cylinder(h-s-bh,sho,sho);
        translate([h4_x,h4_y,s+bh])cylinder(h-s-bh,sho,sho);

        
        translate([(w-dl)/2,(l-dw)/2,0]) {
            
            translate([w/2+5,40,h-s/2]) rotate([0,0,-90])linear_extrude(s/2) text("SIG GND GND 5V 3.3V",3);
            translate([w/2,20,0]) cube([2.7,12.7,1000]);
            
            
            cube([dl,dw,1000]);
            translate([dl/2,dw/2,0]){
                    translate([-dm/2,-dm/2,0]) cylinder(1000,dhr,dhr);
                    translate([dm/2,-dm/2,0]) cylinder(1000,dhr,dhr);
                    translate([-dm/2,dm/2,0]) cylinder(1000,dhr,dhr);
                    translate([dm/2,dm/2,0]) cylinder(1000,dhr,dhr);
            }
            
        }
        
        }
        difference(){
    union() {
        translate([h1_x,h1_y,s+bh])cylinder(h-s-bh,sho,sho);
        translate([h2_x,h2_y,s+bh])cylinder(h-s-bh,sho,sho);
        translate([h3_x,h3_y,s+bh])cylinder(h-s-bh,sho,sho);
        translate([h4_x,h4_y,s+bh])cylinder(h-s-bh,sho,sho);
    }
            translate([h1_x,h1_y,s+bh])cylinder(h-s-bh,shi,shi);
        translate([h2_x,h2_y,s+bh])cylinder(h-s-bh,shi,shi);
        translate([h3_x,h3_y,s+bh])cylinder(h-s-bh,shi,shi);
        translate([h4_x,h4_y,s+bh])cylinder(h-s-bh,shi,shi);



        }
}


