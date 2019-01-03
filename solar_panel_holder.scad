w = 70;
h = 111;

border = 3;
height = 3;
depth = 1;

num_x = 2;
num_y = 1;

for(x = [0:num_x-1]){
    for(y = [0:num_y-1]){
        translate([x*(w+border),y*(h+border),0])
        difference(){
            cube([w+2*border,h+2*border,height]);
            translate([border,border,height-depth]) cube([w,h,height]);
            translate([border*2,border*2,0]) cube([w-2*border,h-2*border,height]);
        }
        translate([x*(w+border),y*(h+border)+(border/2+h/2),0]) cube([w,border,height-depth]);

    }
}