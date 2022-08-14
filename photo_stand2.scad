$fn = 200;

//length of photo
l = 150;
//depth
d = 25;
//height
h = 6;
//border radius
br = 5;

//cut depth
cd = h-3;
//cut radius
cr = 80;
//cut width
cw = 0.75;
//cut width lower
cwl = 0.6;

//strength
s = 1.5;

//photo shift angle
ps = 0.00;


// cut radius inner
cri = cr-4*s-cw;

photo_u = 2*PI* (cri+2*s+cw/2);
ratio_u = l/photo_u;
phi = 360*ratio_u/2;

//phi = asin((l/2)/(cr));
echo(phi);
cot = cr*sin(phi);
coa = cr*cos(phi);
coti = cri*sin(phi);
coai = cri*cos(phi);

echo(cot);
echo(coa);
co = cr-coa; // + 4*s + cw;
coi = cr-coai;

rd = phi > 45 ? coi : coi+d;
intersection(){
linear_extrude(h)polygon([[-rd,-2*s],[-rd,2*s],[-coi,coti],[-co,l/2-0],[0,l/2],[0,-l/2],[-co,-l/2],[-coi,-coti]]);
translate([-cr,0,0]) rotate_extrude() polygon([[cri,s],[cri+s,2*s],[cri+s,h],[cri+2*s,h],[cri+2*s+(cw-cwl)+ps,s],[cri+2*s+cw+ps,s],[cri+2*s+cw,h],[cri+3*s+cw,h],[cri+3*s+cw,2*s],[cr,s],[cr,0],[0,0],[0,s],]);
}


translate([9*s,0,0]) intersection(){
linear_extrude(h)polygon([[-rd,-2*s],[-rd,2*s],[-coi,coti],[-co,l/2-0],[0,l/2],[0,-l/2],[-co,-l/2],[-coi,-coti]]);
translate([-cr,0,0]) rotate_extrude() polygon([[cri+s,0],[cri+s,h],[cri+2*s,h],[cri+2*s+(cw-cwl)+ps,s],[cri+2*s+cw+ps,s],[cri+2*s+cw,h],[cri+3*s+cw,h],[cri+3*s+cw,0]]);
}




