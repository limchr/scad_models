// min h of a vertex
min_h = 5;
// max h of a vertex
max_h = 70;

// random seed
seed = 1;

// number of tiles in x direction
tiles_x = 5;
// number of tiles in y direction
tiles_y = 3;

// number of polygons per tile in x direction
pol_x = 3;
// number of polygons per tile in y direction
pol_y = 3;

// tile width
tile_w = 250;
// tile height
tile_h = 250;

// margin between parts (for display)
mar = 50;


//screw mount: radius screw canal
rscrew = 8/2;
//screw mount: radius screw head
rhead = 10/2;
//screw mount: depth head
dhead = 2.5;
//screw mount: depth of screw mount
dscrew = min_h-1;
//screw mount: screw margin to module outer border in x direction
smarx = 50;
//screw mount: screw margin to module outer border in y direction
smary = 50;

// polygon width
pol_w = tile_w/pol_x;
// polygon height
pol_h = tile_h/pol_y;

// number of vertecies to be generated in x direction
nvx = tiles_x*(pol_x+1)-tiles_x+1;
// number of vertecies to be generated in y direction
nvy = tiles_y*(pol_y+1)-tiles_y+1;

// edges containing random height of vertices
edges = rands(min_h,max_h,nvx*nvy, seed);

// getting 2d position from 1d array
// arguments: arr (the array), ww (width of the rows), xx (2d x position), yy (2d y position)
function gp2d(arr,ww,xx,yy) = arr[yy*ww+xx];

//// global height functions ( change for creating some global pattern (e.g. wave) 
//function ghf(lvx,lvy) = 0;
//function ghf(lvx,lvy) = (cos(lvx/20.0*360)+1)*70;
function ghf(lvx,lvy) = (cos((lvy*(5.0/3.0)+lvx)/10.0*360)+1)*50;
//function ghf(lvx,lvy) = (sin(lvx/10.0*360)+cos(lvy/10.0*360+180)+2)*80;


// get the total height of a certain edge (vertex) position of a certain wmodule (local height from edges array and global height function)
function edge_h(ptx,pty,ppx,ppy) = 
let(lvx=ptx*pol_x+ppx,lvy=pty*pol_y+ppy) 
gp2d(edges,nvx,lvx,lvy)+ghf(lvx,lvy);

// element for constructing wmodule (basic polyhedron)
module element(ptx,pty,ppx,ppy) {
    hbl = edge_h(ptx,pty,ppx,ppy);
    hbr = edge_h(ptx,pty,ppx+1,ppy);
    htr = edge_h(ptx,pty,ppx+1,ppy+1);
    htl = edge_h(ptx,pty,ppx,ppy+1);
    avh = (hbl+hbr+htr+htl)/4;
    s = 0.001;
    
    polyhedron(points= [
    [0+s,0+s,0],
    [pol_w-s,0+s,0],
    [pol_w-s,pol_h-s,0],
    [0+s,pol_h-s,0],
    
    [0+s,0+s,edge_h(ptx,pty,ppx,ppy)],
    [pol_w-s,0+s,edge_h(ptx,pty,ppx+1,ppy)],
    [pol_w-s,pol_h-s,edge_h(ptx,pty,ppx+1,ppy+1)],
    [0+s,pol_h-s,edge_h(ptx,pty,ppx,ppy+1)],
    
    [pol_w/2,pol_h/2,avh]
    ],
    faces= [
    [0,1,2,3],
    [0,4,5,1],
    [1,5,6,2],
    [2,6,7,3],
    [3,7,4,0],
    [4,8,5],
    [5,8,6],
    [6,8,7],
    [7,8,4]
    ]    
    );
}


module holder() {
cylinder(dscrew,rscrew,rscrew);
translate([0,0,dscrew-dhead])cylinder(dhead,rhead,rhead);


}


// wall module at certain position
module wmodule(ptx,pty) {
    difference() {
    for(px=[0:pol_x-1]){
        for(py=[0:pol_y-1]){
            translate([
            px*pol_w,
            py*pol_h,
            0]) element(ptx,pty,px,py);
        }
    }

    translate([smarx,tile_h-smary,0]) holder();
    translate([tile_w-smarx,tile_h-smary,0]) holder();
    
}
}

// the whole model consisting of several wmodules
for(tx=[0:tiles_x-1]) {
        for(ty=[0:tiles_y-1]) {
            translate([
            tx*(tile_w+mar),
            ty*(tile_h+mar),
            0]) color("lightgreen") wmodule(tx,ty);

            
        }
    
}