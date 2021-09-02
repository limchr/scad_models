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
h = 90;
//outer width
w = 120;

//strength of outer walls
so = 0.9;

//strength bottom
sb = 1.5;

//number of circle divisions
nd = 32;
//number of vertical divisions
nv = 8;
//amount of random noise
rn = 4;

//height inner ring
hir = 3;
//margin inner ring
mir = 1;
//width inner ring
wir = 3;



//
// variables for inner part
//

//height inner
hi = h - 10;

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

// radius outer
ro = r + so;

// radius of inner width
ri = wi/2;

// height step
hs = h/nv;

//degrees to turn in loop
c = 360/nd;





if(print_outer) {
//print botton part
    for(d = [0:(nd)-1]) {
                    din = (d+1)%nd;

            polyhedron(points=[
            [0,0,0],
            [cos(c*d)*ro+rnds[d],-sin(c*d)*ro+rnds[d],0],
            [cos(c*din)*ro+rnds[din],-sin(c*din)*ro+rnds[din],0],
            [0,0,sb],
            [cos(c*d)*r+rnds[d],-sin(c*d)*r+rnds[d],sb],
            [cos(c*din)*r+rnds[din],-sin(c*din)*r+rnds[din],sb],

            ],
            faces=[
        [0,2,1],[3,4,5], // top and buttom face
        [1,4,0],[4,3,0], // left side
        [0,3,5],[0,5,2], // right side
        [1,2,4],[4,2,5] // back side
            ]
        );
    }

//print ring for inlay
    translate([0,0,sb])difference(){
        cylinder(hir,ri+wir+mir,ri+wir+mir,$fn=ne);
        cylinder(hir,ri+mir+e,ri+mir+e,$fn=ne);
    }


    //main cylinder
    for(v = [0:(nv)-1]) {
        for(d = [0:(nd)-1]) {
            din = (d+1)%nd;
            gh = 0; //very small gap horizontally
            gv = 0; //very small gap vertically
            polyhedron(points=[
            [cos(c*d)*r+rnds[v*nd+d],-sin(c*d)*r+rnds[v*nd+d],v*hs],
            [cos(c*din-gh)*r+rnds[v*nd+din],-sin(c*din-gh)*r+rnds[v*nd+din],v*hs], // one to the side
            [cos(c*d)*r+rnds[(v+1)*nd+d],-sin(c*d)*r+rnds[(v+1)*nd+d],(v+1)*hs-gv], //one up
            [cos(c*din-gh)*r+rnds[(v+1)*nd+din],-sin(c*din-gh)*r+rnds[(v+1)*nd+din],(v+1)*hs-gv], // one up and one to the side
            
            [cos(c*d)*ro+rnds[v*nd+d],-sin(c*d)*ro+rnds[v*nd+d],v*hs],
            [cos(c*din-gh)*ro+rnds[v*nd+din],-sin(c*din-gh)*ro+rnds[v*nd+din],v*hs], // one to the side
            [cos(c*d)*ro+rnds[(v+1)*nd+d],-sin(c*d)*ro+rnds[(v+1)*nd+d],(v+1)*hs-gv], //one up
            [cos(c*din-gh)*ro+rnds[(v+1)*nd+din],-sin(c*din-gh)*ro+rnds[(v+1)*nd+din],(v+1)*hs-gv], // one up and one to the side

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
} //print outer
    
//print inner part
    if(print_inner){
    translate([w,0,0]) {
        cylinder(sbi,ri,ri,$fn=ne);
        translate([0,0,sbi]) {

            difference() {
                cylinder(hi,ri,ri,$fn=ne);
                cylinder(hi,ri-si,ri-si,$fn=ne);
                
                for(i = [-90:360/nwh:269]) {
                    translate([0,0,whr])rotate([90,0,i])cylinder(r,whr,whr);
                }
            }
        }
    }
}
            
