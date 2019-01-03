rw = 6;
rm = 8;
rh = 2.5;
h = 30;

w = 80;

l = 80;

difference() {
    union() {
translate([0,-l/2,0])translate([-w/2,-rw/2,rw])rotate([0,90,0])linear_extrude(w)polygon([[0,0],[rw-rw/4,0],[rw,rw/4],[rw,rw-rw/4],[rw-rw/4,rw],[0,rw]]);

translate([0,-l/4,0])translate([-w/2,-rw/2,rw])rotate([0,90,0])linear_extrude(w)polygon([[0,0],[rw-rw/4,0],[rw,rw/4],[rw,rw-rw/4],[rw-rw/4,rw],[0,rw]]);

translate([0,l/4,0])translate([-w/2,-rw/2,rw])rotate([0,90,0])linear_extrude(w)polygon([[0,0],[rw-rw/4,0],[rw,rw/4],[rw,rw-rw/4],[rw-rw/4,rw],[0,rw]]);

translate([0,l/2,0])translate([-w/2,-rw/2,rw])rotate([0,90,0])linear_extrude(w)polygon([[0,0],[rw-rw/4,0],[rw,rw/4],[rw,rw-rw/4],[rw-rw/4,rw],[0,rw]]);

translate([-w/2+rw,-l/2,rw])rotate([0,90,90])linear_extrude(l)polygon([[0,0],[rw-rw/4,0],[rw,rw/4],[rw,rw-rw/4],[rw-rw/4,rw],[0,rw]]);

translate([w/2,-l/2,rw])rotate([0,90,90])linear_extrude(l)polygon([[0,0],[rw-rw/4,0],[rw,rw/4],[rw,rw-rw/4],[rw-rw/4,rw],[0,rw]]);

translate([0,0,0])translate([-w/2,-rm/2,rm])rotate([0,90.0])linear_extrude(w)polygon([[-h,0],[rm-rm/4,0],[rm,rm/4],[rm,rm-rm/4],[rm-rm/4,rm],[-h,rm]]);
    }
    
    translate([-w/2,-rh/2,rw])cube([w,rh,h+rw]);
}