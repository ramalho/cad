epsilon = 0.01;
module tabuleiro(lado_casa) {
	cor_escura = [0, 0, 0];
	for ( j = [0: 3] ) {
		for ( i = [0: 3] ) {
			translate([lado_casa * i * 2, lado_casa * j * 2, 0])
				color(cor_escura) square([lado_casa+epsilon, lado_casa+epsilon]);
			translate([lado_casa * ( i * 2 + 1), lado_casa * ( j * 2 + 1), 0])
				color(cor_escura) square([lado_casa+epsilon, lado_casa+epsilon]);
		}
	}
}

tabuleiro(42);