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
		rm -r "$delfolder"
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
		history
	;;
	2)
		history -cw
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

menuprincipal(){
echo "================================================================"
echo "Escoge una opción"
echo "1. Navegación por el sistema de archivos"
echo "2. Gestión y manipulación de archivos 3."
echo "3. Visualización y procesamiento de datos"
echo "4. Usuarios, grupos y permisos"
echo "5. Procesos y control del sistema"
echo "6. Red, conectividad y diagnóstico"
echo "7. Opciones avanzadas"
echo "8. Herramientas del alumno"
read -p "9. Salir " op

	case "$op" in #Opción de navegación
	1)
		navegacion
		#Fin de opción de navegación
	;;
	2)
		echo "Has elegido la opción 2"
	;;
	3)
		echo "Has elegido la opción 3"
	;;
	4)
		echo "Has elegido la opción 4"
	;;
	5)
		echo "Has elegido la opción 5"
	;;
	6)
		echo "Has elegido la opción 6"
	;;
	7)
		echo "Has elegido la opción 7"
	;;
	8)
		echo "Has elegido la opción 8"
	;;
	9)
		echo "Saliendo del menú..."
	;;
	*)
		echo "Opción inválida"
;;
esac
}

menuprincipal
