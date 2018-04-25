# ![alt text](https://s3.envato.com/files/221730249/thumbnail.jpg "Pre Push Git Hook")   GIT-2-S3 
## Introducción
Integración contínua para desplegar en S3 a través del hook "pre-push" de Git.

En ServerNull únicamente usamos ficheros estáticos: HTML, JS y CSS, que pueden ir directamente al servidor estático (S3). Por lo tanto, es posible desplegar directamente en S3 cada vez que se suben los archivos a github. 

Cuando se ejecuta el git push, antes de realizar ninguna acción se lanza el hook "pre-push", que recopila todos los ficheros que se van a subir a git y los copia en el bucket de S3 que se indique en la configuración previamente.
## Requisitos
Para poder realizar este proceso es necesario:
 - **Git** ( sudo apt-get install git )
 - **Cuenta de Github**
 - **Cuenta de Amazon** con un **bucket de S3**
 - **Herramienta AWS-CLI** ([Instalación de la AWS Command Line Interface](https://docs.aws.amazon.com/es_es/cli/latest/userguide/installing.html))

## Instalación
Para poder realizar este proceso debemos:
 - Crear un repositorio de **GitHub**
 - Crear un bucket **S3** donde subiremos nuestros archivos.
 - Establecer la **configuración** de la AWS CLI ([Configuración de la AWS CLI](https://docs.aws.amazon.com/es_es/cli/latest/userguide/cli-chap-getting-started.html)). Este proceso consiste en ejecutar la orden: $> **aws configure**, donde se pide:
	 - AWS Access Key ID
	 - AWS Secret Access Key
	 - Default region name [eu-west-1]
	 - Default output format [json]
 - Descargar este hook "**[pre-push](https://s3-eu-west-1.amazonaws.com/git-2-s3/pre-push)**" y copiarlo en la carpeta "**hooks**" del directorio .git del proyecto.
 - Poner el fichero **.s3config** en la raíz del proyecto con el siguiente contenido:
	 - bucket=myBucketName
	 - branch=develop

## Procedimiento
Una vez con todo instalado iniciaremos el proceso habitual de desarrollo del proyecto. Se recomienda el uso de la herramienta git-flow para mantener un orden en el versionado. 

En el momento en que se realice el **push a develop** se pondrá en marcha el hook pre-push de forma automática.

El hook en primer lugar leerá el fichero de configuración **.s3config** que contiene el nombre del bucket y la rama donde se han subido los ficheros y obtendrá un listado de ficheros subidos, **procediendo a hacer la subida de cada uno de ellos al bucket S3**.

### ¡Ojo! Los ficheros serán subidos a S3 sobreescribiendo siempre al previamente subido con ese mismo nombre.
En caso de error, siempre tenemos git para recuperar una versión anterior del archivo y volverla a subir, y tenemos además la posibilidad de habilitar el histórico de s3 para tener copias de versiones anteriores de los ficheros.

## Desinstalación
Para dejar de usar este hook, basta con renombrar el fichero **pre-push**, llamándolo por ejemplo pre-push.txt

by CMD (Carlos Manuel Díaz) - carlos.manuel@beeva.com

> Written with [StackEdit](https://stackedit.io/).

