lado_peao = 19;
lado_torre = 28;
diametro_dama = 24;
lado_casa = 42;
cor_escura = [0, 0, 0];
cor_clara = [1, 1, 0];
offset_peao = (lado_casa - lado_peao) / 2;
offset_torre = (lado_casa - lado_torre) / 2;

color(cor_escura) square([lado_casa, lado_casa]);
translate([offset_peao, offset_peao, 0])
	cube([lado_peao, lado_peao, lado_peao]);
translate([lado_casa+offset_torre, offset_torre, 0])
	cube([lado_torre, lado_torre, lado_torre]);
translate([lado_casa*2, 0, 0])
	color(cor_escura) square([lado_casa, lado_casa]);
