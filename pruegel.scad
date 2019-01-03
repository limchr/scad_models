$fn = 50;

l = 250;
l2 = 90;
r1 = 17;
r2 = 12;
f = 3;
s = 2;

difference() {
rotate_extrude() polygon([[0,0],[r1-f,0],[r1,f],[r2,l-l2],[r2,l],[0,l]]);
rotate_extrude() polygon([[0,s],[r1-f,s],[r1-s,f],[r2-s,l-l2],[r2-s,l],[0,l]]);
}