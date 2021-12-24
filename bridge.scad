//h = 6.5;
//h2 = 3;
//w = 6;
//num_strings = 4;
//string_dist = 10;
//l = 35;
//string_dias = [0.5588, 0.8636, 0.635, 0.4826];
//msd = min(string_dias);
//notch_depth = [2+string_dias[0]-msd,2+string_dias[1]-msd,2+string_dias[2]-msd,2+string_dias[3]-msd];
//notch_width = 4;
//notch_angle = 10;

h = 4.5;
h2 = 2;
w = 6;
num_strings = 4;
string_dist = 38/3;
l = 62;
string_dias = [0.5588, 0.8636, 0.635, 0.4826];
msd = min(string_dias);
notch_depth = [2+string_dias[3]-msd,2+string_dias[2]-msd,2+string_dias[1]-msd,2+string_dias[0]-msd];
notch_width = 4;
notch_angle = 10;



margin = (l - ((num_strings-1)*string_dist))/2;



difference() {
    translate([0,w,0])
        rotate([0,-90,180])
            linear_extrude(l)
                polygon([[0,0],[0,w],[h,w],[h2,0]]);

    for(i = [0:num_strings-1]) {
        translate([margin+i*string_dist,0,h]) {
            rotate([-90+notch_angle,180,0])
                linear_extrude(w*2)
                    polygon([[-notch_width/2,0],[notch_width/2,0],[0,-notch_depth[i]]]);

        }
    }
}