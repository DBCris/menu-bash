# Menú de administración de Linux en Bash

Script interactivo en Bash que agrupa en un único menú las tareas más habituales de administración de un sistema Linux desde la terminal. Lo desarrollé como proyecto de clase para practicar scripting, comandos del sistema y gestión de usuarios, procesos y red.

## Qué hace

El menú principal ofrece seis bloques, cada uno con sus submenús:

| Bloque | Qué permite hacer |
| --- | --- |
| **Navegación por el sistema de archivos** | Ver la ruta actual, listar contenido (detallado, ocultos, por tamaño o fecha), cambiar de directorio, mostrar el árbol de carpetas, buscar archivos, calcular tamaños y gestionar el historial. |
| **Gestión y manipulación de archivos** | Crear, renombrar, copiar (incluida copia con progreso mediante `rsync`), mover y eliminar archivos y carpetas, comparar archivos y buscar y reemplazar texto. |
| **Visualización y procesamiento de datos** | Ver contenido, contar líneas, palabras y caracteres, ordenar, eliminar duplicados, extraer columnas, filtrar por texto y transformar texto. |
| **Usuarios, grupos y permisos** | Consultar el usuario y sus grupos, ver y cambiar permisos (`chmod`), cambiar propietario y grupo (`chown`), crear usuarios y grupos. |
| **Procesos y control del sistema** | Consultar y finalizar procesos, monitorizar CPU y memoria, y gestionar servicios con `systemctl` (estado, iniciar, detener, reiniciar). |
| **Red, conectividad y diagnóstico** | Ver IP, interfaces y rutas, comprobar conectividad (`ping`), consultar dominios (`nslookup`), ver puertos abiertos, descargar archivos (`wget`) y probar conexión con un servidor (`telnet`). |

Las acciones más delicadas, como borrar una carpeta con su contenido o el historial, piden confirmación antes de ejecutarse.

## Requisitos

- Linux con Bash.
- Utilidades que usa el script: `tree`, `rsync`, `wget`, `telnet`, `nslookup`, `netstat`, `killall`, `ip` y `systemctl`. En Debian o Ubuntu se instalan con `sudo apt install tree rsync wget telnet dnsutils net-tools psmisc`; en Arch y derivadas, con `sudo pacman -S tree rsync wget inetutils bind net-tools psmisc`.
- Algunas opciones (crear usuarios y grupos, cambiar propietarios, gestionar servicios) necesitan permisos de administrador, así que hay que ejecutarlo con `sudo`.

## Uso

```bash
git clone https://github.com/DBCris/menu-bash.git
cd menu-bash
chmod +x cristianDavidMenu.sh
./cristianDavidMenu.sh
```

Para las opciones que lo requieren, ejecútalo como `sudo ./cristianDavidMenu.sh`.

## Aviso

Algunas opciones modifican el sistema de forma real (borrar archivos, cambiar permisos, crear usuarios, detener servicios o finalizar procesos). Conviene probarlo primero en una máquina virtual o en un directorio de pruebas.

## Qué aprendí

- Estructurar un script largo con funciones y menús anidados.
- Usar `case`, condicionales y lectura de datos con `read`.
- Combinar utilidades del sistema (`find`, `grep`, `sed`, `sort`, `uniq`, `cut`, `tr`, `du`, `ps`, `ip`) en tareas reales.
- Trabajar con usuarios, permisos y servicios en Linux.

## Mejoras pendientes

- Validar mejor las entradas del usuario y los errores de los comandos.
- Comprobar al inicio que las utilidades necesarias están instaladas.
- Añadir más opciones de red y de gestión de servicios.

## Autor

Cristian David Anghel — estudiante de Desarrollo de Aplicaciones Web (DAW).
