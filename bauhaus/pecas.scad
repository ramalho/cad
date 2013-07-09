lado_peao = 19;
lado_torre = 28;
diametro_dama = 24;
lado_casa = 44;
epsilon = 0.01;

use <tabuleiro.scad>;
linear_extrude(height=epsilon)
	tabuleiro(lado_casa);

module peao(fila, coluna) {
	translate([lado_casa*(coluna+.5),
                      lado_casa*(fila+.5),
                      lado_peao/2])
		cube(lado_peao, center=true);
}

module torre(fila, coluna) {
	translate([lado_casa*(coluna+.5), 
                      lado_casa*(fila+.5),
                      lado_torre/2])
		cube(lado_torre, center=true);
}

module bispo(fila, coluna) {
	translate([lado_casa*(coluna+.5), 
                      lado_casa*(fila+.5),
                      0])
		linear_extrude(height=lado_torre) union() {
			hull() {
				translate([lado_torre*3/8, lado_torre*3/8, 0])
					square(lado_torre/4, center=true);
				translate([-lado_torre*3/8, -lado_torre*3/8, 0])
					square(lado_torre/4, center=true);
			}
			hull() {
				translate([lado_torre*3/8, -lado_torre*3/8, 0])
					square(lado_torre/4, center=true);
				translate([-lado_torre*3/8, lado_torre*3/8, 0])
					square(lado_torre/4, center=true);
			}
		}
}

module cavalo(fila, coluna) {
	translate([lado_casa*(coluna+.5), 
                      lado_casa*(fila+.5),
                      lado_torre/2]) {
		difference() {
			cube(lado_torre, center=true);
			translate([-lado_torre/2, -lado_torre/2, lado_torre/2])
				cube(lado_torre, center=true);
			translate([lado_torre/2, lado_torre/2, -lado_torre/2])
				cube(lado_torre, center=true);
		}
	}
}

module dama(fila, coluna) {
	translate([lado_casa*(coluna+.5),
                      lado_casa*(fila+.5),
                      lado_torre/2])
		union() {
			cube(lado_torre, center=true);
			translate([0, 0, lado_torre/2+diametro_dama/3.5])
				sphere(r=(diametro_dama/2));
		}
}

module rei(fila, coluna) {
	translate([lado_casa*(coluna+.5),
                      lado_casa*(fila+.5),
                      lado_torre/2])
		union() {
			cube(lado_torre, center=true);
			rotate([0, 0, 45], v=[] )
				translate([0, 0, lado_torre/2+lado_peao/2])
					cube(lado_peao, center=true);
		}
}

for (coluna = [0:6]) {
	peao(1, coluna);
}
peao(1+2*$t, 7);
torre(0, 0);
cavalo(0, 1);
bispo(0, 2);
dama(0, 3);
rei(0,4);
bispo(0, 5);
cavalo(0, 6);
torre(0, 7);

color([.5, 0, 0])
for (coluna = [0:7]) {
	peao(6, coluna);
}

// XXX: como aplicar a cor a todas essas peças de uma vez?

color([.5, 0, 0]) {
	torre(7, 0);
	cavalo(7, 1);
	bispo(7, 2);
	dama(7, 3);
	rei(7,4);
	bispo(7, 5);
	cavalo(7, 6);
	torre(7, 7);
}
