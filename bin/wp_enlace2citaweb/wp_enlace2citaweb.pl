#!/usr/bin/perl -w


#-------------------------------------------------------------------------------
sub help{
#-------------------------------------------------------------------------------
	print "* wp_enlace2citaweb.pl
	Convierte 

	[<url>] en \\{\\{cita web | url=<url> | facha_acceso=<fecha actual> | campos adicionales vacíos\\}\\}

	[<url> <título>] en \\{\\{cita web | url=<url> | título=<título> | facha_acceso=<fecha actual> | campos adicionales vacíos\\}\\}

	* Uso 
		> wp_enlace2citaweb.pl -h 
		> wp_enlace2citaweb.pl [opciones]

	* Opciones
		* -h
			Muestra esta ayuda.
		* -n
			La plantilla generada es Cita noticia
		* -w
			La plantilla generada es Cita web

			Es la opción por defecto
		* -e 
			Salida expandida: los campos están en diferentes líneas.
";
}
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
# main
#-------------------------------------------------------------------------------

$sep=" ";

if ($#ARGV != -1 && $ARGV[0] eq '-h') {
	help();
	exit;
}

my $tipo="web";
while ($#ARGV > -1) {
	if ($ARGV[0] eq '-n') { $tipo="noticia";}
	elsif ($ARGV[0] eq '-e') { $sep="\n\t";}
	shift;
}

my $extras_comun = "fecha =$sep| fecha_acceso =$sep| nombre =$sep| apellidos =";
my $extras;

if($tipo eq "web") {
	$extras= "$extras_comun$sep| obra = ";
}
if($tipo eq "noticia") {
	$extras= "$extras_comun$sep| periódico =$sep| agencia = ";
}

while(<>) {
	s/\[\[([^ \]]*) ([^]]*)\]\]/{{cita $tipo$sep| url = $1$sep| título = $2$sep| $extras }}/g;
	s/\[\[([^ \]]*) ([^]]*)\]\]/{{cita $tipo$sep| url = $1$sep| título =$sep| $extras }}/g;
	print;
}
#-------------------------------------------------------------------------------
