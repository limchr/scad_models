$fn = 100;

module joint(r,s) {
    //cutoff sides
    jcs = s*3;
    //joint angle
    ja = 35;
        p = [
    [0,-0.2*s],
    [-r+s*3.5,0],[-r+s*3,s*0.4],
    [(-r+s*0.9)/2,(r-s*2)/2.5],
    [(-r+s*1.5)/2,(r-s*2)/1.3],
    [(-r+s*3)/2,(r-s*1.4)/1.3],
    [0,r-s*2],
    ];
    p2 = [[0,0],[jcs+s,0],[jcs,s*0.35],[jcs*0.6,s*1.8],[0+s*0.4,jcs*1.5],[0,jcs*1.5+s]];
    
        translate([-r,0,s/2]) rotate([ja,0,0])cube([r*2,r*2,r*2]);
    translate([-r,0,-s/2]) rotate([270-ja,0,0]) cube([r*2,r*2,r*2]);
    translate([0,s,-r]) {
        linear_extrude(r*2) polygon(p);
        mirror([1,0,0])linear_extrude(r*2) polygon(p);
    }
    
    translate([-r,0,-r]) linear_extrude(r*2) polygon(p2);      
    mirror([1,0,0])translate([-r,0,-r]) linear_extrude(r*2) polygon(p2);
    //translate([r,0,-r]) linear_extrude(r*2) polygon([[0,0],[-jcs,0],[0,jcs]]);
}

module elem(l,r1,r2,s) {
    difference(){
    rotate([-90,0,0]) cylinder(l,r1,r2);
    joint(r1,s);
    translate([0,l,0])rotate([0,90,-180]) joint(r2,s);
        translate([-500,-500,-500]) cube([1000,1000,500-r1+s]);
        
        }
}


num_elem = 5;
elem_l = 15;
elem_r = 5.5;
elem_s = 1.2;

for(i = [0:num_elem-1]) {
    translate([0,i*(elem_l-3*elem_s),0]) elem(elem_l,elem_r,elem_r,elem_s);
}

