module line(p1,p2,w) {
    hull() {
        translate(p1) circle(r=w);
        translate(p2) circle(r=w);
    }
}
module polyline(points, index, w) {
    if(index < len(points)) {
        line(points[index - 1], points[index],w);
        polyline(points, index + 1, w);
    }
}

function choose(n, k)=
     k == 0? 1
    : (n * choose(n - 1, k - 1)) / k;

function _point_on_bezier_rec(points,t,i,c)=
    len(points) == i ? c
    : _point_on_bezier_rec(points,t,i+1,c+choose(len(points)-1,i) * pow(t,i) * pow(1-t,len(points)-i-1) * points[i]);

function _point_on_bezier(points,t)=
    _point_on_bezier_rec(points,t,0,[0,0]);

//a bezier curve with any number of control points
//parameters: 
//points - the control points of the bezier curve (number of points is variable)
//resolution - the sampling resolution of the bezier curve (number of returned points)
//returns:
//resolution number of samples on the bezier curve
function bezier(points,fn)=[
    for (t =[0:1.0/fn:1+(1/fn/2)]) _point_on_bezier(points, t)
    ];

//create a 3D rotational model with a bezier curve of given points, resolution and thickness
module bezier_model(points,resolution,thickness) {
    translate([0,0,thickness/2]) rotate_extrude() polyline(bezier(points,resolution),1,thickness/2);
}
    
