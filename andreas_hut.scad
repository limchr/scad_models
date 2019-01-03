w = 60;
l = 60;
h = 80;
$fn = 10;
s = 3;

deckel = true;
base = true;
dach = true;
roof_overhang = 5;
roof_height = 30;
small_number = 0.01;

deckel_holder = 5;
deckel_holder_height = 15;
translate([0,0,h+30]) rotate([180,0,0])if(deckel) {
        cube([l,w,s]);
        translate([s,s,0])cube([deckel_holder,deckel_holder,deckel_holder_height]);
        translate([l-s-deckel_holder,s,0])cube([deckel_holder,deckel_holder,deckel_holder_height]);
        translate([s,w-s-deckel_holder,0])cube([deckel_holder,deckel_holder,deckel_holder_height]);
        translate([l-s-deckel_holder,w-s-deckel_holder,0])cube([deckel_holder,deckel_holder,deckel_holder_height]);
        translate([s,s,s]) cube([l-2*s,w-2*s,s]);
}

if(base){
    difference(){
    
    rotate([90,0,0])difference(){
    linear_extrude(w) polygon([[0,0],[0,h],[l,h],[l,h-30],[l-20,h-60],[l-20,0]]);
    translate([s,0,s]) linear_extrude(w-s*2) polygon([[0,0],[0,h],[l-2*s,h],[l-s*2,h-30],[l-20-2*s,h-60],[l-20-2*s,0]]);

    }


    translate([30,-10,h-20]) {
        cube([11,30,6]);
        translate([-1.7,30,3])rotate([90,0,0]) cylinder(60,1.5,1.5);
        translate([11+1.7,30,3])rotate([90,0,0]) cylinder(60,1.5,1.5);
        }

translate([30,-w*0.25,h/1.7]) rotate([0,120,0]) cylinder(200,3.5,3.5);
translate([30,-w*0.75,h/1.7]) rotate([0,120,0]) cylinder(200,3.5,3.5);
        
        translate([l/4,-10,s+2])cube([10,50,7]);
        


}




translate([w-20,-5,15]) rotate([270,0,270]) linear_extrude(s/2)text("HIGH VOLTAGE",5);

translate([w,-2,60]) rotate([270,0,270]) linear_extrude(s/2)text("DANGER",8);
translate([w,-2,68]) rotate([270,0,270]) linear_extrude(s/2)text(
"PhD REQUIRED",5);
translate([w,-2,75]) rotate([270,0,270]) linear_extrude(s/2)text("FOR OPERATION ",5);

cutoff=1.5;
translate([5,s/2,h-20])rotate([90,180,180])difference(){resize([50,50,s/2])surface("resources/gfx/high_voltage_low.png", invert = true);
translate([0,0,-3*cutoff])cube([1000,1000,cutoff]);
}
translate([l-5,-w-s/2,h-10])rotate([90,180,0])difference(){resize([50,50,s/2])surface("resources/gfx/high_voltage_low.png", invert = true);
translate([0,0,-3*cutoff])cube([1000,1000,cutoff]);
}
translate([-s/2,-w+5,h-10])rotate([90,180,-90])difference(){resize([50,50,s/2])surface("resources/gfx/high_voltage_low.png", invert = true);
translate([0,0,-3*cutoff])cube([1000,1000,cutoff]);
}
}
if(dach) translate([l/2-roof_overhang*2,-w/2,0-roof_height])resize([l-20+2*roof_overhang,w+2*roof_overhang,roof_height])rotate([0,0,45])cylinder(10,0,10,$fn=4);

