include<globals.scad>

module tronxy_x5s_cage(print_only_top=false) {
    translate([0,0,0])rotate([0,90,0])profile2020(profiles_long);
    translate([0,profiles_short+20,0])rotate([0,90,0])profile2020(profiles_long);
    translate([20,20,0])rotate([0,90,90])profile2020(profiles_short);
    translate([profiles_long-20,0,0])translate([20,20,0])rotate([0,90,90])profile2020(profiles_short);

    if(!print_only_top){
        translate([0,0,-profiles_vertical-20])profile2020(profiles_vertical);
        translate([0,20,-profiles_vertical])profile2020(profiles_vertical);

        translate([0,profiles_short,-profiles_vertical-20])profile2020(profiles_vertical);
        translate([0,profiles_short+20,-profiles_vertical-20])profile2020(profiles_vertical);

        translate([profiles_long-20,0,-profiles_vertical-20])profile2020(profiles_vertical);
        translate([profiles_long-20,20,-profiles_vertical-20])profile2020(profiles_vertical);

        translate([profiles_long-20,profiles_short,-profiles_vertical-20])profile2020(profiles_vertical);
        translate([profiles_long-20,profiles_short+20,-profiles_vertical-20])profile2020(profiles_vertical);

        translate([0,0,-profiles_vertical-20])rotate([0,90,0])profile2020(profiles_long);
        translate([0,profiles_short+20,-profiles_vertical-20])rotate([0,90,0])profile2020(profiles_long);
        translate([20,20,-profiles_vertical-20])rotate([0,90,90])profile2020(profiles_short);
        translate([profiles_long-20,0,-profiles_vertical-20])translate([20,20,0])rotate([0,90,90])profile2020(profiles_short);
    }
}
