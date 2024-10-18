ow = 160; // width
oh = 185; // height

d = 4; // material thickness

s = 8; // width of inner structures
b = 15; // border with

iw = ow - 2*b; // inner width
ih = oh - 2*b; // outer width


ws = iw*0.42; // width of inner square
hs = ih*0.7; // height of inner square

hr = 40/2; // hole radius for lamp mount

fh = 60; //foot height

// creates an array of rectangles that can be used for cut outs (zapfen und zargen)
// l: length of side
// w: width of cutouts
// n: number of cutouts
// r: reverse (start with empty space if true)
module cut_outs(l, w, n, r=false) {
    el = l/(n*2-1);
    
    
    if(r) for(i = [0:1:n-2]) translate([i*el*2+el,0,0]) square([el,w]);
    else for(i = [0:1:n-1]) translate([i*el*2,0,0]) square([el,w]);
        
    
    
}

module side(long_side=true) {
    eb = long_side ? b : b-d; // effective border
    color("blue") difference() {
        square(size=[iw+2*eb,oh]);
        translate([eb,b,0]) square(size=[iw,ih]);
    }

    translate([eb,b,0]) {
        translate([iw/2+ws/2-s/2,0,0]) square(size=[s, hs]);
        translate([iw/2-ws/2+s/2,hs,0]) square(size=[iw/2+ws/2-s/2,s]);
        translate([iw/2-ws/2-s/2,hs-ws+s]) square(size=[s,ih-hs+ws-s]);
        translate([0,hs-ws,0]) square(size=[iw/2+ws/2-s/2,s]); 
    }
    fw = fh*0.3; // foot width
    fwb = fw * 0.15;
    translate([0,-fh,0]) polygon([[0,0],[fwb+eb,0],[fw+eb,fh],[0,fh]]);
    translate([iw+eb*2-fw,-fh,0]) polygon([[fw-fwb-eb,0],[fw,0],[fw,fh],[-eb,fh]]);
}

module top() {
    ew = ow-2*d; // effective width
    
    eb = b-d; // effective border
    eiw = ew-2*eb; // effective inner width
    difference() {
    square([ew,ew]);
    translate([eb,eb,0]) square([ew-eb*2,ew-eb*2]);
    }

    translate([eb,eb,0]) {
        translate([eiw/2-ws/2-s/2,0]) square([s,eiw]); 
        translate([eiw/2+ws/2-s/2,0]) square([s,eiw]);
        translate([0,eiw/2-ws/2-s/2]) square([eiw,s]); 
        translate([0,eiw/2+ws/2-s/2]) square([eiw,s]); 
    } 
}

module bottom() {
    ew = ow-2*d; // effective width
    eb = b-d; // effective border
    eiw = ew-2*eb; // effective inner width
    bs = s*2; // bottom strength
    
    module bh() { // whole for bottom
        difference() {
        square(eiw/2-bs/2);
            translate([eiw/2,eiw/2]) circle(hr+bs);
        }
    }
    
    
    difference() {
        square([ew,ew]);
        translate([ew/2,ew/2,0]) circle(hr);
        translate([eb,eb,0]) bh();
        translate([ew-eb,eb,0]) rotate([0,0,90]) bh();
        translate([eb,ew-eb,0]) rotate([0,0,270]) bh();
        translate([ew-eb,ew-eb,0]) rotate([0,0,180]) bh();
        
    }

}

if(false) {
    translate([d,d,oh-d]) linear_extrude(d) top();
    translate([d,d,0]) linear_extrude(d) bottom();
    translate([0,d,0]) rotate([90,0,0]) linear_extrude(d) side();
    translate([0,ow,0]) rotate([90,0,0]) linear_extrude(d) side();
    translate([0,d,0]) rotate([90,0,90]) linear_extrude(d) side(false);
    translate([ow-d,d,0]) rotate([90,0,90]) linear_extrude(d) side(false);
} else {
    pm = 2; // printing margin between parts

    translate([ow*2+pm,oh,0]) rotate([0,0,180]) side(true);
    translate([ow,oh,0]) rotate([0,0,180]) side(true);

    translate([ow*1.35+pm,oh+fh+pm,0]) rotate([0,0,0]) side(false);
    translate([ow*0.38+pm,oh+fh+pm,0]) rotate([0,0,0]) side(false);

    translate([0,oh*2+fh+2*pm,0]) rotate([0,0,0]) bottom();
    translate([ow,oh*2+fh+2*pm,0]) rotate([0,0,0]) top();
}

// translate([d,0,0])rotate([0,0,90])cut_outs(oh, d, 5, false);
// side(false);