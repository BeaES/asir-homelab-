# Auditoría básica de seguridad con Nmap

Proyecto de laboratorio en Ubuntu para realizar una auditoría básica de seguridad sobre un servidor Linux usando Nmap.

## Objetivo

Identificar servicios activos, puertos abiertos y posibles riesgos de una máquina objetivo en un entorno controlado.

## Entorno

* Máquina atacante: Ubuntu con Nmap
* Máquina objetivo: servidor Linux
* Red: laboratorio virtual en VirtualBox

## Desarrollo

Durante la configuración inicial hubo un problema de conectividad entre las máquinas, ya que las IP estaban asociadas a interfaces distintas. Tras corregir la configuración de red y dejar ambas máquinas en la misma subred, la comunicación fue posible.

A partir de ahí se realizaron varias pruebas con Nmap:

* comprobación de conectividad
* escaneo SYN
* detección de servicios y versiones
* detección del sistema operativo
* escaneo completo de puertos

## Resultados

Se detectaron tres puertos abiertos en la máquina objetivo:

* 21 → FTP
* 22 → SSH
* 80 → HTTP

Los servicios identificados fueron:

* vsftpd
* OpenSSH
* Apache HTTP Server

También se identificó que la máquina objetivo ejecutaba Linux.

## Análisis

A partir de los resultados se valoraron los riesgos principales:

* FTP: credenciales en texto plano y acceso no autorizado
* SSH: fuerza bruta o contraseñas débiles
* HTTP: exposición de servicios web y posibles vulnerabilidades

## Medidas propuestas

* Deshabilitar servicios innecesarios, especialmente FTP si no se utiliza
* Configurar firewall para permitir solo los puertos necesarios
* Mantener el sistema actualizado
* Reforzar SSH con autenticación segura y restricciones de acceso

## Evidencias

### Conectividad entre máquinas

![Conectividad](iasir-homelab-/magenes/01-ping.png)

### Escaneo SYN

![Escaneo SYN](imagenes/02-escaneo-syn.png)

### Detección de servicios y versiones

![Servicios y versiones](imagenes/03-servicios-versiones.png)

### Detección del sistema operativo

![Detección SO](imagenes/04-deteccion-so.png)

### Escaneo completo de puertos

![Escaneo completo](imagenes/05-escaneo-completo.png)

## Tecnologías utilizadas

* Ubuntu
* Nmap
* VirtualBox

## Resultado final

La práctica permitió identificar los servicios expuestos en el servidor y plantear medidas básicas para reducir la superficie de ataque y mejorar la seguridad del sistema.
