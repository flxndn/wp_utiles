#!/usr/bin/perl -w

my $entrada="{{cita libro|título=modorro|apellidos=Valle|nombre=Juan|año=1233|página=34|isbn=3q344}}";
my $salida= "{{Harvnp|Valle|1233|p=34}}";

#-------------------------------------------------------------------------------
sub help{
#-------------------------------------------------------------------------------
	print "* libro2harvard.txt
	Si en la entrada estándar hay un elemento de la wikipedia como cita libro, cita web y otros, como

	> $entrada

	genera una Ficha:Harvnp como

	> $salida

	* Opciones
		* -h
			Muestra esta ayuda.
		* -t
			Muestra ejemplos de cadena de entrada y salida.
		* -p
			Genera la plantilla Harvnp.

			Es la opción por defecto.
	
			Elimina el texto anterior y posterior a la plantilla.

			Debe usarse para una sóla plantilla.
		* -c
			Compacta los espacios entre los nombres, los iguales y los separadores de campos.
		* -e 
			Expande los espacios entre los nombres, los iguales y los separadores de campos.
		* -E 
			Expande con un campo en cada línea.
		* -j 
			Une los libros en una única línea.
	\n";
}
#-------------------------------------------------------------------------------
sub compacta{
#-------------------------------------------------------------------------------
	while(<>){
		s/{{ */{{/g;
		s/ *}}/}}/g;
		s/ *\|/|/g;
		s/\| */|/g;
		s/ *\=/=/g;
		s/\= */=/g;
		print;
	}
}
#-------------------------------------------------------------------------------
sub expande{
#-------------------------------------------------------------------------------
	while(<>){
		s/{{/{{ /g;
		s/}}/ }}/g;
		s/\|/ | /g;
		s/(\| [a-z\-]*)=/$1 = /g;
		print;
	}
}
#-------------------------------------------------------------------------------
sub expande_lineas{
#-------------------------------------------------------------------------------
	while(<>){
		s/\| */\n\t| /g;
		print;
	}
}
#-------------------------------------------------------------------------------
sub junta_lineas{
#-------------------------------------------------------------------------------
	@lineas=<>;
	chomp(@lineas);
	$l=join("",@lineas);
	$l=~s/\n//gs;
	$l=~s/\t//gs;
	$l=~s/\*/\n\*/gs;
	print "$l\n";;
}
#-------------------------------------------------------------------------------
if( @ARGV >0 && $ARGV[0] eq "-h"){ help; exit 0; }
if( @ARGV >0 && $ARGV[0] eq "-t"){ print "$entrada\n"; print "$salida\n"; exit 0; }
if( @ARGV >0 && $ARGV[0] eq "-c"){ shift;compacta; exit 0; }
if( @ARGV >0 && $ARGV[0] eq "-e"){ shift;expande; exit 0; }
if( @ARGV >0 && $ARGV[0] eq "-E"){ shift;expande_lineas; exit 0; }
if( @ARGV >0 && $ARGV[0] eq "-j"){ shift;junta_lineas; exit 0; }

my @lineas=<>; 
chomp(@lineas);

my $lineas=join("", @lineas);
$lineas=~s/[^{]*{{//;
$lineas=~s/}}[^}]*//;
my @campos=split(/[ \t]*\|[ \t]*/,$lineas);
shift(@campos);
my %datos;
my @autores;
my $posicion;
my $ano;
for(@campos) {
	my ($key,$value)=split(/[ \t]*=[ \t]*/,$_);
	if ($key=~/^apellidos?$/) 
		{$autores[0]=$value;}
	if ($key=~/^apellidos?2$/)
		{$autores[1]=$value;}
	if ($key=~/^apellidos?3$/)
		{$autores[2]=$value;}
	if ($key=~/^apellidos?4$/)
		{$autores[3]=$value;}
	if ($key=~/^capítulo$/)   
		{$posicion="loc=«$value»";}
	if ($key=~/^páginas$/)    
		{$posicion="pp=$value";}
	if ($key=~/^página$/)     
		{$posicion="p=$value";}
	if ($key=~/^año$/)        
		{$ano="$value";}
}
print "{{Harvnp|".join("|",@autores)."|$ano";
if ($posicion){ print "|$posicion";}
print "}}\n";

