
print_base = true;
print_top = false;

//fillet = 10;
//
//radius_bottom_inner = 120;
//r = 140;
//r_roof = 155;
//
//radius_pole = 50;
//
//base_bottom_height = 50;
//
//h = 300;
//
////global strength
//s = 5;
//
//
//width_feeder_holes = 40;
//
//width_roof_holes = 20;
//
////for unperfectness in print, change to a small number
//margin = 2;
//
//roof_height = 100;
//
//width_roof_hang = 30;
//hang_holes_r = 8;
//
//resolution = 20;
//$fn=resolution;




fillet = 10;

radius_bottom_inner = 80;
r = 105;
r_roof = 110;

radius_pole = 40;

base_bottom_height = 30;

h = 200;

//global strength
s = 2;


width_feeder_holes = 40;

width_roof_holes = 20;

//for unperfectness in print, change to a small number
margin = 2;

roof_height = 80;

width_roof_hang = 30;
hang_holes_r = 8;

resolution = 20;
$fn=resolution;











use <bezier.scad>

function _get_paths(paths,i,fill_point)=
    i == len(paths)-2? [[paths[i],paths[i+1],fill_point]] :
    concat([[paths[i],paths[i+1],fill_point]],_get_paths(paths,i+1,fill_point));
    
function _range(maxi,i)=
    i == maxi? maxi
    : concat(i,_range(maxi,i+1));
    
module bezier_model_filled(points,fill_point,resolution,thickness) {
    bez_paths = _range(resolution,0);
    bezier_points = bezier(points,resolution);
    paths = _get_paths(bez_paths,0,len(bezier_points));
    translate([0,0,0]) 
        rotate_extrude()
            polygon(concat(bezier_points,[fill_point]),paths=paths);
}

if(print_base) {

    difference() {
        //base with pole
        union() {
        rotate_extrude() polygon( points=[[0,0],[radius_bottom_inner,0],[radius_bottom_inner,s],[radius_pole,s],[radius_pole,h],[radius_pole-s,h],[radius_pole-s,s],[0,s]] );
        bezier_model([[radius_bottom_inner,0],[r-fillet,0],[r,base_bottom_height],[r+2,base_bottom_height]],resolution,s);
        
            bezier_model_filled([[radius_bottom_inner-fillet,s],[radius_pole,s],[radius_pole-s/2,radius_pole]],[radius_pole-s/2,s],resolution,s);
            }
        //cut out feeder holes
        translate([0,radius_bottom_inner-fillet,s])rotate([90,0,0]) linear_extrude((radius_bottom_inner-fillet)*2) polygon(points=bezier([[-width_feeder_holes/2,0],[-width_feeder_holes/2,width_feeder_holes],[-2,width_feeder_holes],[2,width_feeder_holes],[width_feeder_holes/2,width_feeder_holes],[width_feeder_holes/2,0]],resolution));
        rotate([0,0,90])translate([0,radius_bottom_inner-fillet,s])rotate([90,0,0]) linear_extrude((radius_bottom_inner-fillet)*2) polygon(points=bezier([[-width_feeder_holes/2,0],[-width_feeder_holes/2,width_feeder_holes],[-2,width_feeder_holes],[2,width_feeder_holes],[width_feeder_holes/2,width_feeder_holes],[width_feeder_holes/2,0]],resolution));

        //cut out roof mountings
        for(variable = [0 : 90 : 360])
            rotate([0,0,variable])
        translate([-width_roof_holes/2,0,h-width_roof_holes*2])rotate([90,0,0])linear_extrude(500)
        polygon(points=[[0,0],[width_roof_holes*2+margin,0],[width_roof_holes*2+margin,width_roof_holes*2],[width_roof_holes,width_roof_holes*2],[width_roof_holes,width_roof_holes],[width_roof_holes/2,width_roof_holes*1.5],[0,width_roof_holes]]);

    }
}

if(print_top) {
    translate([0,0,h-width_roof_holes*2]) {
        //roof mount rods
        for(variable = [0 : 90 : 360])
            rotate([0,0,variable])
        translate([-width_roof_holes/2,0,0])rotate([90,0,0])linear_extrude(r_roof-margin)
        polygon(points=[[0,0],[width_roof_holes,0],[width_roof_holes,width_roof_holes/2-margin],[width_roof_holes/2,width_roof_holes-margin],[0,width_roof_holes/2-margin]]);

        //main roof
        difference() {
        union() {
            bezier_model([[r_roof,0],[r_roof,roof_height/2],[width_roof_hang,roof_height-width_roof_hang],[width_roof_hang+s,roof_height]],resolution,s);
            rotate_extrude()polygon(points=concat(bezier([[width_roof_hang+s*1.5,roof_height],[width_roof_hang+s,roof_height+width_roof_hang*2],[0,roof_height+width_roof_hang*2]],resolution),[[0,roof_height]]));
        }


        //hang mount
        translate([0,0,roof_height+width_roof_hang])
        for(variable = [0 : 90 : 360])
            rotate([0,0,variable])
        rotate([90,0,0])cylinder(500,hang_holes_r,hang_holes_r);
        }
        
        //stabilyser cylinder for rods and roof
        cylinder(roof_height,width_roof_hang+s,width_roof_hang+s);

    }
}
