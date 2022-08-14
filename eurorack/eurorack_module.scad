// see https://doepfer.de/a100_man/a100m_e.htm


$fn = 20;

//printing error
e = 0.30;

//horizontal pitch
hp = 5.08;
//effective module height
mh = 128.5;

//screw hole radius
shr = 1.6;

//screw margin from top/bottom borders
smv = 3;

//horizontal screw margin
smh = 7.5;

//module strength (depth)
s = 2.0;







module line(point1, point2, width = 1, cap_round = true) {
    angle = 90 - atan((point2[1] - point1[1]) / (point2[0] - point1[0]));
    offset_x = 0.5 * width * cos(angle);
    offset_y = 0.5 * width * sin(angle);

    offset1 = [-offset_x, offset_y];
    offset2 = [offset_x, -offset_y];

    if(cap_round) {
        translate(point1) circle(d = width, $fn = 24);
        translate(point2) circle(d = width, $fn = 24);
    }

    polygon(points=[
        point1 + offset1, point2 + offset1,  
        point2 + offset2, point1 + offset2
    ]);
}

module polyline(points, width = 1) {
    module polyline_inner(points, index) {
        if(index < len(points)) {
            line(points[index - 1], points[index], width);
            polyline_inner(points, index + 1);
        }
    }

    polyline_inner(points, 1);
}










multiplexer_vectors = [[4.958333333333333,3],[5.125,3.125],[5.25,3.25],[5.375,3.375],[5.5,3.5],[5.625,3.625],[5.75,3.75],[5.875,3.875],[6,4.041666666666667],[6.125,4.25],[6.25,4.5],[6.375,4.75],[6.5,5],[6.625,5.25],[6.75,5.5],[6.875,5.75],[6.958333333333333,6.083333333333333],[7,6.5],[7,7],[7,7.5],[7,8],[7,8.5],[7,9],[7,9.5],[6.875,9.833333333333334],[6.625,10],[6.25,10],[5.875,10],[5.5,10],[5.125,10],[4.75,10],[4.375,10],[4.125,9.833333333333334],[4,9.5],[4,9],[4,8.5],[4,8],[4,7.5],[4,7],[4,6.5],[3.8958333333333335,6.166666666666667],[3.6875,6],[3.375,6],[3.0625,6],[2.75,6],[2.4375,6],[2.125,6],[1.8125,6],[1.6041666666666667,6.166666666666667],[1.5,6.5],[1.5,7],[1.5,7.5],[1.5,8],[1.5,8.5],[1.5,9],[1.5,9.5],[1.375,9.833333333333334],[1.125,10],[0.75,10],[0.375,10],[0,10],[-0.375,10],[-0.75,10],[-1.125,10],[-1.375,9.833333333333334],[-1.5,9.5],[-1.5,9],[-1.5,8.5],[-1.5,8],[-1.5,7.5],[-1.5,7],[-1.5,6.5],[-1.6041666666666667,6.166666666666667],[-1.8125,6],[-2.125,6],[-2.4375,6],[-2.75,6],[-3.0625,6],[-3.375,6],[-3.6875,6],[-3.8958333333333335,6.166666666666667],[-4,6.5],[-4,7],[-4,7.5],[-4,8],[-4,8.5],[-4,9],[-4,9.5],[-4.125,9.833333333333334],[-4.375,10],[-4.75,10],[-5.125,10],[-5.5,10],[-5.875,10],[-6.25,10],[-6.625,10],[-6.875,9.833333333333334],[-7,9.5],[-7,9],[-7,8.5],[-7,8],[-7,7.5],[-7,7],[-7,6.5],[-6.958333333333333,6.083333333333333],[-6.875,5.75],[-6.75,5.5],[-6.625,5.25],[-6.5,5],[-6.375,4.75],[-6.25,4.5],[-6.125,4.25],[-6,4.041666666666667],[-5.875,3.875],[-5.75,3.75],[-5.625,3.625],[-5.5,3.5],[-5.375,3.375],[-5.25,3.25],[-5.125,3.125],[-4.958333333333333,3],[-4.75,2.875],[-4.5,2.75],[-4.25,2.625],[-4,2.5],[-3.75,2.375],[-3.5,2.25],[-3.25,2.125],[-3.0208333333333335,1.9583333333333333],[-2.8125,1.75],[-2.625,1.5],[-2.4375,1.25],[-2.25,1],[-2.0625,0.75],[-1.875,0.5],[-1.6875,0.25],[-1.5625,-0.125],[-1.5,-0.625],[-1.5,-1.25],[-1.5,-1.875],[-1.5,-2.5],[-1.5,-3.125],[-1.5,-3.75],[-1.5,-4.375],[-1.4375,-4.791666666666667],[-1.3125,-5],[-1.125,-5],[-0.9375,-5],[-0.75,-5],[-0.5625,-5],[-0.375,-5],[-0.1875,-5],[0,-5],[0.1875,-5],[0.375,-5],[0.5625,-5],[0.75,-5],[0.9375,-5],[1.125,-5],[1.3125,-5],[1.4375,-4.791666666666667],[1.5,-4.375],[1.5,-3.75],[1.5,-3.125],[1.5,-2.5],[1.5,-1.875],[1.5,-1.25],[1.5,-0.625],[1.5625,-0.125],[1.6875,0.25],[1.875,0.5],[2.0625,0.75],[2.25,1],[2.4375,1.25],[2.625,1.5],[2.8125,1.75],[3.0208333333333335,1.9583333333333333],[3.25,2.125],[3.5,2.25],[3.75,2.375],[4,2.5],[4.25,2.625],[4.5,2.75],[4.75,2.875],];


usb_symbol_vectors = [[-0.46783041152048666,4.1406807409150534],[-0.995700850969615,4.14951752837821],[-1.5248284588762395,4.129056081285507],[-1.7012043281784477,4.241594040295379],[-1.8775801974806559,4.354131999305251],[-1.960580606564048,4.548515746685939],[-2.0435810156474403,4.742899494066627],[-2.0435810156474403,4.937283241447315],[-2.0435810156474403,5.1316669888280035],[-1.856830095209808,5.428357971672212],[-1.670079174772176,5.725048954516421],[-1.1202014645947032,6.5844297324099905],[-0.5703237544172305,7.4438105103035594],[-0.3835728339795983,7.546117745767079],[-0.19682191354196613,7.648424981230598],[-0.06194624878145423,7.668886428323303],[0.07292941597905767,7.689347875416007],[0.2700553875521141,7.607502087045191],[0.46718135912517056,7.525656298674375],[0.695432484104499,7.218734592283814],[0.9236836090838274,6.911812885893254],[1.4320611147196036,6.072893555092389],[1.9404386203553798,5.233974224291524],[1.9819388248970757,5.0191290298181315],[2.0234390294387716,4.80428383534474],[1.9404386203553798,4.630361535056755],[1.8574382112719878,4.456439234768771],[1.6395621374280833,4.313209105119842],[1.421686063584179,4.169978975470914],[1.1830598874694271,4.139286804831858],[0.9444337113546754,4.108594634192802],[0.7161825863753469,4.129056081285507],[0.46841420294017666,4.081751773288065],[0.4775564102605946,1.1007619115653107],[0.46718135912517056,-1.9479937052475893],[1.4631862681258756,-1.2625352276420045],[2.4591911771265806,-0.5770767500364199],[2.6148169441579405,-0.4747695145728995],[2.7704427111893004,-0.37246227910937907],[2.7704427111893004,0.08792028047646147],[2.7704427111893004,0.548302840062302],[2.5836917907516685,0.5585335636086544],[2.3969408703140367,0.5687642871550066],[2.230940052147252,0.6199179048867662],[2.0649392339804677,0.6710715226185258],[1.9093134669491079,0.8449938229065103],[1.753687699917748,1.0189161231944948],[1.7121874953760519,1.2132998705751827],[1.670687290834356,1.4076836179558707],[1.660312239698932,2.134064989746864],[1.6499371885635081,2.860446361537857],[1.722562546511476,3.065060832464897],[1.7951879044594439,3.2696753033919372],[1.981938824897076,3.3924439859481614],[2.168689745334708,3.515212668504386],[2.5318165350745487,3.545904839143442],[2.8949433248143897,3.576597009782498],[3.518812880393625,3.5826437010089442],[4.1606995633361175,3.556135562689794],[4.337075432638326,3.494751221411682],[4.513451301940535,3.4333668801335695],[4.669077068971895,3.2389831327528813],[4.8247028360032544,3.044599385372193],[4.855827989409526,2.7581391260743366],[4.886953142815799,2.47167886677648],[4.886953142815799,1.9192197952734715],[4.886953142815799,1.3667607237704626],[4.835077887138679,1.1723769763897747],[4.783202631461559,0.9779932290090869],[4.627576864430199,0.8449938229065108],[4.471951097398839,0.7119944168039348],[4.285200176961206,0.6403793519794707],[4.0984492565235735,0.5687642871550066],[3.9116983360859416,0.5687642871550066],[3.7249474156483102,0.5687642871550066],[3.7353224667837344,0.1595353453009256],[3.745697517919158,-0.24969359655315534],[3.7041973133774624,-0.40315444974843534],[3.6626971088357663,-0.5566153029437153],[3.590071750887798,-0.7203068796853476],[3.51744639293983,-0.8839984564269798],[3.3618206259084698,-1.03745930962226],[3.2061948588771094,-1.1909201628175399],[1.847063160136564,-2.1423774526282777],[0.48793146139601856,-3.093834742439016],[0.4775564102605946,-3.5235251313857994],[0.46718135912517056,-3.953215520332583],[0.716182586375347,-4.075984202888808],[0.9651838136255234,-4.198752885445033],[1.2349351431465472,-4.464751697650184],[1.4444990137608658,-4.757593370760076],[1.6499371885635075,-5.16044089880212],[1.7951879044594439,-5.590131287748904],[1.78481285332402,-5.886822270593113],[1.774437802188596,-6.183513253437322],[1.660312239698932,-6.449512065642475],[1.546186677209268,-6.715510877847627],[1.3594357567716355,-6.950817519413723],[1.1726848363340032,-7.186124160979819],[0.8468960683604427,-7.4093969139745175],[0.4049310523126266,-7.5748916557411965],[-0.1889490370002909,-7.58618381685548],[-0.7267916878606713,-7.4879688708105006],[-1.20487404418101,-7.193324032675564],[-1.6231961059613058,-6.662963324032676],[-1.822397087761447,-6.112959626180791],[-1.815329890668112,-5.528746946470793],[-1.663036302321334,-4.993309241268025],[-1.4638353205211927,-4.580806467879113],[-1.1409515668655512,-4.362444462186663],[-0.8815752884799508,-4.137368544166919],[-0.7051994191777426,-4.0657534793424555],[-0.5288235498755345,-3.9941384145179923],[-2.0747061690537123,-2.8073744831411584],[-3.6205887882318897,-1.6206105517643248],[-3.755464452992402,-1.3955346337445806],[-3.8903401177529147,-1.1704587157248365],[-3.9214652711591866,-0.8839984564269798],[-3.9525904245654586,-0.5975381971291233],[-3.9629654757008828,-0.40315444974843534],[-3.9733405268363065,-0.20877070236774742],[-4.357217418846995,0.07768955693010918],[-4.741094310857683,0.3641498162279658],[-4.886345026753619,0.8245323758138063],[-5.0315957426495554,1.284914935399647],[-4.949852502023661,1.822808014253539],[-4.75065152022352,2.294239755269439],[-4.409092674524115,2.4716788667764806],[-4.192888771183124,2.687099539449357],[-3.774566709402828,2.785314485494337],[-3.30933725416917,2.819523467352449],[-2.894335208752209,2.6251397199717603],[-2.4793331633352484,2.430755972591072],[-2.2407069872204963,2.021527030736992],[-2.101278462281644,1.7049500789995635],[-2.033205964512016,1.2132998705751827],[-2.064331117918288,0.8143016522674541],[-2.2407069872204963,0.5073799458768942],[-2.4170828565227045,0.20045823948633412],[-2.6245838792311846,0.02653593919834958],[-2.832084901939665,-0.14738636108963496],[-2.925460362158481,-0.1780785317286912],[-3.0188358223772975,-0.20877070236774742],[-3.0188358223772975,-0.5463845793973636],[-3.0188358223772975,-0.8839984564269798],[-1.742704532720144,-1.8456864697840694],[-0.46657324306299053,-2.807374483141159],[-0.4561981919275665,-1.3955346337445804],[-0.4458231407921425,0.0163052156519979],[-0.4561981919275665,2.093142095561456]];




module euro_rack_module(num_hp) {
    difference(){
        translate([e,e,0])cube([num_hp*hp-2*e,mh-2*e,s]);
    
        translate([smh,smv,0]) cylinder(s+e,shr+e,shr+e);
        translate([smh,mh-smv,0]) cylinder(s+e,shr+e,shr+e);
        if(num_hp>=10) {
        
            translate([smh+(num_hp-3)*hp,smv,0]) cylinder(s+e,shr+e,shr+e);
            translate([smh+(num_hp-3)*hp,mh-smv,0]) cylinder(s+e,shr+e,shr+e);
        }
    }
 
}

use</home/chris/src/scad_models/resources/fonts/Bungee/Bungee-Regular.ttf>
module engrave_label(label,size) {
    translate([0,0,0.5*s]) linear_extrude(s)text(label, size = size, font="Bungee-Regular", halign="center", valign="center");    
}

module engrave_arrow() {
    translate([0,0,0.5*s]) linear_extrude(s)polygon([[-3,-13],[-3,3],[-7,3],[0,13],[7,3],[3,3],[3,-13]]);
}


module saw_osci_module() {

poti_r = 3.5;
jack_r = 3;

nhp = 6;

difference(){
    color("blue") euro_rack_module(nhp);
    
    //poti
    translate([nhp/2*hp,mh-5*hp,0]) cylinder(2,poti_r+e,poti_r+e);

    //cv jack
    translate([1.5*hp,3*hp,0]) cylinder(2,jack_r+e,jack_r+e);
    
    //out jack
    translate([(nhp-1.5)*hp,3*hp,0]) cylinder(2,jack_r+e,jack_r+e);
  
}

//module name label
translate([nhp/2*hp,mh/2,0]) rotate([0,0,90]) engrave_label("SAW",15);

//poti label
translate([nhp/2*hp,mh-15,0]) engrave_label("TUNE",7.5);
//cv jack label
translate([1.5*hp,25,0]) engrave_label("CV/", 5);
//out jack label
translate([(nhp-1.5)*hp,25,0]) engrave_label("OUT", 5);

//translate([15*hp,0,0]) euro_rack_module(15);

}






module mixer_module() {

poti_r = 3.5;
jack_r = 3;

nhp = 14;

pot_dist = 73.0/3;

//dist left
dl = 20;

difference(){
    color("blue") euro_rack_module(nhp);
    
    //poti
    translate([dl,25,0]) cylinder(2+e,poti_r+e,poti_r+e);
    //poti
    translate([dl,25+pot_dist*1,0]) cylinder(2+e,poti_r+e,poti_r+e);
    //poti
    translate([dl,25+pot_dist*2,0]) cylinder(2+e,poti_r+e,poti_r+e);
    //poti
    translate([dl,25+pot_dist*3,0]) cylinder(2+e,poti_r+e,poti_r+e);

    //jack
    translate([dl+10,25+pot_dist*0.5,0]) cylinder(2+e,jack_r+e,jack_r+e);
    //jack
    translate([dl+10,25+pot_dist*1.5,0]) cylinder(2+e,jack_r+e,jack_r+e);
    //jack
    translate([dl+10,25+pot_dist*2.5,0]) cylinder(2+e,jack_r+e,jack_r+e);
    //jack
    translate([dl+10,25+pot_dist*3.5,0]) cylinder(2+e,jack_r+e,jack_r+e);

//master poti
translate([nhp*hp-4*hp,mh*0.75,0]) cylinder(2+e,poti_r+e,poti_r+e);

//out jack
translate([nhp*hp-4*hp,mh*0.50,0]) cylinder(2+e,jack_r+e,jack_r+e);

//inv jack
translate([nhp*hp-4*hp,mh*0.30,0]) cylinder(2+e,jack_r+e,jack_r+e);


}




//module name label
translate([nhp/2*hp,10,0]) engrave_label("MIX",15);

//poti label
translate([23,mh-8,0]) engrave_label("INS",8);
//out jack label
translate([nhp*hp-4*hp,mh*0.83,0]) engrave_label("GAIN", 8);
//out jack label
translate([nhp*hp-4*hp,mh*0.58,0]) engrave_label("OUT", 8);
//out jack label
translate([nhp*hp-4*hp,mh*0.38,0]) engrave_label("INV", 8);

//translate([15*hp,0,0]) euro_rack_module(15);

}

module instr_module() {
    
poti_r = 3.5;
jack_r = 3;
jack_r2 = 4.5;

nhp = 10;

pot_dist = 33;

//dist left
dl = 20;

difference(){
    color("blue") euro_rack_module(nhp);
    
    //poti
    translate([dl,mh/2+pot_dist/2,0]) cylinder(2+e,poti_r+e,poti_r+e);
    //poti
    translate([dl,mh/2-pot_dist/2,0]) cylinder(2+e,poti_r+e,poti_r+e);
    
    //jack
    translate([dl+18,mh/2+pot_dist/2,0]) cylinder(2+e,jack_r2+e,jack_r2+e);
    //jack
    translate([dl+18,mh/2-pot_dist/2,0]) cylinder(2+e,jack_r2+e,jack_r2+e);

    //jack
    translate([dl+18,mh/2+pot_dist/2+25,0]) cylinder(2+e,jack_r+e,jack_r+e);
    //jack
    translate([dl+18,mh/2-pot_dist/2-25,0]) cylinder(2+e,jack_r+e,jack_r+e);


}



//module name label
translate([nhp/2*hp,mh/2,0]) engrave_label("INSTR",10);

translate([5,mh/2+pot_dist/2+25,0]) rotate([0,0,90]) engrave_label("OUT",8);

translate([5,mh/2+pot_dist/2,0]) rotate([0,0,90]) engrave_label("IN",8);

translate([5,mh/2-pot_dist/2-25,0]) rotate([0,0,90]) engrave_label("IN",8);

translate([5,mh/2-pot_dist/2,0]) rotate([0,0,90]) engrave_label("OUT",8);

translate([dl+9,mh/2-pot_dist/4-21,0]) engrave_arrow();

translate([dl+9,mh/2+pot_dist/4+21,0]) engrave_arrow();

}



module reverb_module() {

poti_r = 3.5;
jack_r = 3;
jack_r2 = 4.5;

nhp = 6;

pot_dist = 43;

//dist left
dl = 20;

difference(){
    color("blue") euro_rack_module(nhp);

    //potis
    translate([dl,mh/2,0]) 
        cylinder(2+e,poti_r+e,poti_r+e);
    translate([dl,mh/2+pot_dist,0]) 
        cylinder(2+e,poti_r+e,poti_r+e);
    translate([dl,mh/2-pot_dist,0]) 
        cylinder(2+e,poti_r+e,poti_r+e);
    
    //jacks
    translate([dl,mh/2+pot_dist/2,0]) 
        cylinder(2+e,jack_r+e,jack_r+e);
    translate([dl,mh/2-pot_dist/2,0]) 
        cylinder(2+e,jack_r+e,jack_r+e);

}

translate([7,mh/2+pot_dist/2,0]) rotate([0,0,90]) engrave_label("OUT",7);
translate([7,mh/2-pot_dist/2,0]) rotate([0,0,90]) engrave_label("IN",7);

translate([7,mh/2+pot_dist,0]) rotate([0,0,90]) engrave_label("DW",7);
translate([7,mh/2,0]) rotate([0,0,90]) engrave_label("FB",8);
translate([7,mh/2-pot_dist,0]) rotate([0,0,90]) engrave_label("VOL",7);


}



module ms20_module() {

poti_r = 3.5;
jack_r = 3;
switch_r = 3;

nhp = 14;

pot_dist = 43;

//dist left
dl = 20;
    

difference(){
    color("blue") euro_rack_module(nhp);
    
    //in
    translate([dl,mh/2+pot_dist,0]) 
        cylinder(2+e,jack_r+e,jack_r+e);
    // lp
    translate([dl*2,mh/2+pot_dist,0]) 
        cylinder(2+e,jack_r+e,jack_r+e);
    // hp
    translate([dl*3,mh/2+pot_dist,0]) 
        cylinder(2+e,jack_r+e,jack_r+e);
    
    //cutoff frequ
    translate([dl,mh/2+pot_dist*0.33,0]) 
        cylinder(2+e,poti_r+e,poti_r+e);

    //1v oct cv
    translate([dl*3,mh/2+pot_dist*0.33,0]) 
        cylinder(2+e,jack_r+e,jack_r+e);

    //cutoff cv level
    translate([dl,mh/2-pot_dist*0.33,0]) 
        cylinder(2+e,poti_r+e,poti_r+e);

    //cutoff cv
    translate([dl*3,mh/2-pot_dist*0.33,0]) 
        cylinder(2+e,jack_r+e,jack_r+e);

    
    // resonance level
    translate([1*dl,mh/2-pot_dist,0]) 
        cylinder(2+e,poti_r+e,poti_r+e);

    // 6db 12db switch
    translate([2*dl,mh/2-pot_dist,0]) 
        cylinder(2+e,switch_r+e,switch_r+e);

    // output
    translate([3*dl,mh/2-pot_dist,0]) 
        cylinder(2+e,jack_r+e,jack_r+e);



}

//label margin
lm = 7;
//label size
ls = 7;

    //in
    translate([dl-lm,mh/2+pot_dist+lm,0]) rotate([0,0,45]) engrave_label("IN",ls);
    // lp
    translate([dl*2-lm,mh/2+pot_dist+lm,0]) rotate([0,0,45]) engrave_label("LP",ls);
    // hp
    translate([dl*3-lm,mh/2+pot_dist+lm,0]) rotate([0,0,45]) engrave_label("HP",ls);

    //cutoff frequ
    translate([dl-lm,mh/2+pot_dist*0.33+lm,0]) rotate([0,0,45]) engrave_label("CO",ls);
    //1v oct cv
    translate([dl*3-lm,mh/2+pot_dist*0.33+lm,0]) rotate([0,0,45]) engrave_label("1V/O",ls);


    //cutoff cv level
    translate([dl-lm,mh/2-pot_dist*0.33+lm,0]) rotate([0,0,45]) engrave_label("CV",ls);
    //cutoff cv
    translate([dl*3-lm,mh/2-pot_dist*0.33+lm,0]) rotate([0,0,45]) engrave_label("CV",ls);

    // resonance level
    translate([1*dl-lm,mh/2-pot_dist+lm,0]) rotate([0,0,45]) engrave_label("RESO",ls);
    // 6db 12db switch
    translate([2*dl-lm,mh/2-pot_dist+lm,0]) rotate([0,0,45]) engrave_label("DB",ls);
    // output
    translate([3*dl-lm,mh/2-pot_dist+lm,0]) rotate([0,0,45]) engrave_label("OUT",ls);

    //name
    translate([nhp*hp/2,mh/2+5,0]) rotate([0,0,90]) engrave_label("MS20",14);

}




module mixer_log_module() {

poti_r = 3.5;
jack_r = 3;

nhp = 12;

pot_dist = 73.0/3;

//dist left
dl = 20;

difference(){
    color("blue") euro_rack_module(nhp);
    
    //poti
    translate([dl,25,0]) cylinder(2+e,poti_r+e,poti_r+e);
    //poti
    translate([dl,25+pot_dist*1,0]) cylinder(2+e,poti_r+e,poti_r+e);
    //poti
    translate([dl,25+pot_dist*2,0]) cylinder(2+e,poti_r+e,poti_r+e);
    //poti
    translate([dl,25+pot_dist*3,0]) cylinder(2+e,poti_r+e,poti_r+e);

    //jack
    translate([dl+10,25+pot_dist*0.5,0]) cylinder(2+e,jack_r+e,jack_r+e);
    //jack
    translate([dl+10,25+pot_dist*1.5,0]) cylinder(2+e,jack_r+e,jack_r+e);
    //jack
    translate([dl+10,25+pot_dist*2.5,0]) cylinder(2+e,jack_r+e,jack_r+e);
    //jack
    translate([dl+10,25+pot_dist*3.5,0]) cylinder(2+e,jack_r+e,jack_r+e);

//master poti
translate([nhp*hp-3*hp,mh*0.75,0]) cylinder(2+e,poti_r+e,poti_r+e);

//out jack
translate([nhp*hp-3*hp,mh*0.50,0]) cylinder(2+e,jack_r+e,jack_r+e);

//inv jack
translate([nhp*hp-3*hp,mh*0.30,0]) cylinder(2+e,jack_r+e,jack_r+e);


}




//module name label
translate([nhp/2*hp+6,21,0]) engrave_label("LOG",8);

translate([nhp/2*hp,10,0]) engrave_label("MIX",12);

//poti label
translate([24.5,mh-8,0]) engrave_label("INS",8);
//out jack label
translate([nhp*hp-3*hp,mh*0.82,0]) engrave_label("GAIN", 6);
//out jack label
translate([nhp*hp-3*hp,mh*0.57,0]) engrave_label("OUT", 6);
//out jack label
translate([nhp*hp-3*hp,mh*0.37,0]) engrave_label("INV", 6);

//translate([15*hp,0,0]) euro_rack_module(15);

}




module multiplexer_module() {
    jack_r = 3.5;

    nhp = 3;

    dist = 15;

    n = 6;
        
    m = (mh-(n-1)*dist)/2;

    difference(){
        color("blue") euro_rack_module(nhp);

        for(i = [0:1:n-1]) {
            translate([nhp*hp/2, m+i*dist,0]) cylinder(2,jack_r,jack_r);
        }
        
        }
        
        
        translate([nhp*hp/2,12,2])linear_extrude(1)scale(1)polygon(multiplexer_vectors);
        translate([nhp*hp/2,mh-12,2])linear_extrude(1)scale(1)rotate([0,0,180])polygon(multiplexer_vectors);

}




module power_line_holder() {
    w = 8;
    l = 21.5;
    s = 4;
    difference(){
    translate([s,0,0])cube([l,w,s]);
    translate([s+2.54*2.5,w/2,0]) cylinder(s,2,2);
        translate([s+2.54,0,s/2]) cube([2.54*3,w,s]);
        }
        cube([s,w,s*2]);
    translate([l+s,0,0])cube([s,w,s*2]);
}

module eu_dist() {
    l = mh;
    w = 20;
    s = 5;
    difference() {
        cube([l,w,s]);
        translate([l*0.8,w/2,0]) cylinder(s,2,2);
        translate([l*0.2,w/2,0]) cylinder(s,2,2);
    }
}


module speaker_module() {
    r = 50/2;
    jack_r = 3.2;
    // num holes
    nh = 10;
    nhv = 15;
    // hole radius
    hr = 2.7;
    // num horizontal pitch
    nhp = 13;

    difference(){
        color("blue") euro_rack_module(nhp);
    
                    translate([nhp*hp*0.8,mh/2,0])linear_extrude(2)scale(2.5)polygon([[-0.5,-1],[-0.5,1],[1,1],[2,2],[2,-2],[1,-1]]);

        
            translate([nhp*hp/5,mh/2,0]) cylinder(2,jack_r+e,jack_r+e);

        
        
        intersection() {
        union() {
    translate([nhp*hp/2,mh/2-r-3,0]) cylinder(2,r,r);
    translate([nhp*hp/2,mh/2+r+3,0]) cylinder(2,r,r);
        }


        for(i = [0:1:nh]) {
            for (j = [0:1:nhv]) {
            translate([nhp*hp/nh*i,mh/nhv*j+0.3*mh/nhv,0]) cylinder(2,hr,hr,$fn=5);
            }
        }
    }
        
        }
        
        
        translate([e,8,2]) {
            difference() {
            cube([nhp*hp-2*e,mh-2*8,2]);
            translate([nhp*hp/2-e,mh/2-r-3-8,0]) cylinder(2,r,r);
            translate([nhp*hp/2-e,mh/2+r+3-8,0]) cylinder(2,r,r);

            translate([nhp*hp/5-e,mh/2-8,0]) cylinder(2,jack_r+e,jack_r+e);
   
                
                
                }
            }
        

    }

module usb_module() {
    // num horizontal pitch
    nhp = 4;

    h = 7.5;
    w = 15;

    
    difference() { 
    
        
    color("blue") 
        union() {
        
        euro_rack_module(nhp);
    
        translate([e,e+8,2]) cube([nhp*hp-2*e,mh-2*e-16,2]);
        }
        
        translate([nhp*hp/2,mh/2,0])cube([h,w,8],center=true);
        translate([nhp*hp/2,mh/4,0])cube([h,w,8],center=true);
        
        
        translate([nhp*hp/2,mh*0.75,0])linear_extrude(2) scale(1.56)polygon(usb_symbol_vectors);
        
    }
}

phones = [[-0.8914324235124365,6.918813563213112],[-1.308364711001103,6.804744661890141],[-1.6094824741873635,6.736303321096359],[-2.0495776665365115,6.599420639508795],[-2.273265909875578,6.453943183064602],[-2.7612077087294584,6.280535408831198],[-3.2189675406439235,6.052628048410152],[-3.591211799563379,5.804902656648146],[-3.9131527802504755,5.542313741380418],[-4.270306055700224,5.284679333947931],[-4.6173986755035,4.982454355998283],[-4.9192183448976525,4.630684299696233],[-5.185825719529155,4.219460149371302],[-5.462493749807128,3.7983269833758913],[-5.70394948532245,3.37719381738048],[-5.900132270428649,2.9659696670555484],[-6.040981449479254,2.505200438378216],[-6.1717699728833875,1.9849771156780018],[-6.257285545878397,1.4449357616368275],[-6.307588824110756,0.944530470277574],[-6.317649479757228,0.47385222592976106],[-6.322679807580464,-0.006735034088532044],[-6.423286364045182,-0.34364156688486114],[-6.624499476974617,-0.5269583567887459],[-6.896137179429355,-0.5864124508116274],[-7.137592914944678,-0.6755935918459497],[-7.358927339167057,-0.8093653033974332],[-7.590322419035907,-0.9580005384546371],[-7.816687171081522,-1.1710443753699629],[-8.02796093965743,-1.4336332906376903],[-8.193961757824214,-1.7655853155987795],[-8.329780609051582,-2.117355371900829],[-8.400205198576884,-2.4790344438733594],[-8.435417493339536,-2.8308045001754087],[-8.445478148986007,-3.167711032971738],[-8.46559946027895,-3.4996630579328265],[-8.480690443748657,-3.8068425437177145],[-8.480690443748657,-4.0942039981616425],[-8.460569132455715,-4.361747421264609],[-8.435417493339536,-4.629290844367576],[-8.38008388728394,-4.936470330152464],[-8.299598642112166,-5.2832858786192745],[-8.14868880741509,-5.644964950591803],[-7.95250602230889,-5.981871483388133],[-7.690928975500625,-6.23950589082062],[-7.409230617399415,-6.442640712065466],[-7.127532259298206,-6.56650340794647],[-6.86595521248994,-6.665593564651273],[-6.629529804797852,-6.710184135168433],[-6.398134724929003,-6.725047658674153],[-6.1516486615904435,-6.685411595992233],[-5.885041286958942,-6.621002994134111],[-5.633524895797148,-6.497140298253108],[-5.417220799398005,-6.338596047525424],[-5.251219981231221,-6.1354612262805786],[-5.100310146534144,-5.922417389365252],[-4.994673262246191,-5.773782154308048],[-4.9192183448976525,-5.699464536779446],[-4.889036377958237,-5.699464536779446],[-4.87394539448853,-5.699464536779446],[-4.818611788432935,-5.550829301722241],[-4.707944576321745,-5.253558831607833],[-4.5872167085640845,-4.678835922719978],[-4.511761791215546,-3.9752958101158793],[-4.491640479922602,-3.0190757979145335],[-4.48157982427613,-1.9389930898321845],[-4.496670807745837,-0.8688193974203154],[-4.435356867166107,0.09749326409947508],[-4.412193962305626,0.9644169141540503],[-4.226890723421774,1.7400854431502497],[-3.9720987699564776,2.4244988510880736],[-3.5761208160936717,2.9956967140669892],[-3.098239672886263,3.4812384819205224],[-2.62538885750209,3.9320986949273746],[-2.1525380421179166,4.264050719888464],[-1.6746568989105077,4.51177611165047],[-1.4241792353035116,4.6602493170182955],[-1.0535727575358067,4.79713199860586],[-0.7292920894890662,4.888387119664237],[-0.4513372311632872,4.956828460458019],[0,5],[0.030624233166456565,5.834629703659585],[0,7],[-0.5208259457447316,6.964441123742301],];

module phones_module() {
    jack_r = 3.5;

    poti_r = 4;

    nhp = 3;

    dist = 15;

    m = 30;

    difference(){
        color("blue") euro_rack_module(nhp);

    translate([nhp*hp/2, m,0]) cylinder(2,jack_r,jack_r);
    translate([nhp*hp/2, m+dist,0]) cylinder(2,jack_r,jack_r);
        
    translate([nhp*hp/2, m+dist*5,0]) cylinder(2,poti_r,poti_r);

        
        }
        tm = 15;
        ts = 6;
translate([nhp*hp/2,m-tm+4,0]) rotate([0,0,180])engrave_label("IN", ts);

        translate([nhp*hp/2,m+dist+tm-2,s]) scale([0.85,0.85,1])rotate([0,0,180]){
linear_extrude(s/2) polygon(phones);
mirror([1,0,0])linear_extrude(s/2) polygon(phones);
        }
translate([nhp*hp/2,m+dist*5-tm-3,0]) rotate([0,0,90])engrave_label("VOL", ts);

        
}

module mk_vco() {
    
    jack_r = 6.5/2 + e;
    poti_r = 7.5/2 + e;
    
    nhp = 10;
    dist = 15;

    // offset x
    ox = 0;
    // offset y
    oy = 10;


    // coordinates for user control elements
    elems = [[ 0.16,  0.0  ],
     [16.65,  0.0  ],
     [33.21,  0.0  ],
     [ 2.04, 65.98],
     [31.24, 65.98],
     [16.63, 15.58],
     [ 0.0,   31.14],
     [33.13, 31.12],
     [ 0.09, 47.63],
     [33.08, 47.72]];
    // elemeints span in x direction
    el_sx = 33.21;
    // elements span in y direction
    el_sy = 65.97999999999999;
    // elements radi
    el_r = [jack_r,jack_r,jack_r,jack_r,jack_r,poti_r,poti_r,poti_r,poti_r,poti_r];
    // labels
    el_l = ["CV","FM","PWM","SAW","PULSE","COARSE","FINE","FM L","PU CV","PWM L"];
    el_ts = [6,6,5.5,4.5,4.5,5,5,5,4,4];


    //margin x
    mx = (nhp*hp - el_sx)/2 + ox;
    my = (mh - el_sy)/2 + oy;



    difference(){
        color("blue") euro_rack_module(nhp);
        
        for(i = [0:1:len(elems)-1]) {
            translate([mx+elems[i][0],my+elems[i][1],0]) cylinder(2,el_r[i],el_r[i]);
        }

    }

    translate([nhp*hp/2, 15, 0]) rotate([0,0,180]) engrave_label("OSC",16);

    for(i = [0:1:len(elems)-1]) {
        translate([mx+elems[i][0],my+elems[i][1]-8,0]) rotate([0,0,180])engrave_label(el_l[i], el_ts[i]);

        
        
        
    }

}


module fancy_lfo() {
    
    jack_r = 6.5/2 + e;
    switch_r = 6.5/2 + e;
    pot_r = 7.5/2 + e;
    
    nhp = 10;
    dist = 15;

    // offset x
    ox = -2;
    // offset y
    oy = 3;

    
// coordinates for user control elements
elems = [[32.14,  0.  ],
 [17.0,    1],
 [ 3.06,  1],
 [20.0, 13.44],
 [25.6,  29.14],
 [25.6,  46.47],
 [25.6,  64.94],
 [25.6,  82.71],
 [15.02, 82.41],
 [15.02, 64.6 ],
 [15.02, 46.21],
 [15.02, 27.79],
 [ 7.6,  13.46],
 [ 0.0,   13.46],];
// elements span in x direction
el_sx = 32.14;
// elements span in y direction
el_sy = 82.71;
    // elements radi
    el_r = [jack_r,pot_r,pot_r,pot_r,pot_r,pot_r,pot_r,pot_r,switch_r,switch_r,switch_r,switch_r,switch_r,switch_r];
    el_l = ["OUT","RANGE","GLIDE","HP","OSC 4","OSC 3"," OSC 2","OSC 1","OHL","OHL","OHL","OHL","HP","GLIDE"];
    el_ts = [7,5,5,6,5.5,5.5,5.5,5.5,5,5,5,5,5,5];
    
    

    //margin x
    mx = (nhp*hp - el_sx)/2 + ox;
    my = (mh - el_sy)/2 + oy;



    difference(){
        color("blue") euro_rack_module(nhp);
        
        for(i = [0:1:len(elems)-1]) {
            translate([mx+elems[i][0],my+elems[i][1],-0.005]) cylinder(2.01,el_r[i],el_r[i]);
        }
translate([mx+elems[0][0]-8,my+elems[0][1]-8,-0.005]) linear_extrude(s+0.01)polygon([[0-e,0-e],[11+e,0-e],[16+e,5-e],[16+e,16+e],[0-e,16+e]]);

    }


    translate([10, mh-19, 0])rotate([0,0,70]) engrave_label("Fancy",7);
    translate([10, mh-46, 0])rotate([0,0,70]) engrave_label("LFO",9);

    translate([41,50,2]) cube([7,70,1]);

    translate([mx+elems[0][0],my+elems[0][1]-14,0]) rotate([0,0,0])engrave_label(el_l[0], el_ts[0]);
    translate([mx+elems[1][0]-5,my+elems[1][1]-14,0]) rotate([0,0,40])engrave_label(el_l[1], el_ts[1]);
    translate([mx+elems[2][0],my+elems[2][1]-11,0]) rotate([0,0,40])engrave_label(el_l[2], el_ts[2]);
    
    translate([mx+elems[3][0]+10,my+elems[3][1]+5,0]) rotate([0,0,0])engrave_label(el_l[3], el_ts[3]);
    
    translate([mx+elems[4][0]+-5,my+elems[4][1]+8,0]) rotate([0,0,0])engrave_label(el_l[4], el_ts[4]);
    translate([mx+elems[5][0]+-5,my+elems[5][1]+8,0]) rotate([0,0,0])engrave_label(el_l[5], el_ts[5]);
    translate([mx+elems[6][0]+-5,my+elems[6][1]+8,0]) rotate([0,0,0])engrave_label(el_l[6], el_ts[6]);
    translate([mx+elems[7][0]+-5,my+elems[7][1]+8,0]) rotate([0,0,0])engrave_label(el_l[7], el_ts[7]);
    
    translate([mx+elems[12][0],my+elems[12][1]+10.5,0]) rotate([0,0,90])engrave_label(el_l[12], el_ts[12]);
    translate([mx+elems[13][0],my+elems[13][1]+17,0]) rotate([0,0,90])engrave_label(el_l[13], el_ts[13]);

    
    
    
}


module mk_tvca() {
    
    jack_r = 6.5/2 + e;
    switch_r = 6.5/2 + e;
    pot_r = 7.5/2 + e;
    
    nhp = 20;
    echo(nhp*hp);
    dist = 15;

    // offset x
    ox = 0;
    // offset y
    oy = -5;


    // coordinates for user control elements
    elems = [
    [68.58, 65.39],
     [68.58, 43.81],
     [68.58, 26.49],
     [68.58,  0.0  ],

    [34.29, 65.39],
     [34.29, 43.81],
     [34.29, 26.49],
     [34.29,  0.0  ],

    [0.0, 65.39],
     [0.0, 43.81],
     [0.0, 26.49],
     [0.0,  0.0  ],

     ];
    // elements span in x direction
    el_sx = 68.58;
    // elements span in y direction
    el_sy = 65.39;
    // elements radi
    el_r = [jack_r,jack_r,pot_r,jack_r,jack_r,jack_r,pot_r,jack_r,jack_r,jack_r,pot_r,jack_r,];

    //margin x
    mx = (nhp*hp - el_sx)/2 + ox;
    my = (mh - el_sy)/2 + oy;



    difference(){
        color("blue") euro_rack_module(nhp);
        
        for(i = [0:1:len(elems)-1]) {
            translate([mx+elems[i][0],my+elems[i][1],-0.005]) cylinder(2.01,el_r[i],el_r[i]);
        }

    }

    translate([nhp*hp/2, mh-15, 0])engrave_label("TRIPLE VCA",11.5);

    translate([2,10,2]) cube([7,mh-35,1]);
    translate([nhp*hp-9,10,2]) cube([7,mh-35,1]);

    translate([ox+nhp*hp*0.33,my+elems[0][1],0]) rotate([0,0,90])engrave_label("IN",9);
    translate([ox+nhp*hp*0.33,my+elems[1][1],0]) rotate([0,0,90])engrave_label("CV",9);
    translate([ox+nhp*hp*0.33,my+elems[2][1]+4,0]) rotate([0,0,0])engrave_label("OFF",6);
    translate([ox+nhp*hp*0.33,my+elems[2][1]-4,0]) rotate([0,0,0])engrave_label("SET",6);
    translate([ox+nhp*hp*0.33,my+elems[3][1],0]) rotate([0,0,90])engrave_label("OUT",9);
    
    translate([ox+nhp*hp*0.66,my+elems[0][1],0]) rotate([0,0,90])engrave_label("IN",9);
    translate([ox+nhp*hp*0.66,my+elems[1][1],0]) rotate([0,0,90])engrave_label("CV",9);
    translate([ox+nhp*hp*0.66,my+elems[2][1]+4,0]) rotate([0,0,0])engrave_label("OFF",6);
    translate([ox+nhp*hp*0.66,my+elems[2][1]-4,0]) rotate([0,0,0])engrave_label("SET",6);
    translate([ox+nhp*hp*0.66,my+elems[3][1],0]) rotate([0,0,90])engrave_label("OUT",9);
    
    }



module mk_vca() {
    
    jack_r = 6.5/2 + e;
    switch_r = 6.5/2 + e;
    pot_r = 7.5/2 + e;
    
    nhp = 7;
    echo(nhp*hp);
    dist = 15;

    // offset x
    ox = 0;
    // offset y
    oy = -5;


    // coordinates for user control elements
    elems = [
    [0, 65.39],
     [0, 43.81],
     [0, 26.49],
     [0,  0.0  ],
     ];
    // elements span in x direction
    el_sx = 0;
    // elements span in y direction
    el_sy = 65.39;
    // elements radi
    el_r = [jack_r,jack_r,pot_r,jack_r];

    //margin x
    mx = (nhp*hp - el_sx)/2 + ox;
    my = (mh - el_sy)/2 + oy;



    difference(){
        color("blue") euro_rack_module(nhp);
        
        for(i = [0:1:len(elems)-1]) {
            translate([mx+elems[i][0],my+elems[i][1],-0.005]) cylinder(2.01,el_r[i],el_r[i]);
        }

    }

    translate([nhp*hp/2, mh-15, 0])engrave_label("VCA",11.5);

    translate([nhp*hp-10,10,2]) cube([8,mh-35,1]);

    translate([ox+nhp*hp*0.2,my+elems[0][1],0]) rotate([0,0,90])engrave_label("IN",8);
    translate([ox+nhp*hp*0.2,my+elems[1][1],0]) rotate([0,0,90])engrave_label("CV",8);
    translate([ox+nhp*hp*0.2,my+elems[2][1]+4,0]) rotate([0,0,0])engrave_label("OFF",5);
    translate([ox+nhp*hp*0.2,my+elems[2][1]-4,0]) rotate([0,0,0])engrave_label("SET",5);
    translate([ox+nhp*hp*0.2,my+elems[3][1],0]) rotate([0,0,90])engrave_label("OUT",8);
    
    }

module cgs_bp() {
    jack_r = 6.5/2 + e;
    switch_r = 6.5/2 + e;
    pot_r = 7.5/2 + e;
    
    nhp = 10;
    echo(nhp*hp);
    dist = 15;

    // offset x
    ox = 0;
    // offset y
    oy = 0;

    //distance right
    dr = 20;
    dr2 = 15;
    
    elems = [[ 0.0,    79.629],
     [ 0.0,    50.546],
     [ 0.0,    29.083],
     [ 0.0,     0.   ]];
    // elements span in y direction
    el_sy = 79.629;
    my = (mh - el_sy)/2 + oy;



    difference(){
        color("blue") euro_rack_module(nhp);
        
            translate([nhp*hp-dr,my,-0.005]) cylinder(2.01,pot_r,pot_r);
            translate([nhp*hp-dr,my+29.083,-0.005]) cylinder(2.01,pot_r,pot_r);
            translate([nhp*hp-dr,my+50.546,-0.005]) cylinder(2.01,pot_r,pot_r);
            translate([nhp*hp-dr,my+79.629,-0.005]) cylinder(2.01,pot_r,pot_r);

            // second column
            translate([nhp*hp-dr-dr2,my,-0.005]) cylinder(2.01,jack_r,jack_r);
            translate([nhp*hp-dr-dr2,my+33.083,-0.005]) cylinder(2.01,jack_r,jack_r);
            translate([nhp*hp-dr-dr2,my+46.546,-0.005]) cylinder(2.01,jack_r,jack_r);
            translate([nhp*hp-dr-dr2,my+79.629,-0.005]) cylinder(2.01,jack_r,jack_r);
            translate([nhp*hp-dr-dr2,my+29.083/2,-0.005]) cylinder(2.01,jack_r,jack_r);
            translate([nhp*hp-dr-dr2,my+50.546+29.083/2,-0.005]) cylinder(2.01,jack_r,jack_r);

        
        


    }

    translate([nhp*hp/2, mh-5, 0])engrave_label("DUO",8);
    translate([nhp*hp/2, mh-14, 0])engrave_label("BAND",8.7);

    lo = 7;

    translate([ox+nhp*hp-dr+lo,my+elems[0][1]-lo,0]) rotate([0,0,45])engrave_label("BW1",6);
    translate([ox+nhp*hp-dr+lo,my+elems[1][1]-lo,0]) rotate([0,0,45])engrave_label("FRQ1",6);

    translate([ox+nhp*hp-dr+lo,my+elems[2][1]-lo,0]) rotate([0,0,45])engrave_label("BW2",6);
    translate([ox+nhp*hp-dr+lo,my+elems[3][1]-lo,0]) rotate([0,0,45])engrave_label("FRQ2",6);

    translate([5,my,0]) rotate([0,0,90])engrave_label("O2",7);
    translate([5,my+29.083*0.5,0]) rotate([0,0,90])engrave_label("I2",7);
    translate([5,my+50.546+29.083*0.5,0]) rotate([0,0,90])engrave_label("O1",7);
    translate([5,my+79.629,0]) rotate([0,0,90])engrave_label("I1",7);

    translate([5,my+47.546,0]) rotate([0,0,90])engrave_label("CI",7);
    translate([5,my+32.083,0]) rotate([0,0,90])engrave_label("CO",7);


}





module mk_tvco() {
    
    jack_r = 6.5/2 + e;
    poti_r = 7.5/2 + e;
    
    nhp = 30;
    dist = 15;

    // offset x
    ox = 0.5;
    // offset y
    oy = 10;


    // coordinates for user control elements
    elems = [[ 0.16,  0.0  ],
     [16.65,  0.0  ],
     [33.21,  0.0  ],
     [ 2.04, 65.98],
     [31.24, 65.98],
     [16.63, 15.58],
     [ 0.0,   31.14],
     [33.13, 31.12],
     [ 0.09, 47.63],
     [33.08, 47.72]];
    // elemeints span in x direction
    el_sx = 33.21;
    // elements span in y direction
    el_sy = 65.97999999999999;
    // elements radi
    el_r = [jack_r,jack_r,jack_r,jack_r,jack_r,poti_r,poti_r,poti_r,poti_r,poti_r];
    // labels
    el_l = ["CV","FM","PWM","SAW","PULSE","COARSE","FINE","FM L","PU CV","PWM L"];
    el_ts = [6,6,5.5,4.5,4.5,5,5,5,4,4];


    //margin x
    mx = (10*hp - el_sx)/2 + ox;
    my = (mh - el_sy)/2 + oy;



    difference(){
        color("blue") euro_rack_module(nhp);
        for(j = [0:1:2]) {
            for(i = [0:1:len(elems)-1]) {
                translate([(mx+elems[i][0])+j*50,my+elems[i][1],0]) cylinder(2,el_r[i],el_r[i]);
            }
    }

    }

    translate([nhp*hp/2, 15, 0]) rotate([0,0,180]) engrave_label("TRIPLE OSC",16);
        for(j = [0:1:2]) {

    for(i = [0:1:len(elems)-1]) {
        translate([mx+elems[i][0]+j*50,my+elems[i][1]-8,0]) rotate([0,0,180])engrave_label(el_l[i], el_ts[i]);

        
        
        
    }}

}


include <panel_button.scad>;

module mk_eg() {
    
    jack_r = 5.5/2 + e;
    pot_r = 6.5/2 + e;
    sw_r = 5.5/2 + e;
    led_r = 3.0/2 + e;
    
    btn_r = 7;
    btn_s = 1;
    btn_bh = 7;
    btn_d = 4;
    btn_hr = 2;
    btn_e = 0.3;
    btn_edges = 6;
    
    nhp = 6;
    // offset x
    ox = 0.0;
    // offset y
    oy = 0;

    difference(){
        color("blue") euro_rack_module(nhp);
        translate([nhp*hp/2,mh-18,0]) cylinder(s,pot_r,pot_r);
        translate([nhp*hp/2,mh-33,0]) cylinder(s,pot_r,pot_r);
        translate([nhp*hp/2,mh-48,0]) cylinder(s,pot_r,pot_r);

    //button
    translate([nhp*hp/2+5,mh-65,0])   rotate([0,0,30]) generate_button_hole(btn_r,2,btn_bh,btn_d,btn_hr,btn_e,btn_edges);

        translate([nhp*hp/2-10,mh-75,0]) cylinder(s,sw_r,sw_r);
        translate([nhp*hp/2-6.5,mh-63,0]) cylinder(s,led_r,led_r);



    translate([nhp*hp/2,mh-90,0]) cylinder(s,jack_r,jack_r);
    translate([nhp*hp/2-7,mh-105,0]) cylinder(s,jack_r,jack_r);
    translate([nhp*hp/2+7,mh-105,0]) cylinder(s,jack_r,jack_r);


    }

    translate([nhp*hp/2+5, mh-7, 0]) engrave_label("EG",11);

    translate([nhp*hp/2-9, mh-18, 0]) rotate([0,0,90]) engrave_label("ATT",7);
    translate([nhp*hp/2+9, mh-33, 0]) rotate([0,0,90]) engrave_label("DEC/REL",5);
    translate([nhp*hp/2-9, mh-48, 0]) rotate([0,0,90]) engrave_label("SUST",7);

    translate([nhp*hp/2+5, mh-78, 0]) rotate([0,0,0]) engrave_label("TRG",7);
    translate([nhp*hp/2-6, mh-69, 0]) rotate([0,0,-30]) engrave_label("LOOP",5);

    translate([nhp*hp/2-8, mh-90, 0]) rotate([0,0,90]) engrave_label("GATE",6);
    translate([nhp*hp/2+8, mh-90, 0]) rotate([0,0,90]) engrave_label("IN",7);
    translate([nhp*hp/2-7, mh-115, 0]) rotate([0,0,30]) engrave_label("OUT",6);
    translate([nhp*hp/2+7, mh-115, 0]) rotate([0,0,30]) engrave_label("INV",6);

translate([hp*nhp+10,0,0]) generate_button_top(btn_r,btn_s,btn_bh,btn_d,btn_hr,btn_e,btn_edges);
translate([hp*nhp+10,30,0])
generate_button_bottom(btn_r,btn_s,btn_bh,btn_d,btn_hr,btn_e,btn_edges);

}

module clip_mix() {
    
    jack_r = 5.5/2 + e;
    pot_r = 6.5/2 + e;
    sw_r = 5.5/2 + e;
    led_r = 3.0/2 + e;
    
    btn_r = 7;
    btn_s = 1;
    btn_bh = 7;
    btn_d = 4;
    btn_hr = 2;
    btn_e = 0.3;
    btn_edges = 6;
    
    nhp = 4;
    // offset x
    ox = 0.0;
    // offset y
    oy = 5;

    dpots = 20;
    djacks = 15;
    ts = 5;


    difference(){
        color("blue") euro_rack_module(nhp);
        translate([nhp*hp/2,mh-oy-dpots,0]) cylinder(s,pot_r,pot_r);
        translate([nhp*hp/2,mh-oy-dpots*2,0]) cylinder(s,pot_r,pot_r);


        translate([nhp*hp/2,mh-oy-60,0]) cylinder(s,jack_r,jack_r);
        translate([nhp*hp/2,mh-oy-75,0]) cylinder(s,jack_r,jack_r);
        translate([nhp*hp/2,mh-oy-90,0]) cylinder(s,jack_r,jack_r);
        translate([nhp*hp/2,mh-oy-105,0]) cylinder(s,jack_r,jack_r);


    }
    translate([nhp*hp/2,mh-oy-4,0]) rotate([0,0,0]) engrave_label("CLIP",ts+0.5);
    translate([nhp*hp/2,mh-oy-10,0]) rotate([0,0,0]) engrave_label("MIX",ts+0.5);

    translate([nhp*hp-ts/2-0.4,mh-oy-20,0]) rotate([0,0,90]) engrave_label("PRE",ts);
    translate([nhp*hp-ts/2-0.4,mh-oy-40,0]) rotate([0,0,90]) engrave_label("POST",ts);

    translate([nhp*hp-ts/2-0.4,mh-oy-60,0]) rotate([0,0,90]) engrave_label("IN1",ts);
    translate([nhp*hp-ts/2-0.4,mh-oy-75,0]) rotate([0,0,90]) engrave_label("IN2",ts);
    translate([nhp*hp-ts/2-0.4,mh-oy-90,0]) rotate([0,0,90]) engrave_label("IN3",ts);
    translate([nhp*hp-ts/2-0.4,mh-oy-105,0]) rotate([0,0,90]) engrave_label("OUT",ts);


    translate([e,7,2]) cube([5,mh-25,1]);

}



module sampler() {
    
    jack_r = 5.5/2 + e;
    pot_r = 6.5/2 + e;
    sw_r = 5.5/2 + e;
    led_r = 5.0/2 + e;
    
    btn_r = 8;
    btn_s = 1;
    btn_bh = 7;
    btn_db = 2.25;
    btn_dt = 2*s;
    btn_hr = 2;
    btn_e = 0.3;
    btn_edges = 6;
    
    //generate_button_top_solid(btn_r,btn_db,btn_dt,btn_e,btn_edges);

    
    
    nhp = 18;
    // offset x
    ox = 39.5;
    // offset y
    oy = 27.0;

    u = 2.54;
    dx = 17*u;
    dy = 8*u;
    
    //distance of led from jack
    dl = -4 * u; 
    //distance of switch from jack
    ds = -10 * u;

    difference(){
        color("blue") euro_rack_module(nhp);
        
        for(i=[0:1:1]) {
            for(j=[0:1:3]) {
                translate([ox+i*dx,mh-oy-dy*j,0]) {
                    
                    cylinder(s,jack_r,jack_r);
                    translate([dl,0,0]) cylinder(s,led_r,led_r);
                    translate([ds,0,0]) generate_button_hole(btn_r,2,btn_bh,btn_dt,btn_hr,btn_e,btn_edges);

                    } 
                }
            
            }
                translate([ox+1*dx,mh-oy-dy*4,0]) {
                    
                    cylinder(s,jack_r,jack_r);
                }

    }

translate([34,mh-oy-dy*4,0]) rotate([0,0,0]) engrave_label("SMPLR",14);
translate([74,mh-oy-dy*4,0]) rotate([0,0,90]) engrave_label("OUT",5.8);
translate([hp*nhp/2,mh-10,0]) rotate([0,0,0]) engrave_label("SMPLSMPLSMPLSMPL",5.8);
translate([hp*nhp/2,mh-16,0]) rotate([0,0,0]) engrave_label("PLSMPLSMPLSMPLSM",5.8);

}

module cgs_vcf() {
    
    jack_r = 6/2 + e;
    pot_r = 7/2 + e;
    sw_r = 6/2 + e;
    led_r = 5.0/2 + e;
    

    nhp = 18;

    difference(){
        color("blue") euro_rack_module(nhp);
        
        translate([nhp*hp*(1/4),mh-25,0]) cylinder(2,pot_r,pot_r);
        translate([nhp*hp*(2/4),mh-25,0]) cylinder(2,pot_r,pot_r);
        translate([nhp*hp*(3/4),mh-25,0]) cylinder(2,pot_r,pot_r);

        translate([nhp*hp*(1/6),mh-55,0]) cylinder(2,pot_r,pot_r);
        translate([nhp*hp*(2.3/6),mh-55,0]) cylinder(2,pot_r,pot_r);
        translate([nhp*hp*(3.7/6),mh-55,0]) cylinder(2,pot_r,pot_r);
        translate([nhp*hp*(5/6),mh-55,0]) cylinder(2,pot_r,pot_r);
 
        
        translate([nhp*hp*(1/5)+5,45,0]) cylinder(2,jack_r,jack_r);
        translate([nhp*hp*(1/5)+5,25,0]) cylinder(2,jack_r,jack_r);
        translate([nhp*hp*(2.3/5)+5,25,0]) cylinder(2,jack_r,jack_r);
        translate([nhp*hp*(2.3/5)+5,45,0]) cylinder(2,jack_r,jack_r);
        translate([nhp*hp*(4/5)+5,25,0]) cylinder(2,jack_r,jack_r);
        translate([nhp*hp*(4/5)+5,45,0]) cylinder(2,jack_r,jack_r);
 
    }

    translate([nhp*hp*(1/4),mh-25+12,0]) rotate([0,0,0]) engrave_label("LP",10);
    translate([nhp*hp*(2/4),mh-25+12,0]) rotate([0,0,0]) engrave_label("HP",10);
    translate([nhp*hp*(3/4),mh-25+12,0]) rotate([0,0,0]) engrave_label("BP",10);

    translate([nhp*hp*(1/6)-0.5,mh-55+11,0]) rotate([0,0,30]) engrave_label("Freq",8);
    translate([nhp*hp*(2.3/6)-5,mh-55+8,0]) rotate([0,0,30]) engrave_label("CV",8);
    translate([nhp*hp*(3.7/6)-7,mh-55+7,0]) rotate([0,0,30]) engrave_label("RES",8);
    translate([nhp*hp*(5/6)-2,mh-55+10,0]) rotate([0,0,30]) engrave_label("GAIN",8);

    translate([nhp*hp*(1/5)+5,45+9,0]) rotate([0,0,0]) engrave_label("LP",9);
    translate([nhp*hp*(2.3/5)+5,45+9,0]) rotate([0,0,0]) engrave_label("HP",9);
    translate([nhp*hp*(1/5)+5,25+9,0]) rotate([0,0,0]) engrave_label("BP",9);
    translate([nhp*hp*(2.3/5)+5,25+9,0]) rotate([0,0,0]) engrave_label("ALL",9);

    translate([nhp*hp*(4/5)+5,45+9,0]) rotate([0,0,0]) engrave_label("CV",9);
    translate([nhp*hp*(4/5)+5,25+9,0]) rotate([0,0,0]) engrave_label("OUT",9);

    translate([nhp*hp*(3/5)+6,20,0]) cube([4,43,3]);



    translate([8,25+17,0]) rotate([0,0,90]) engrave_label("INPUTS",8);


    translate([nhp*hp*0.5,12,0]) rotate([0,0,0]) engrave_label("STEINER VCF",9.7);


}



module cgs_vcf_slim() {
    
    jack_r = 6/2 + e;
    pot_r = 7/2 + e;
    sw_r = 6/2 + e;
    led_r = 5.0/2 + e;
    

    nhp = 12;

    difference(){
        color("blue") euro_rack_module(nhp);
        
        translate([nhp*hp*(1/5),mh-18,0]) cylinder(2,pot_r,pot_r);
        translate([nhp*hp*(2.5/5),mh-18,0]) cylinder(2,pot_r,pot_r);
        translate([nhp*hp*(4/5),mh-18,0]) cylinder(2,pot_r,pot_r);

        translate([nhp*hp*(1/5),mh-40,0]) cylinder(2,pot_r,pot_r);
        translate([nhp*hp*(2.5/5),mh-40,0]) cylinder(2,pot_r,pot_r);
        translate([nhp*hp*(4/5),mh-40,0]) cylinder(2,pot_r,pot_r);
        
        
        translate([nhp*hp*(4/5),mh-62,0]) cylinder(2,pot_r,pot_r);
 
        
        translate([nhp*hp*(1/5),mh-84,0]) cylinder(2,jack_r,jack_r);
        translate([nhp*hp*(2.5/5),mh-84,0]) cylinder(2,jack_r,jack_r);
        translate([nhp*hp*(4/5),mh-84,0]) cylinder(2,jack_r,jack_r);

        translate([nhp*hp*(1/5),mh-106,0]) cylinder(2,jack_r,jack_r);
        translate([nhp*hp*(2.5/5),mh-106,0]) cylinder(2,jack_r,jack_r);
        translate([nhp*hp*(4/5),mh-106,0]) cylinder(2,jack_r,jack_r);
 
    }

    translate([nhp*hp*(1/5),mh-10,0]) rotate([0,0,0]) engrave_label("LP",6);
    translate([nhp*hp*(2.5/5),mh-10,0]) rotate([0,0,0]) engrave_label("HP",6);
    translate([nhp*hp*(4/5),mh-10,0]) rotate([0,0,0]) engrave_label("BP",6);

    translate([nhp*hp*(1/5),mh-31,0]) rotate([0,0,20]) engrave_label("Freq",6);
    translate([nhp*hp*(2.5/5),mh-31,0]) rotate([0,0,20]) engrave_label("CV",6);
    translate([nhp*hp*(4/5),mh-31,0]) rotate([0,0,20]) engrave_label("RES",6);
    
    translate([nhp*hp*(4/5),mh-53,0]) rotate([0,0,0]) engrave_label("GAIN",6.5);

    translate([nhp*hp*(1/5)-2,mh-84+9,0]) rotate([0,0,0]) engrave_label("LP",7);
    translate([nhp*hp*(2.5/5)-2,mh-84+9,0]) rotate([0,0,0]) engrave_label("HP",7);
    translate([nhp*hp*(1/5)-2,mh-106+9,0]) rotate([0,0,0]) engrave_label("BP",7);
    translate([nhp*hp*(2.5/5)-2,mh-106+9,0]) rotate([0,0,0]) engrave_label("ALL",7);

    translate([nhp*hp*(4/5)+2,mh-84+9,0]) rotate([0,0,0]) engrave_label("CV",7);
    translate([nhp*hp*(4.69/5),mh-106+4,0]) rotate([0,0,90]) engrave_label("OUT",6.5);


    translate([nhp*hp*(1.6/5),63,0]) rotate([0,0,0]) engrave_label("INPUTS",7);

    translate([nhp*hp*0.5,10,0]) rotate([0,0,0]) engrave_label("STEINER VCF",6.5);

    translate([nhp*hp*(3.25/5),16,0]) cube([3,42,3]);
    translate([e,74,0]) cube([37,3,3]);


}



module power_module() {
    
    fuse_r = 11/2 + e;
    pwrin_r = 8/2 + e;
    sw_r = 6/2 + e;
    led_r = 5.0/2 + e;
    

    nhp = 5;

    d = 17;

    difference(){
        color("blue") euro_rack_module(nhp);
        
        translate([d,20,0]) cylinder(2,pwrin_r,pwrin_r);
        translate([d,50,0]) cylinder(2,sw_r,sw_r);
        translate([d,80,0]) cylinder(2,fuse_r,fuse_r);
        translate([d,110,0]) cylinder(2,led_r,led_r);
    }
    
    
    translate([5,20,0]) rotate([0,0,90]) engrave_label("AC IN",6);
    translate([5,50,0]) rotate([0,0,90]) engrave_label("ON/OFF",6);
    translate([5,80,0]) rotate([0,0,90]) engrave_label("FUSE",6);
    translate([7,107.5,0]) rotate([0,0,90]) engrave_label("PWR",10);

    

}



module dm_638() {
    nhp = 10;
    jack_r = 6/2 + e;
    pot_r = 7/2 + e;
    sw_r = 6/2 + e;
    led_r = 3.0/2 + e;


    btn_r = 8;
    btn_s = 11111;
    btn_bh = 111111;
    btn_db = 2.5;
    btn_dt = 3;
    btn_hr = 11111;
    btn_e = 0.2;
    btn_edges = $fn;
    
    translate([nhp*hp+btn_r+5,btn_r*2,0])generate_button_top_solid(btn_r,btn_db,btn_dt,btn_e,btn_edges);



    module placeholder() {
    difference(){
        cylinder(10,2.2,2.2);
        cylinder(10,1.6,1.5);
        }
    }
    
    translate([nhp*hp+btn_r+5-5,btn_r*6-5,0]) cube([10,35,0.3]);
    
    translate([nhp*hp+btn_r+5,btn_r*6,0]) placeholder();
    translate([nhp*hp+btn_r+5,btn_r*7,0]) placeholder();
    translate([nhp*hp+btn_r+5,btn_r*8,0]) placeholder();
    translate([nhp*hp+btn_r+5,btn_r*9,0]) placeholder();
    


    // coordinates for user control elements
    elems = [[29.972, 83.98 ],
     [ 0.0,    83.98 ],
     [29.972, 60.358],
     [ 0.0,    60.358],
     [29.972, 36.99 ],
     [ 0.0,    36.99 ],
     [29.972, 16.0   ],
     [ 0.0,    16.0   ],
     [29.972,  0.0   ],
     [ 0.0,     0.16 ],
     [ 9.652, 16.17 ],];
    // elements span in x direction
    el_sx = 29.971999999999998;
    // elements span in y direction
    el_sy = 83.97999999999999;
    // elements radi
    el_r = [pot_r,pot_r,pot_r,pot_r,pot_r,pot_r,jack_r,jack_r,jack_r,btn_r,led_r];

        
    
    // labels
    el_l = ["Gain","Accent","Mix","Decay1","Osc2","Osc1","Accent","","Out","Trgr", ""];
    el_ts = [5,5,5,5,5,5,4,5,7,5.8,5];
    el_lx = [0,3.5,0,3.5,0,0,-1,0,0,3,0];


    ox = 0;
    oy = 0;
    //margin x
    mx = (nhp*hp - el_sx)/2 + ox;
    my = (mh - el_sy)/2 + oy;



    difference(){
        color("blue") euro_rack_module(nhp);
            for(i = [0:1:len(elems)-1]) {
                translate([(mx+elems[i][0]),my+elems[i][1],0]) cylinder(2,el_r[i],el_r[i]);
            }
    }

    for(i = [0:1:len(elems)-1]) {
        translate([mx+elems[i][0]+el_lx[i],my+elems[i][1]-el_r[i]-el_ts[i],0]) engrave_label(el_l[i], el_ts[i]);

        
        
        
    }

    translate([nhp*hp/2,mh-12,0]) engrave_label("638KICK", 7.8);
    
    difference(){
    translate([e,e,0])cube([27,46,3.5]);
    translate([2+e,e,0])cube([23,44,3.5]);
        }
    
    }


module dm_77() {
    nhp = 10;
    jack_r = 6/2 + e;
    pot_r = 7/2 + e;
    sw_r = 6/2 + e;
    led_r = 3.0/2 + e;
    pb_r = 8;

// coordinates for user control elements
elems = [[31.83,  86.1  ],
    [18.61,  86.1  ],
 [32.08,  66 ],
 [ 5.16,  66],
 [32.08,  42.68 ],
 [ 5.16,  43.1 ],
 [32.08,  21],
 [ 5.16,  20.58 ],
 [37.04,   0.0   ],
 [25.1,    0.0   ],
 [13.03,   0.0   ],
 [ 0.0,     0.0   ],
 [18.24,  60.33 ],
 [22.56,  71.76 ],
 [22.56,  48.64 ],
 [ 5.41,  85.86 ]];
// elements span in x direction
el_sx = 37.04;
// elements span in y direction
el_sy = 85.86;
// elements radi
el_r = [pot_r,pot_r,pot_r,pot_r,pot_r,pot_r,pot_r,pot_r,jack_r,jack_r,jack_r,jack_r,sw_r,led_r,led_r,pb_r];

        
    
    // labels
    el_l = ["VCO","DiRT","LFO F.","LFOMod","Dec/Rel","Sweep","Noise","Ext Lvl","Trg","CV","Ext", "Out","Tr/Gt","","","Trg"];
    el_ts = [7,4.3,4.3,4.2,5,5,5,5,5,5,5,5,5,5,5,4.3];
    el_lx = [-8,-6,-1,-1,-8,0,0,-4,1,0,0,-1,0,0,0,-11];
    el_ly = [7,5,14,14,8,0,1,16,-2,14,-2,14,0,0,0,8];
    el_ro = [90,90,0,0,90,0,0,0,0,0,0,0,0,0,0,0];

    ox = 0;
    oy = 0;
    //margin x
    mx = (nhp*hp - el_sx)/2 + ox;
    my = (mh - el_sy)/2 + oy;



    difference(){
        color("blue") euro_rack_module(nhp);
            for(i = [0:1:len(elems)-1]) {
                translate([(mx+37.04-elems[i][0]),my+elems[i][1],0]) cylinder(2,el_r[i],el_r[i]);
            }
    }

    for(i = [0:1:len(elems)-1]) {
        translate([mx+37.04-elems[i][0]+el_lx[i],my+elems[i][1]-el_r[i]*2+el_ly[i],0]) rotate([0,0,el_ro[i]]) engrave_label(el_l[i], el_ts[i]);

        
        
        
    }

    translate([nhp*hp/2,mh-4,0]) engrave_label("Coron", 6);
    translate([nhp*hp/2,mh-12,0]) engrave_label("DS7", 7);


    btn_r = 8;
    btn_s = 11111;
    btn_bh = 111111;
    btn_db = 3;
    btn_dt = 2;
    btn_hr = 11111;
    btn_e = 0.2;
    btn_edges = $fn;
    
    translate([nhp*hp+btn_r+5,btn_r,0])generate_button_top_solid(btn_r,btn_db,btn_dt,btn_e,btn_edges);

}
module slim_mixer() {
    nhp = 6;
    jack_r = 6/2 + e;
    pot_r = 7/2 + e;
    sw_r = 6/2 + e;
    led_r = 3.0/2 + e;



    difference(){
        color("blue") euro_rack_module(nhp);
        
        translate([0,-16,0]) {
            translate([nhp*hp-7.112,mh-5.08,0]) cylinder(2.1, pot_r, pot_r);
            translate([nhp*hp-23.368,mh-5.08,0]) cylinder(2.1, pot_r, pot_r);
            translate([nhp*hp-7.112,mh-19.05,0]) cylinder(2.1, pot_r, pot_r);
            translate([nhp*hp-23.368,mh-19.05,0]) cylinder(2.1, pot_r, pot_r);
            translate([nhp*hp-23.368,mh-33.02,0]) cylinder(2.1, pot_r, pot_r);

            translate([nhp*hp-5.08,mh-55.88,0]) cylinder(2.1, jack_r, jack_r);
            translate([nhp*hp-25.4,mh-55.88,0]) cylinder(2.1, jack_r, jack_r);
            translate([nhp*hp-5.08,mh-76.2,0]) cylinder(2.1, jack_r, jack_r);
            translate([nhp*hp-25.4,mh-76.2,0]) cylinder(2.1, jack_r, jack_r);
            translate([nhp*hp-5.08,mh-92.075,0]) cylinder(2.1, jack_r, jack_r);
            translate([nhp*hp-25.4,mh-92.075,0]) cylinder(2.1, jack_r, jack_r);

            translate([nhp*hp-25.4,mh-92.075,0]) cylinder(2.1, led_r, led_r);

            translate([nhp*hp-5.08,mh-46.355,0]) cylinder(2.1, led_r, led_r);
            translate([nhp*hp-25.4,mh-46.355,0]) cylinder(2.1, led_r, led_r);
            translate([nhp*hp-5.08,mh-66.675,0]) cylinder(2.1, led_r, led_r);
            translate([nhp*hp-25.4,mh-66.675,0]) cylinder(2.1, led_r, led_r);


        }
    }


translate([0,-16,0]) {
    
    translate([nhp*hp-7.112,mh-5.08+6.5,0]) rotate([0,0,0]) engrave_label("CH2", 4.5);
    translate([nhp*hp-23.368,mh-5.08+6.5,0]) rotate([0,0,0]) engrave_label("CH1", 4.5);
    translate([nhp*hp-7.112,mh-19.05+6.5,0]) rotate([0,0,0]) engrave_label("CH4", 4.5);
    translate([nhp*hp-23.368,mh-19.05+6.5,0]) rotate([0,0,0]) engrave_label("CH3", 4.5);
    translate([nhp*hp-23.368+14,mh-33.02+0,0]) rotate([0,0,0]) engrave_label("GAIN", 4.8);
    
    translate([nhp*hp/2,mh-41,0]) rotate([0,0,0]) engrave_label("INPUTS", 4.8);
    translate([nhp*hp/2,mh+7.5,0]) rotate([0,0,0]) engrave_label("LEVELS", 4.8);

    
translate([nhp*hp-5.08-7,mh-46.355-5,0]) rotate([0,0,90]) engrave_label("CH2", 4.5);
translate([nhp*hp-25.4+7,mh-46.355-5,0]) rotate([0,0,90]) engrave_label("CH1", 4.5);
translate([nhp*hp-5.08-7,mh-66.675-5,0]) rotate([0,0,90]) engrave_label("CH4", 4.5);
translate([nhp*hp-25.4+7,mh-66.675-5,0]) rotate([0,0,90]) engrave_label("CH3", 4.5);

translate([nhp*hp-5.08-2,mh-92.075+7,0]) rotate([0,0,0]) engrave_label("INV", 4.8);
translate([nhp*hp-25.4+2,mh-92.075+7,0]) rotate([0,0,0]) engrave_label("OUT", 4.8);




    }

    translate([e,6,2]) {
        difference(){
        cube([hp*nhp-2*e,10,1]);
        translate([nhp*hp/2,5,-1])engrave_label("MIXER", 6);

        }
    }


    ps = [[1.5723243480846167,2.2057483342430557],[4.040590926092283,1.4572193220591667],[5.559524204866231,3.843155548395319],[6.03419085448309,1.8314838281511112],[7.125924148601866,0.24085967726034324],[8.312590772644013,2.158965270981563],[9.546724061647845,3.4688910423033716],[9.926457381341333,2.5332297770735104],[11.113124005383481,0.8022564363982626],[11.635257319962026,0.24085967726034324],[12.916857273927544,2.3460975240275355],[14.435790552701492,4.170636991225771],[15.527523846820268,1.3636531955361793],[16.714190470862416,2.2057483342430557],[17.521123775211077,3.1414095994729196],[17.71099043505782,1.6911346383666315],[18.233123749636363,0.6151241833522877],[19.040057053985024,0.14729355073735578],[20.274190342988856,2.5332297770735104],[21.50832363199269,0.3344258037833307],[22.362723601303035,4.872382940148167],[23.976590210000353,2.907494283165455],[25.827790143506107,4.5916845605792105],[26.25499012816128,0.3344258037833307],[28.011256731743657,4.264203117748756],[28.723256706168947,2.2057483342430557],[29.67259000540266,0.4279919303063155],[30.52885660898504,4.077070864702783],];


    translate([e-1,84,2]) {
    linear_extrude(1) polyline(ps,1);
    }



}

module mk_vcf() {
    nhp = 5;
    jack_r = 6/2 + e;
    pot_r = 7/2 + e;
    sw_r = 6/2 + e;
    led_r = 3.0/2 + e;

    potx = 12;
    jackx = 11.75;
    potd = 14.1;
    
    jackdy = [12.19, 10.17, 11.43];

    my = (mh-(3*potd+jackdy[0]+jackdy[1]+jackdy[2]))/2+4;


    difference(){
        color("blue") euro_rack_module(nhp);
        
        translate([nhp/2,0,0]) {
            translate([potx,mh-my,0]) cylinder(2.1, pot_r, pot_r);
            translate([potx,mh-my-potd*1,0]) cylinder(2.1, pot_r, pot_r);
            translate([potx,mh-my-potd*2,0]) cylinder(2.1, pot_r, pot_r);
            translate([potx,mh-my-potd*3,0]) cylinder(2.1, pot_r, pot_r);
            translate([jackx,mh-my-potd*3-jackdy[0],0]) cylinder(2.1, jack_r, jack_r);
            translate([jackx,mh-my-potd*3-jackdy[0]-jackdy[1],0]) cylinder(2.1, jack_r, jack_r);
            translate([jackx,mh-my-potd*3-jackdy[0]-jackdy[1]-jackdy[2],0]) cylinder(2.1, jack_r, jack_r);
            }
    }
    
    translate([nhp*hp/2,mh-9,0]) engrave_label("diode", 5);
    translate([nhp*hp/2,mh-17,0]) engrave_label("VCF", 9);

    lx1 = 5.5;
    lx2 = hp*nhp-3.7;

    translate([lx1,mh-my,0]) rotate([0,0,90]) engrave_label("CO", 6);
    translate([lx2,mh-my-potd*1,0]) rotate([0,0,90]) engrave_label("RES", 6);
    translate([lx1,mh-my-potd*2,0]) rotate([0,0,90]) engrave_label("IN", 6);
    translate([lx2,mh-my-potd*3,0]) rotate([0,0,90]) engrave_label("CV", 6);

    translate([lx1,mh-my-potd*3-jackdy[0],0]) rotate([0,0,90]) engrave_label("IN", 6);
    translate([lx2,mh-my-potd*3-jackdy[0]-jackdy[1],0]) rotate([0,0,90]) engrave_label("CV", 6);
    translate([lx1,mh-my-potd*3-jackdy[0]-jackdy[1]-jackdy[2],0]) rotate([0,0,90]) engrave_label("OUT", 6);

}

module cgs_eg() {
}

module distortion() {
}

module wave_shaper() {
}

module lfo() {
    nhp = 4;
    jack_r = 6/2 + e;
    pot_r = 7/2 + e;
    sw_r = 6/2 + e;
    led_r = 3.0/2 + e;



    difference(){
        color("blue") euro_rack_module(nhp);
        
        translate([0,-16,0]) {
            translate([10.16,mh-6.096,0]) cylinder(2.1, pot_r, pot_r);
            translate([10.16,mh-26.416,0]) cylinder(2.1, pot_r, pot_r);
            translate([nhp*hp-6.096,mh-75.1840,0]) cylinder(2.1, jack_r, jack_r);
            translate([nhp*hp-6.096,mh-91.44,0]) cylinder(2.1, jack_r, jack_r);
            translate([nhp*hp-15.24,mh-75.1840,0]) cylinder(2.1, led_r, led_r);
            translate([nhp*hp-15.24,mh-91.44,0]) cylinder(2.1, led_r, led_r);


        }
    }


translate([nhp*hp/2,-16,0]) {
    
    translate([0,mh-6.096+10,0]) rotate([0,0,40]) engrave_label("FREQ", 4.8);
    translate([0,mh-26.416+10,0]) rotate([0,0,40]) engrave_label("SHAPE", 4.8);

    translate([0,mh-75.1840+7.5,0]) rotate([0,0,0]) engrave_label("SQR", 4.8);
    translate([0,mh-91.44+7.5,0]) rotate([0,0,0]) engrave_label("TRI", 4.8);

    translate([0,mh-68.1840+7.5,0]) rotate([0,0,0]) engrave_label("OUTS", 5.3);
    translate([0,mh-52.1840+8,0]) rotate([0,0,90]) engrave_label("LFO", 9);

    }

    translate([e,6,2]) {
        difference(){
        cube([hp*nhp-2*e,10,1]);
        translate([1,0,0]) cube([1,8,1.1]);
        translate([8,0,0]) cube([1,8,1.1]);
        translate([1,7,0]) cube([8,1,1.1]);
        translate([9,0,0]) rotate([0,0,45])cube([10,1,1.1]);
        translate([14.6,7,0]) rotate([0,0,-45])cube([10,1,1.1]);


        }
    }
}

module noise() {
    
    nhp = 5;
    jack_r = 6/2 + e;
    ys = 42;
    ds = 33;

    difference(){
        color("blue") euro_rack_module(nhp);
        
        translate([3*hp,mh-ys,0]) cylinder(2.1, jack_r, jack_r);
        translate([3*hp,mh-ys-ds*1,0]) cylinder(2.1, jack_r, jack_r);
        translate([3*hp,mh-ys-ds*2,0]) cylinder(2.1, jack_r, jack_r);
        
    }
    
    translate([1.2*hp,mh-ys,0]) rotate([0,0,90]) engrave_label("WHITE", 6);
    translate([1.2*hp,mh-ys-ds*1,0]) rotate([0,0,90]) engrave_label("PINK", 6);
    translate([1.2*hp,mh-ys-ds*2,0]) rotate([0,0,90]) engrave_label("BLUE", 6);

    translate([nhp*hp/2,mh-11,0]) rotate([0,0,0]) engrave_label("NOI", 8);
    translate([nhp*hp/2,mh-20,0]) rotate([0,0,0]) engrave_label("ZE", 8);


}

noise();