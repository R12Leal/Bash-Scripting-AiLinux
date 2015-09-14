#! /bin/bash
# Función que realiza las tareas pertinentes.
function ailinux(){
  # Variables.
  let proc=9
  s_null="/dev/null"
  current_user=$(whoami)
  # Texto de introducción.
  echo "================================================================================"
  echo -e " Bienvenido \e[1;34m"$current_user"\e[0m - Script Bash de instalación de recursos básicos tras la "
  echo " instalación de Sistemas Operativos GNU/Linux basados en Debian (Ubuntu - Mint) "
  echo "================================================================================"
  # Indicamos al usuario que comenzamos las tareas.
  echo
  echo "[Realizando tareas, espere un momento por favor...]"
  echo
  echo "Procesos restantes: "$proc
  # Tareas.
  #
  add-apt-repository -y ppa:tualatrix/ppa &> $s_null #
  let "proc -= 1"
  echo "Procesos restantes: "$proc
  #
  apt-get update &> $s_null #
  let "proc -= 1"
  echo "Procesos restantes: "$proc
  #
  apt-get upgrade -y &> $s_null #
  let "proc -= 1"
  echo "Procesos restantes: "$proc
  #
  apt install ubuntu-restricted-extras -y &> $s_null #
  let "proc -= 1"
  echo "Procesos restantes: "$proc
  #
  apt install rar unace p7zip-full p7zip-rar sharutils mpack arj &> $s_null #
  let "proc -= 1"
  echo "Procesos restantes: "$proc
  #
  apt install synaptic &> $s_null #
  let "proc -= 1"
  echo "Procesos restantes: "$proc
  #
  apt install aptitude &> $s_null #
  let "proc -= 1"
  echo "Procesos restantes: "$proc
  #
  apt install ubuntu-tweak &> $s_null #
  let "proc -= 1"
  echo "Procesos restantes: "$proc
  #
  apt-get autoremove -y &> $s_null #
  let "proc -= 1"
  echo "Procesos restantes: "$proc
  # Indicamos al usuario que hemos finalizado las tareas.
  echo
  echo "[Tareas finalizadas con éxito]"
  echo
  # Liberamos Variables.
  proc=
  s_null=
  current_user=
}
# Limpiamos terminal de comandos ejecutados anteriormente.
clear
# Comprobamos que el fichero Bash ha sido ejecutado como SuperUsuario - root.
# En caso FALSE informamos al usuario de que ejecute de nuevo como root.
# En caso TRUE se llama a la función AiLinux.
if [ "$(id -u)" != "0" ]; then
   echo
   echo "============================================================================"
   echo "¡Este Script debe ejecutarse como SuperUsuario!" 1>&2
   echo "============================================================================"
   echo
    exit 1
else
  ailinux
    exit 1
fi
