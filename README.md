# wp_utiles
Herramientas para manejo de la Wikipedia

## wp_enlace2citaweb.pl
Convierte 

[<url>] en \{\{cita web | url=<url> | fachaacceso=<fecha actual> | campos adicionales vacíos\}\}

[<url> <título>] en \{\{cita web | url=<url> | título=<título> | fachaacceso=<fecha actual> | campos adicionales vacíos\}\}

### Uso 
```
 wp_enlace2citaweb.pl -h 
```

```
 wp_enlace2citaweb.pl [opciones]
```


### Opciones
#### -h
Muestra esta ayuda.


#### -n
La plantilla generada es Cita noticia


#### -w
La plantilla generada es Cita web

Es la opción por defecto


#### -e 
Salida expandida: los campos están en diferentes líneas.




## wp_libro2harvard.txt
Si en la entrada estándar hay un elemento de la wikipedia como cita libro, cita web y otros, como

```
 \{\{cita libro|título=Caos|apellidos=Gleick|nombre=James|año=1990|página=34|isbn=3q344\}\}
```

genera una Ficha:Harvnp como

```
 \{\{Harvnp|Gleick|1990|p=34\}\}
```

### Opciones
#### -h
Muestra esta ayuda.


#### -t
Muestra ejemplos de cadena de entrada y salida.


#### -p
Genera la plantilla Harvnp.

Es la opción por defecto.

Elimina el texto anterior y posterior a la plantilla.

Debe usarse para una sóla plantilla.


#### -c
Compacta los espacios entre los nombres, los iguales y los separadores de campos.


#### -e 
Expande los espacios entre los nombres, los iguales y los separadores de campos.


#### -E 
Expande con un campo en cada línea.


#### -j 
Une los libros en una única línea.




## wp_plantilla_siglo.pl
Se pretende que sirva para poner la [Plantilla:SIGLO](https://es.wikipedia.org/wiki/Plantilla:SIGLO) a la mayor parte del código wikipedia

Las líneas entran por entrada estándar, y salen por salida estándar.

### Opciones
#### -h, --help
Muestra esta ayuda.


#### -t, --ignora_titulos
Omite las líneas que contienen títulos


#### -c, --ignora_categorias
Omite las líneas que contienen categorías


#### -i, --input-test
Cadenas para hacer el test


#### -o, --output-test
Resultado esperado del test



### Test
Se puede comprobar su funcionamiento con el script bash

```
 plantilla_siglo_test.sh
```


### Dependencias
*  libgetopt-mixed-perl

### Bugs
*  No funciona para siglos antes de Cristo
*  No funciona cuando no hay wikienlace
*  Funciona hasta el siglo XXIX

### Solucionado
*  También cambia cuando las versalitas no son aplicables: títulos de secciones y categorías
*  Cambia las plantillas versalita con siglo en minúsculas por el siglo en mayúsculas


## wp_caracteres_especiales.sh
### Uso
*  wp_caracteres_especiales.sh [fichero]
*  wp_caracteres_especiales.sh -h

### Descripción 
Convierte algunas abreviaturas de signos en los signos correspondientes


### Símbolos convertidos
*  Tres puntos en elipsis
*  Dos guiones en guión largo
*  ss. en el símbolo de sección

### Opciones
#### -h
Muestra esta ayuda 




## wp_ls_plantilla_siglo.sh
### Uso
```
 wp_ls_plantilla_siglo.sh [fichero]
```

```
 wp_ls_plantilla_siglo.sh -h|--help
```


### Descripción
Lee la entrada estándar o el fichero pasado como parámetro y saca por 
salida estándar las plantillas SIGLO que encuentra.

La utilidad prevista es encontrar si hay wikienlaces repetidos a siglos, 
ejecutando la orden

```
 wp_ls_plantilla_siglo.sh fichero.wiki | sort | uniq -c
```


### Opciones
#### -h | --help
Muestra esta ayuda



### AUTOR
Félix Anadón Trigo





