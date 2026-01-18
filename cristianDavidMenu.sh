#!/bin/bash
navegacion11(){
echo "================================================================"
echo "Has elegido mostrar información del directorio actual. Selecciona una de estas opciónes: "
echo "1. Ver ruta actual"
echo "2. Listar contenido básico"
echo "3. Listado detallado"
echo "4. Mostrar archivos ocultos"
echo "5. Ver tamaño total del directorio"
echo "6. Ver información detallada del directorio"
echo "7. Volver atras"
read -p "" nav1
case "$nav1" in
	1)
		pwd
	;;
	2)
		ls
	;;
	3)
		ls -l
	;;
	4)
		ls -a
	;;
	5)
		du -sh
	;;
	6)
		ls -lh
	;;
	7)
		navegacion
	;;
	*)
	 	echo "Opción  inválida"
;;
esac
}

navegacion12(){
echo "================================================================"
echo "Has elegido cambiar de directorio, selecciona una de las opciones: "
echo "1. Ir a una ruta concreta"
echo "2. Comprobar si una ruta existe"
echo "3. Volver atrás"
read -p "" nav2

case "$nav2" in
	1)
        	read -p "Has elegido ir a una ruta concreta, escriba la ruta a la que quieras" ruta
        	cd "$ruta"
	;;
	2)
        	read -p "Has elegido comprobar si una ruta existe, escriba la ruta que  quiera comprobar: " existe
                if [[ -d "$existe" ]];then
                        echo "La ruta $existe existe"
                else
                        echo "La ruta $existe no existe"
                fi
	;;
	3)
		navegacion
	;;
	*)
		echo  "Opción inválida"
;;
esac
}

navegacion13(){
	echo "================================================================"
	echo "Has seleccionado Navegación guiada en árbol.  Selecciona una de las opciónes: "
	echo "1. Mostrar estructura de directorios en forma de árbol"
	echo "2. Mostrar solo carpetas"
	echo "3. Limitar profundidad del árbol"
	echo "4. Volver atrás"
	read -p "" nav3
	case "$nav3" in
	1)
		tree
	;;
	2)
		tree -d
	;;
	3)
		read -p "Introduce la profundiad deseada " depth
		tree -L "$depth"
	;;
	4)
		navegacion
	;;
	*)
		echo "Opción no válida."
	;;
esac
}

navegacion14(){
echo "================================================================"
echo "Has seleccionado buscar archivos y directorios. Selecciona una opción:"
echo "1. Búsqueda exacta por nombre"
echo "2. Búsqueda por coincidencias parciales"
echo "3. Buscar por tamaño"
echo "4. Buscar por fecha de modificación"
echo "5. Volver atrás"
read -p "" nav4
case "$nav4" in
        1)
                read -p "Has seleccionado búsqueda exacta por nombre, di el nombre del archivo/directorio: " name
				find . -name "$name"
        ;;
        2)
                tree -d
        ;;
        3)
                read -p "Introduce la profundiad deseada " depth
                tree -L $depth
        ;;
        4)
		read -p "Introduce la fecha deseada (YY/MM/DD): " fecha
		find . -maxdepth 1 -newermt "$fecha"
        ;;
	5)
		 navegacion
	;;
        *)
                echo "Opción no válida."
	;;
esac
}

navegacion15(){
echo "================================================================"
echo "Has seleccionado Calcular tamaños de carpetas. Selecciona una opción"
echo "1. Consultar tamaño de una ruta específica"
echo "2. Ordenar carpetas por tamaño"
echo "3. Volver atrás"
read -p nav5

case "$nav5" in
	1)
		read -p "Indique la ruta: " ruta
		du -sh "$ruta"
	;;
	2)
		du --max-depth=1 /home/ | sort -n -r
	;;
	3)
		navegacion
	;;
	*)
		echo "Opción inválida"
	;;
esac
}

navegacion16(){
echo "================================================================"
echo "Has seleccionado Crear / renombrar / eliminar elementos. Selecciona una opción"
echo "1. Crear archivo vacío"
echo "2. Renombrar archivo o carpeta"
echo "3. Eliminar archivo"
echo "4. Eliminar carpeta con contenido."
echo "5. Volver atras "
read -p "" nav6

	case "$nav6" in
	1)	read -p "Indique el nombre del archivo y su extensión" crear
		touch "$crear"
	;;
	2)
		read -p "Indique el archivo o carpeta que desee renombrar" viejo
		read -p "Indique el nuevo nombre" nuevo
		mv "$viejo" "$nuevo"
	;;
	3)
		read -p "Indique el archivo que desee eliminar" del
		rm "$del"
	;;
	4)
		read -p "Indique el nombre de la carpeta con contenido que desee eliminar (CUIDADO CON ESTA OPCIÓN)" delfolder
		read -p "¿ESTÁS SEGURO? (Y/N)" confirmation
		if [ "$confirmation" == "Y" ]; then 
		rm -r "$delfolder"
		elif [ "$confirmation" == "N" ]; then
		echo "Cancelando proceso... "
		else
		echo "Opción inválida, cancelando proceso... "
		fi
	;;
	5)
		navegacion
	;;
	*)
		echo "Opción inválida"
	;;
esac
}

navegacion17(){
echo "================================================================"
echo "Has seleccionado Historial de rutas visitadas. Selecciona una opción"
echo "1. Mostrar historial"
echo "2. Borrar historial"
echo "3. Volver atrás "
read -p "" nav7

case "$nav7" in

	1)
		cat ~/.bash_history

	;;
	2)
		read -p "¿ESTÁS SEGURO? (Y/N)" confirmation
		if [ "$confirmation" == "Y" ]; then 
			> ~/.bash_history
			echo "Historial borrado correctamente"

		elif [ "$confirmation" == "N" ]; then
			echo "Cancelando proceso... "
		else
			echo "Opción inválida, cancelando proceso... "
		fi
	;;
	3)
		navegacion
	;;
	*)
		echo "Opción inválida"
	;;
esac
}

navegacion18(){
echo "================================================================"
echo "Has seleccionado Listar contenido con filtros avanzados. Selecciona una opción"
echo "1. Listar por tamaño"
echo "2. Listar por fecha"
echo "3. Filtrar por texto"
echo "4. Ver solo archivos"
echo "5. Volver atrás "
read -p "" nav8

case "$nav8" in

	1)
		ls -lhS
	;;
	2)
		ls -t
	;;
	3)
		read -p "¿Qué texto quieres buscar?" texto
		grep -rli "$texto" .
	;;
	4)
		find . -maxdepth 1 -type f
	;;
	5)
		navegacion
	;;
	*)
		echo "Opción inválida"
;;
esac
}

navegacion(){
echo "================================================================"
echo "Has seleccionado navegación por el sistema de archivos. Selecciona una opción: "
echo "1. Mostrar información del directorio actual"
echo "2. Cambiar de directorio"
echo "3. Navegación guiada en árbol"
echo "4. Buscar archivos o directorios"
echo "5. Calcular tamaños de carpetas"
echo "6. Crear / renombrar / eliminar elementos"
echo "7. Historial de rutas visitadas"
echo "8. Listar contenido con filtros avanzados"
echo "9. Volver al menu principal "
read -p "" nav
	case "$nav" in
	1)
	navegacion11
;;
	2)
	navegacion12
;;
	3)
	navegacion13
;;
	4)
	navegacion14
;;
	5)
	navegacion15
;;
	6)
	navegacion16
;;
	7)
	navegacion17
;;
	8)
	navegacion18
;;
	9)
	menuprincipal
;;
	*)
	 	echo "Opción inválida"
;;
esac
}

gestion3(){
	echo "================================================================"
	echo "Has escogido Copiar archivos o directorios completos. Selecciona una opción:"
	echo "1. Copiar un archivo con otro nombre"
	echo "2. Copiar archivos a otra carpeta"
	echo "3. Copiar carpetas completas conservando la estructura"
	echo "4. Realizar copias con indicación de progreso (opción avanzada)"
	read -p "5. Volver al menú anterior" gest3

	case "$gest3" in
	1)
		read -p "Selecciona el nombre del archivo original (Con la extensión): " viejo
		read -p "Selecciona el nuevo nombre del archivo (Con la extensión): " nuevo
		cp "$viejo" "$nuevo"
	;;
	2)
		read -p "Selecciona el nombre del archivo (Con la extensión): " file
		read -p "Escribe la ruta a la que quieres copiar el archivo (Ejemplo: home/desktop/ejemplo): " folder
		cp -R "$file" "$folder"
	;;
	*)
		echo "Opción no válida"
;;
esac
}
gestion2(){
	echo "================================================================"
	echo "Has escogido Renombrar archivos o carpetas. Selecciona una opción:"
	echo "1. Renombrar un archivo"
	echo "2. Renombrar una carpeta"
	echo "3. Comprobar que el archivo o carpeta existe"
	read -p "4. Volver al menú anterior" gest2

	case "$gest2" in
	1)
		read -p "Indica el nombre del archivo (con la extensión) " viejo
		read -p "Indica el nombre nuevo (también con la extensión) " nuevo
		mv "$viejo" "$nuevo"	
	;;
	2)
		read -p "Indica el nombre del carpeta (Puedes indicar la ruta de una carpeta si no esta en la ruta actual)" viejo
		read -p "Indica el nuevo nombre (Puedes indicar la ruta de una carpeta si no esta en la ruta actual)" nuevo
		mv "$viejo" "$nuevo"
	;;
	3)
		read -p "Indica el nombre de la carpeta/archivo (Si es archivo tiene que ser con la extension.) " file
		
			if [ -d "$file" ]
			then
   				echo "El directorio ${file} existe"
			else
   				echo "El directorio ${file} no existe"
			fi
	;;
	4)
		gestion
	;;
	*)
		echo "Opción inválida"
;;	
esac
}

gestion1(){
	echo "================================================================"
	echo "Has escogido crear archivos. Selecciona una opción:"
	echo "1. Crear un archivo vacío"
	echo "2. Añadir texto a un archivo existente"
	read -p "3. Volver al menú anterior" gest1

	case "$gest1" in
	1)
		read -p "Nombra el archivo (con la extensión)" file
		touch "$file"
	;;
	2)
		read -p "Selecciona el archivo que quieres modificar: "  file
		if [ -f "$file" ]; then
   			echo "El archivo "$file" existe. Escribe lo que quieras y luego presiona CTRL + C."
			echo "Si quieres cambiar de línea presiona ENTER."
			cat > "$file"
		else
   			echo "El archivo "$file" no existe."
		fi
	;;
	3)
		gestion
	;;
	*)
		echo "Opción inválida"
;;
esac
}

gestion(){
	echo "================================================================"
	echo "Has escogido Gestión y manipulación de archivos. Selecciona una opción:"
	echo "1. Crear archivos"
	echo "2. Renombrar archivos o carpetas"
	echo "3. Copiar archivos o directorios completos"
	echo "4. Mover archivos o carpetas"
	echo "5. Eliminar archivos, carpetas vacías o árboles completos"
	echo "6. Verificar existencia y tipo de archivos o directorios"
	echo "7. Comparar archivos"
	echo "8. Buscar y reemplazar texto dentro de archivos"
	read -p "9. Volver al menú principal " gest

		case "$gest" in
		1)
			gestion1
		;;
		2)
			gestion2
		;;
		3)
			gestion3
		;;
		4)
			gestion4
		;;
		5)
			gestion5
		;;
		6)
			gestion6
		;;
		7)
			gestion7
		;;
		8)
			gestion8
		;;
		9)
			menuprincipal
		;;
		*)
			echo "Opción invalida"
;;
esac
}

visualizacion1(){
echo "================================================================"
echo "Has escogido Visualizar contenido de un archivo. Selecciona una opción:"
echo "1. Mostrar contenido completo"
echo "2. Mostrar primeras n líneas"
read -p "3. Volver atrás " vis1

	case "$vis1" in
		1)
			read -p "Escribe la ruta del archivo que quieres mostrar: " file
			cat "$file" 
		;;
		2)
			read -p "Escribe la ruta del archivo que quieres mostrar: " file
			read -p "¿Cuántas líneas quieres ver del archivo?" num
			head -n "$num" "$file"
		;;
		3)
			visualizacion
		;;
		*)
			echo "Opción invalida"
;;
esac
}
visualizacion2(){
echo "================================================================"
echo "Has escogido Estadísticas y conteo. Selecciona una opción:"
echo "1. Contar líneas"
echo "2. Contar palabras"
echo "3. Contar caracteres"
read -p "4. Volver atrás " vis2

	case "$vis2" in
		1)
		read -p "Escribe la ruta del archivo del que quieres contar las líneas " count
		wc -l "$count"
		;;
		2)
		read -p "Escribe la ruta del archivo del que quieres contar las palabras " count
		wc -w "$count"
		;;
		3)
		read -p "Escribe la ruta del archivo del que quieres contar los caracteres " count
		wc -m "$count"
		;;
		4)
		visualizacion
		;;
		*)
		echo "Opción inválida"
;;
esac
}
visualizacion3(){
	echo "================================================================"
	echo "Has escogido ordenar información. Selecciona una opción:"
	echo "1. Ordenar alfabéticamente"
	echo "2. Eliminar duplicados"
	echo "3. Contar duplicados"
	read -p "4. Volver atrás" vis3

	case "$vis3" in
	1)
		read -p "Escribe la ruta del archivo el cual quieras ordenas alfabéticamente " sort
		sort "$sort"
	;;
	2)
		read -p "Escribe la ruta del archivo el cual quieras eliminar duplicados" del
		sort "$del" | uniq > resultado.txt
		echo Se ha creado un nuevo archivo llamado "resultado.txt con el resultado esperado"
	;;
	3)
		read -p "Escribe la ruta del archivo donde quieras contar duplicados" count
		comando=$(sort "$count" | uniq -d | wc -l)
		echo "Hay un total de $comando duplicados"
		sort "$count" | uniq -d
	;;
	4)
	visualizacion
	;;
	*)
	echo "Opción inválida"
;;
esac
}

visualizacion4(){
	echo "================================================================"
	echo "Has escogido Extraer o filtrar datos. Selecciona una opción:"
	echo "1. Extraer columnas específicas"
	echo "2. Filtrar líneas por texto"
	read -p "3. Volver atrás " vis4

	case "$vis4" in

	1)
		read -p "Escribe la ruta donde extraeremos los datos" file
		read -p "Escriba el número de la columna a extraer " column
		echo "La columna que ha extraído: " 
		cut -d ' ' -f "$column" "$file"
	;;
	2)
		read -p "Escribe la ruta donde filtraremos líneas por texto" file
		read -p "Escribe el texto a filtrar" text
		grep "$text" "$file"
	;;
	3)
		visualizacion
	;;
	*)
		echo "Opción inválida"
;;
esac
}

visualizacion5(){
	echo "================================================================"
	echo "Ha escogido Transformar texto. Selecciona una opción:"
	echo "1. Convertir mayúsculas/minúsculas"
	echo "2. Eliminar caracteres"
	echo "3. Sustituir patrones"
	read -p "4. Volver atrás " vis4

	case "$vis4" in

	1)
		read -p "Escribe la ruta del archivo que quieras convertir su texto de mayúsculas a minúsculas o viceversa: " file
		read -p "¿De minúscula a mayúscula (1) o de mayúscula a minúscula (2)" opt
		if [ "$opt" -eq 1 ]; then
			tr '[:lower:]' '[:upper:]' < "$file" > nuevoArchivo.txt
			echo "Se a tenido que crear un nuevo archivo en el mismo directorio con los cambios hechos"
		elif [ "$opt" -eq 2 ]; then
			tr '[:upper:]' '[:lower:]' < "$file" > nuevoArchivo.txt
			echo "Se a tenido que crear un nuevo archivo en el mismo directorio con los cambios hechos"
		fi
	;;
	2)
		read -p "Escribe la ruta del archivo del cual quieras eliminar caracteres" file
		read -p "Escribe el o los caracteres que quieras eliminar" del
		tr -d "$del" < "$file" > nuevoArchivo.txt
		echo "Se a debido crear un nuevo archivo en el mismo directorio con los cambios hechos"
	;;
	3)
		read -p "Escribe la ruta del archivo " file
		read -p "Escribe el patrón a sustituir" pattern
		read -p "Escribe por cual texto se reemplazara" replace
		sed -i "s/"$pattern"/"$replace"/g" "$file"
		echo "Cambios realizados correctamente"
	;;
	4)
		visualizacion
	;;
	*)
		echo "Opción inválida"
;;
esac
}

visualizacion(){
	echo "================================================================"
	echo "Has escogido Visualización y manipulación de archivos. Selecciona una opción:"
	echo "1. Visualizar contenido de un archivo."
	echo "2. Estadísticas y conteo."
	echo "3. Ordenar información."
	echo "4. Extraer o filtrar datos."
	echo "5. Transformar texto."
	read -p "6. Volver al menú principal." vis

	case "$vis" in

	1)
	visualizacion1
	;;
	2)
	visualizacion2
	;;
	3)
	visualizacion3
	;;
	4)
	visualizacion4
	;;
	5)
	visualizacion5
	;;
	6)
	menuprincipal
	;;
	*)
	echo "Opción inválida"
;;
esac
}

usuarios1(){
	echo "================================================================"
	echo "Has seleccionado Información del usuario. Selecciona una de estas opciónes:"
	echo "1. Ver usuario actual"
	echo "2. Ver grupos asociados"
	read -p "3. Volver atrás" usr1

	case "$usr1" in
		1)
			whoami
		;;
		2)
			groups
		;;
		3)
			usuarios
		;;
		*)
		echo "Opción inválida"
;;
esac
}

usuarios2(){
	echo "================================================================"
	echo "Has seleccionado Permisos de archivos. Selecciona una de estas opciónes:"
	echo "1. Mostrar permisos actuales"
	echo "2. Cambiar permisos"
	read -p "3. Volver atrás " usr2

	case "$usr2" in
	1)
		read -p "Indique la ruta del archivo que quiera comprobar" file
		ls -l "$file"
	;;
	2)
		read -p "Indique la ruta del archivo que quiera cambiar los permisos" file
		read -p "Indique los permisos que le quiere agregar a ese archivo (Por ejemplo: 777 para dar permisos de rwx a todos los usuarios, 755 para dar permisos de rwx al propietario y solo r x a los demas, etc...)" perm
		
		if [ -f "$file" ]; then
			chmod -v "$perm" "$file"
			echo "Los cambios han sido realizados y se a generado un mensaje de diagnóstico"
		else
			echo "El archivo no existe y se va a cancelar este proceso"
		fi

	;;
	3)
	usuarios
	;;
	*)
	echo "Opción inválida"
;;
esac
}

usuarios3(){
	echo "================================================================"
	echo "Has seleccionado Propietarios y grupos. Selecciona una de estas opciónes:"
	echo "1. Ver propietario actual"
	echo "2. Cambiar propietario"
	echo "3. Cambiar grupo"
	read -p "4. Volver atrás " usr3

	case "$usr3" in
		1)
			read -p "Indica la ruta del archivo que quiera comprobar su propietario" file
			ls -l "$file"
		;;
		2)
			read -p "Indique la ruta del archivo que quiera cambiar de propietario" file
			read -p "Indique el usuario que será propietario del archivo" usr
			if [ -f "$file" && id "$usr" ]; then
			chown "$usr" "$file"
			echo "Los cambios han sido realizados"
			else
			echo "No se ha podido encontrar el archivo o el usuario, por favor revisa los carácteres e inténtelo de nuevo."
			fi
		;;
		3)
			read -p "Indique el usuario que quiera cambiar de grupo" usr
			read -p "Indique el grupo al que quiere meter ese usuario" group
			adduser "$usr" "$group"
			echo "El usuario "$usr" ha sido movido al grupo "$group" con éxito"
		;;

		4)
		usuarios
		;;
		*)
		echo "Opción inválida"
;;
esac
}

usuarios4(){
	echo "================================================================"
	echo "Has seleccionado Gestión básica de cuentas. Selecciona una opción:"
	echo "1. Crear usuario"
	echo "2. Crear grupo"
	echo "3. Añadir usuario a un grupo"
	read -p "4. Volver atrás" usr4

	case "$usr4" in

	1)
	
	;;

	2)

	;;

	3)

	;;

	4)
	usuarios
	;;
	*)
	echo "Opción inválida"
;;
esac	
}

usuarios(){
	echo "================================================================"
	echo "Has seleccionado Usuarios, grupos y permisos. Selecciona una de estas opciónes:"
	echo "1. Información del usuario"
	echo "2. Permisos de archivos"
	echo "3. Propietarios y grupos"
	echo "4. Gestión básica de cuentas"
	read -p "5. Volver al menú principal " usr

	case "$usr" in
		1)
			usuarios1
		;;
		2)
			usuarios2
		;;
		3)
			usuarios3
		;;
		4)
			usuarios4
		;;
		5)
			menuprincipal
		;;
		*)
		echo "Opción inválida"

	;;
	esac
}

menuprincipal(){
echo "================================================================"
echo "Escoge una opción"
echo "1. Navegación por el sistema de archivos"
echo "2. Gestión y manipulación de archivos"
echo "3. Visualización y procesamiento de datos"
echo "4. Usuarios, grupos y permisos"
echo "5. Procesos y control del sistema"
echo "6. Red, conectividad y diagnóstico"
read -p "7. Salir" op

	case "$op" in
	1)
		navegacion
	;;
	2)
		gestion
	;;
	3)
		visualizacion
	;;
	4)
		usuarios
	;;
	5)
		echo "Has elegido la opción 5"
	;;
	6)
		echo "Has elegido la opción 6"
	;;
	7)
		echo "Saliendo del menú..."
	;;
	*)
		echo "Opción inválida"
;;
esac
}

menuprincipal
