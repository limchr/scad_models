// see https://doepfer.de/a100_man/a100m_e.htm


$fn = 20;

//printing error
e = 0.20;

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
usb_module();
