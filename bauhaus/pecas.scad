lado_peao = 19;
lado_torre = 28;
diametro_dama = 24;
lado_casa = 44;
cor_escura = [0, 0, 0];
cor_clara = [1, 1, 0];
offset_peao = (lado_casa - lado_peao) / 2;
offset_torre = (lado_casa - lado_torre) / 2;

use <tabuleiro.scad>;
tabuleiro(lado_casa);

module peao(fila, coluna) {
	translate([lado_casa*coluna+offset_peao, 
			    lado_casa*fila+offset_peao, 0])
		cube([lado_peao, lado_peao, lado_peao]);
}

module torre(fila, coluna) {
	translate([lado_casa*coluna+offset_torre, 
                      lado_casa*fila+offset_torre, 0])
		cube([lado_torre, lado_torre, lado_torre]);
}

module cavalo(fila, coluna) {
	difference() {
		torre(fila, coluna);
		translate([lado_casa*coluna-lado_torre/2+offset_torre, 
                            lado_casa*fila+offset_torre-lado_torre/2,
				    lado_torre/2])
			cube([lado_torre, lado_torre, lado_torre]);
		translate([lado_casa*coluna+lado_torre/2+offset_torre, 
				    lado_casa*fila+offset_torre+lado_torre/2, 
				    -lado_torre/2])
			cube([lado_torre, lado_torre, lado_torre]);
	}
}

module bispo(fila, coluna) {
	translate([lado_casa*coluna+offset_torre, 
                      lado_casa*fila+offset_torre, 0])
	linear_extrude(height=lado_torre) {
		union () {
			hull() {
				square([lado_torre/4, lado_torre/4]);
				translate([lado_torre/4*3, lado_torre/4*3, 0])
					square([lado_torre/4, lado_torre/4]);
			}
			hull() {
				translate([0, lado_torre/4*3, 0])
					square([lado_torre/4, lado_torre/4]);
				translate([lado_torre/4*3, 0, 0])
					square([lado_torre/4, lado_torre/4]);
			}
		}
	}
}

module dama(fila, coluna) {
	torre(fila, coluna);
	translate([lado_casa*coluna+lado_casa/2, 
                      lado_casa*fila+lado_casa/2, 
			lado_torre+diametro_dama/3])
		sphere(r=(diametro_dama/2));
}

module rei(fila, coluna) {
	torre(fila, coluna);
	rotate([0, 0, 0])
		translate([0, 0, lado_torre])
			peao(fila, coluna);
}


for (coluna = [0:7]) {
	peao(1, coluna);
}
// torre(0, 0);
bispo(0, 2);
torre(0, 7);
bispo(0, 5);
cavalo(0, 1);
cavalo(2, 5);
dama(0, 3);
rei(3,3);
