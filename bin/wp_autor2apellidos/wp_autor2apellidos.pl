#!/usr/bin/perl -w
use utf8;

#-------------------------------------------------------------------------------
sub fhelp {
#-------------------------------------------------------------------------------
	my $nombre="wp_autor2apellidos.pl";
	print "* $nombre
	* Uso
		> $nombre 
	* Descripción
		Convierte la entrada estándar
		> | autor = APELLIDOS, NOMBRE
		a
		> | apellidos = APELLIDOS
		> | nombre = NOMBRE

		o 
		> | autor = [[ENLACE | APELLIDOS, NOMBRE]]
		a
		> | apellidos = APELLIDOS
		> | nombre = NOMBRE
		> | enlaceautor = ENLACE

		También combierte la ubiicación y editorial combinadas en campos separados
		> | editorial = UBICACIÓN: EDITORIAL
		a
		> | ubiicación = UBICACIÓN
		> | editorial = EDITORIAL
		
	* Opciones
		* -h
			Muestra esta ayuda.
	\n";
}
#-------------------------------------------------------------------------------
if( @ARGV >0 && $ARGV[0] eq "-h"){ fhelp(); exit 0; }

while(<>) {
	s/\| *autor *= *\[\[ *([^\|]*) *\| *([^,]*) *,([^\]]*) *\]\]/| apellidos = $2\n| nombre = $3\n| enlaceautor = $1/g;
	s/\| *autor *= *([^,]*) *,([^\|]*)/| apellidos = $1\n| nombre = $2/g;
	s/\| *editorial *= *([^:]*) *: *([^\|]*)/| ubiicación = $1\n| editorial = $2/g;
	print;
}

