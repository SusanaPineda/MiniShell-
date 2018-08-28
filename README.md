# Scripting

La práctica consiste en desarrollar un script denominado union.sh que lleve a cabo la unión del contenido de un conjunto de directorios. El Script podrá recibir como argumentos: 
- Un directorio destino 
- Un conjunto de directorios Origen 

- Mandato cp: 
 La copia de archivos solo afecta a los ficheros, no teniendo que incluir los directorios ni subdirectorios que se encontraran dentro de los directorios origen. De la misma forma, el directorio destino, además de los nuevos archivos copiados como resultados de la unión debe mantener los contenidos inicialmente existentes en el propio directorio destino. Las copias realizadas deben preservar los atributos de los ficheros originales, por ejemplo, fecha de modificación, propietario, modos, etc. Sin embargo, en el caso de que exista un archivo con el mismo nombre en dos o más de los directorios, se debe seleccionar como archivo final el archivo cuya fecha de última modificación sea la más reciente. 
 
- Recorrido por los argumentos.

- Comprobación de los mandatos: Se debe comprobar el valor devuelto por cada mandato utilizado y acabar la ejecución del script notificando el error, en caso de que el mandato haya acabado incorrectamente. 

- Archivos con el mismo nombre que un directorio En el caso de que, a la hora de copiar un archivo, exista un directorio con el mismo nombre en el directorio destino, no se realizará la operación, se mostrará un mensaje de error y se continuará tratando el siguiente archivo. En este caso, el programa no devolverá al final ningún valor de error. 
