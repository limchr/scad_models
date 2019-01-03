r = 50;
h = 80;
s = 1.5;




translate([0,0,-s])linear_extrude(height = s) circle(r = r,$fn=10);

linear_extrude(height = h-s, center = false, convexity = 10, twist = 60)
translate([0, 0, 0])
difference(){
circle(r = r,$fn=10);
circle(r = r-s,$fn=10);
}