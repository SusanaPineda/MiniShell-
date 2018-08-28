#!/bin/bash

##Comprobamos que el numero de paramentros es mayor que 2
if test $# -lt 2
then
	echo "error.uso hay que pasar al menos dos directorios."
	exit 1
fi
##Comprobamos que el primer parametro es un directorio. Si no lo es mandamos error
if ! test -d $1 
then
	echo "error.uso el primer parametro debe ser un directorio."
	exit 1
fi

##Pasamos a la ejecucion 
##Recorremos todos los argumentos pasados y vamos copiando

##Para comprobar si se han copiado todos los archivos guaradamos en 
##variables el numero inicial de archivos en destino e inicializamos
##el numero de archivos copiados a 0 para la primera vuelta del for
numeroInicial=`ls $1|wc -l`
numeroCopiados=0
for arg
do 	
	if [ "$arg" != "$1" ] 	##Solo copiamos cuando alcancemos con el for el 
	then			## primer argumento Origen
		if test -d $arg	##Comprobamos que los argumentos pasados son
		then		##directorios
			cp -p -u $arg/* $1	##copiamos los archivos	
			##manteniendo las propiedades y en caso de dos con
			##el mismo nombre nos quedamos con el mas reciente
			
			if ! [ $? = 0 ]	##comprobamos que no ha habido ningun 						##error durante la copia de archivos
			then
				echo "error durante la copia de documentos"
			fi
			
			numeroCopiados=$((`ls $arg|wc -l` + $numeroCopiados))
			##calculamos el numero de archivos copiados
			
		else 
			echo "error: $arg no es un directorio "
			exit 2
		fi

	fi
done

if ! [ $? = 0 ]
then
	echo "error durante el recorrido de los argumentos"
fi

##Calculamos el numero de archivos que deberia haber en Destino
numeroCopiados=$(($numeroInicial + $numeroCopiados))
##Calculamos el numero de archivos que hay en Destino
numeroArchivos=`ls $1|wc -l`
##Comprobamos si el numero de archivos en Destino es menor al que debería haber
if test $numeroArchivos -ne $numeroCopiados
then
	echo "Archivos omitidos durante la copia"
fi
