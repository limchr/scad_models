$fn = 50;
s = 1.2;

l = 100;
w1 = 4.5;
w2 = 4;

difference(){
cylinder(l,w1,w2);
cylinder(l,w1-s,w2-s);

}