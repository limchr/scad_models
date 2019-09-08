strength = 2;

height = 10;

num_w = 20;
num_l = 10;

grid_w = 11;
grid_l = 8;

print_borders = true;
border_strength = 5;


for(x = [1:num_w-1]) {
    translate([x*grid_w-strength/2,0,0]) cube([strength,num_l*grid_l,height]);
}

for(x = [1:num_l-1]) {
    translate([0,x*grid_l-strength/2,0]) cube([num_w*grid_w,strength,height]);
}

if(print_borders) {
        translate([-border_strength,-border_strength,0])
            cube([num_w*grid_w+2*border_strength,border_strength,height]);
        translate([-border_strength,num_l*grid_l,0])
            cube([num_w*grid_w+2*border_strength,border_strength,height]);
        translate([-border_strength,-border_strength,0])
            cube([border_strength,num_l*grid_l+2*border_strength,height]);
        translate([num_w*grid_w,-border_strength,0])
            cube([border_strength,num_l*grid_l+2*border_strength,height]);
                  
    
}