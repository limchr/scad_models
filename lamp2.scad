parts = 6;
angle = 360/parts;
l = 100;
h = 50;
a = h/tan(75);
side_l = sqrt(h*h+a*a);
s = 2;
edge_w = 5;
w = 30;

strip_holes_w = 20;
strip_holes_h = 5;

echo(l);
echo(angle);
echo(a);
echo(side_l);

difference(){
for(ang = [0 : angle : 360]) {
    rotate([0,0,ang]) translate([-l/2,l,0]) {
        difference(){
            linear_extrude(w) polygon([[0,0],[l,0],[l+sin(angle/2)*side_l,cos(angle/2)*side_l],[0-sin(angle/2)*side_l,cos(angle/2)*side_l]]);
            translate([s,s,s])linear_extrude(w-2*s) polygon([[0,0],[l-2*s,0],[l-2*s+sin(angle/2)*(side_l-2*s),cos(angle/2)*(side_l-2*s)],[0-sin(angle/2)*(side_l-2*s),cos(angle/2)*(side_l-2*s)]]);
            translate([s,s,s+edge_w])linear_extrude(w-2*edge_w-2*s) polygon([
            [edge_w,0],
            [l-edge_w-2*s,0],
            [l-edge_w-2*s+sin(angle/2)*(side_l),cos(angle/2)*(side_l)],
            [edge_w-sin(angle/2)*(side_l),cos(angle/2)*(side_l)]]);
            
            translate([-l*2,s,s]) cube([l*2,strip_holes_w,strip_holes_h]);
            
            }
        }
}

translate([-500,-500,w/2])cube([1000,1000,1000]);

}