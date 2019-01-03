width = 100;
length = 100;
height = 20;

ff_width = 10;
thickness = 1;

numw = width / ff_width;
numl = length / ff_width;
for(w = [0:numw]) {
    translate([w*ff_width,0,0])cube([thickness,length,height]);
}

for(w = [0:numl]) {
    translate([0,w*ff_width,0])cube([length,thickness,height]);
}


translate([-20,0,0])cube([20,length+thickness,height]);
translate([length,0,0])cube([20,length+thickness,height]);