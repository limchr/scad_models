eps = 0.3;

s = 2;

l = 75; //length from bed screw on in the direction of the aluminium profile
w = 75; //width from the aluminium profile to the outer profile where the chain is

profile_w = 10.2; //profile width of bed holding profiles
shr = (3+eps) /2; //screw hole radius of bed screw
shr_chain = (3+eps) /2; //screw hole radius of cable chain
sd_chain = 8; //screw distance of cable chain end piece (distance from center of the screw holes


difference() {
    //main part
    union() {
        linear_extrude(s) polygon([[0,0],[l,0],[l,w],[l-sd_chain-6*shr_chain,w],[l/2+5,w*0.75],[l/2-5,w*0.75],[sd_chain+6*shr_chain,w],[0,w],[0,profile_w+2*s]]);
        translate([0,0,s])cube([l,s,profile_w]);
        translate([0,profile_w+s,s])cube([l,s,profile_w]);
    }
    
    //screw hole for bed screw for fixing part
    translate([l/2,s+profile_w/2,0]) cylinder(s,shr,shr);
    
    //cable chain screw holes
    translate([l-2*shr_chain,w-2*shr_chain,0]) cylinder(s,shr_chain,shr_chain);
    translate([l-2*shr_chain-sd_chain,w-2*shr_chain,0]) cylinder(s,shr_chain,shr_chain);
    translate([l-2*shr_chain,w-2*shr_chain-sd_chain,0]) cylinder(s,shr_chain,shr_chain);
    translate([l-2*shr_chain-sd_chain,w-2*shr_chain-sd_chain,0]) cylinder(s,shr_chain,shr_chain);

    translate([2*shr_chain,w-2*shr_chain,0]) cylinder(s,shr_chain,shr_chain);
    translate([2*shr_chain+sd_chain,w-2*shr_chain,0]) cylinder(s,shr_chain,shr_chain);
    translate([2*shr_chain,w-2*shr_chain-sd_chain,0]) cylinder(s,shr_chain,shr_chain);
    translate([2*shr_chain+sd_chain,w-2*shr_chain-sd_chain,0]) cylinder(s,shr_chain,shr_chain);


}