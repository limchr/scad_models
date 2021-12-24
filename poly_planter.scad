//
// what to print
//

print_outer = true;
print_inner = false;



//
// global variables
//

//error of printer in mm
e = 0.3;



//
// variables for outer part
//

//height
h = 170*0.81;
//outer width
w = 170*0.81;

//strength of outer walls
so = 6;

//strength bottom
sb = 2;

//number of circle divisions
nd = 32;
//number of vertical divisions
nv = 8;

//use radius increment list for custom outer pot shape
use_custom_radius = true;
//multiplier for radius increase list (for extremer/less extreme shapes)
rmu = 30.0;
//radius increments using custom radius
radius_addition = [0.3*rmu,0.7*rmu, 1.0*rmu, 1.2*rmu, 1.33*rmu, 1.41*rmu, 1.45*rmu, 1.45*rmu, 1.45*rmu, ]; //pod shape
//radius_addition = [0.3*rmu,0.7*rmu, 1.0*rmu, 1.2*rmu, 1.35*rmu, 1.2*rmu, 1.0*rmu, 0.7*rmu, 0.2*rmu, 0.1*rmu, 0.2*rmu, 0.7*rmu, 1.2*rmu]; //vase shape


//polyhedra with more sides
use_advanced_polygons = true;

//amount of random noise
rn = 12;

//margin inner ring
mir = 1.5;
//depth inner ring
dir = 2.0;


//
// variables for inner part
//

//height inner part
hi = h - 5;

//strength bottom inner
sbi = 0.9;

//strength of inner walls
si = 0.8;

//divisions of inner holder
ne = nd;

//width ratio of inner soil holder
wr = 0.8;

//number of water holes
nwh = nd/2;
//water hole radius
whr = 1.5;



//
//do not change
//

//random points for polyhedron offsets
rnds = rands(-rn/2,rn/2,nd*(nv+1));

// this inner width (width of soil holder)
wi = wr * w;

// this radius of outer width
r = w/2;

// radius of inner width (soil holder)
ri = wi/2;

// height step
hs = h/nv;

//degrees to turn in loop
c = 360/nd;


function get_i_smooth(arr, perc) = let(ifloat = perc * (len(arr)-1), iint = floor(ifloat), m1 = ifloat - iint, m2 = 1-m1) iint < len(arr)-1 ? m2*arr[iint] + m1*arr[iint+1] : arr[len(arr)-1];
    
//prints one polyhedron on a specific coordinate in vertical and horizontal pod coordinate space
module element(v,d,so) {
            din = (d+1)%nd;
            gh = 0; //very small gap horizontally
            gv = 0; //very small gap vertically
    
    
            tri =  use_custom_radius ? r + get_i_smooth(radius_addition,v/(nv-1)) : r; //radius of inner vector
            tro = tri + so;
            triu = use_custom_radius ? r + get_i_smooth(radius_addition,(v+1)/(nv-1)) : r; // radius of upper polygons inner vector
            trou = triu + so;
            
            trim = (tri + triu) / 2.0;
            trom = (tro + trou) / 2.0;
            
            on = rnds[v*nd+d]; //offset normal
            os = rnds[v*nd+din]; //offset side
            ou = rnds[(v+1)*nd+d]; //offset upper
            ous = rnds[(v+1)*nd+din]; //offset upper side
            om = (on+os+ou+ous)/4.0;
            if(use_advanced_polygons) {
                polyhedron(points=[
                [cos(c*d)*(tri+on),-sin(c*d)*(tri+on),v*hs],
                [cos(c*din-gh)*(tri+os),-sin(c*din-gh)*(tri+os),v*hs], // one to the side
                [cos(c*d)*(triu+ou),-sin(c*d)*(triu+ou),(v+1)*hs-gv], //one up
                [cos(c*din-gh)*(triu+ous),-sin(c*din-gh)*(triu+ous),(v+1)*hs-gv], // one up and one to the side
                
                [cos(c*d)*(tro+on),-sin(c*d)*(tro+on),v*hs],
                [cos(c*din-gh)*(tro+os),-sin(c*din-gh)*(tro+os),v*hs], // one to the side
                [cos(c*d)*(trou+ou),-sin(c*d)*(trou+ou),(v+1)*hs-gv], //one up
                [cos(c*din-gh)*(trou+ous),-sin(c*din-gh)*(trou+ous),(v+1)*hs-gv], // one up and one to the side
                
                [cos(c*d+c*0.5)*(trim+om),-sin(c*d+c*0.5)*(trim+om),v*hs+hs*0.5],
                [cos(c*d+c*0.5)*(trom+om),-sin(c*d+c*0.5)*(trom+om),v*hs+hs*0.5],

                ]
                ,faces=[
                [0,2,8], [0,8,1], [8,3,1], [8,2,3], //inner face with 4 triangles
                [4,9,6], [9,7,6], [9,5,7], [4,5,9], //outer face with 4
                [0,1,4], [1,5,4], //bottom face
                [6,3,2], [6,7,3], //top face
                [2,0,4], [6,2,4], //left face
                [3,5,1], [3,7,5], //right face
                ]);
            } else {
                polyhedron(points=[
                [cos(c*d)*(tri+on),-sin(c*d)*(tri+on),v*hs],
                [cos(c*din-gh)*(tri+os),-sin(c*din-gh)*(tri+os),v*hs], // one to the side
                [cos(c*d)*(triu+ou),-sin(c*d)*(triu+ou),(v+1)*hs-gv], //one up
                [cos(c*din-gh)*(triu+ous),-sin(c*din-gh)*(triu+ous),(v+1)*hs-gv], // one up and one to the side
                
                [cos(c*d)*(tro+on),-sin(c*d)*(tro+on),v*hs],
                [cos(c*din-gh)*(tro+os),-sin(c*din-gh)*(tro+os),v*hs], // one to the side
                [cos(c*d)*(trou+ou),-sin(c*d)*(trou+ou),(v+1)*hs-gv], //one up
                [cos(c*din-gh)*(trou+ous),-sin(c*din-gh)*(trou+ous),(v+1)*hs-gv], // one up and one to the side
                ]
                ,faces=[
                [0,2,1], [2,3,1], //inner face with 2 triangles
                [4,5,6], [7,6,5], //outer face
                [0,1,4], [1,5,4], //bottom face
                [6,3,2], [6,7,3], //top face
                [2,0,4], [6,2,4], //left face
                [3,5,1], [3,7,5], //right face
                ]);
            }

    
    }




//print outer pod
if(print_outer) {
//print botton part
    difference(){
        cylinder(sb+dir,500,500);
        for(d = [0:(nd)-1]) {
            element(0,d,500);
        }
        ricutout = use_custom_radius ? ri + radius_addition[0] : ri;
        translate([0,0,sb]) cylinder(dir,ricutout+mir+e,ricutout+mir+e);
    }
    
    //main cylinder 
    for(v = [0:(nv)-1]) {
        for(d = [0:(nd)-1]) {
            element(v,d,so);
        }
    }
} //print outer
    
//print inner part
if(print_inner){
    tx = use_custom_radius ? w + 2* radius_addition[len(radius_addition)-1]+rn/2+1 : w+rn/2+1;    
    translate([tx,0,0]) {
        ricutout = use_custom_radius ? ri + radius_addition[0] : ri;
        cylinder(sbi,ricutout,ricutout,$fn=ne);
        
        translate([0,0,sbi]) {
            difference() {
                for(v = [0:nv-1]) {
                tri = use_custom_radius ? ri + get_i_smooth(radius_addition,v/(nv-1)) -si : ri -si; //radius of inner
                tro = tri + si;
                triu = use_custom_radius ? ri + get_i_smooth(radius_addition,(v+1)/(nv-1)) -si : ri -si; // radius of upper
                trou = triu + si;
                difference(){
                    translate([0,0,v*hs])cylinder(hs,tro,trou,$fn=ne);
                    translate([0,0,v*hs])cylinder(hs,tri,triu,$fn=ne);
                }
    }
                    translate([0,0,hi]) cylinder(500,500,500); //cut out upper part to have height hi (height inner)
                    for(i = [-90:360/nwh:269]) { //cut out water holes
                    translate([0,0,whr])rotate([90,0,i])cylinder(500,whr,whr);
                }
            }
        }
    }
}
            
