########################################PRIMERA PARTE#######################################

Usage:  docker [OPTIONS] COMMAND

A self-sufficient runtime for containers

Options:
      --config string      Location of client config files (default "/home/fascue/.docker")
  -c, --context string     Name of the context to use to connect to the daemon (overrides DOCKER_HOST env var and default context set
                           with "docker context use")
  -D, --debug              Enable debug mode
  -H, --host list          Daemon socket(s) to connect to
  -l, --log-level string   Set the logging level ("debug"|"info"|"warn"|"error"|"fatal") (default "info")
      --tls                Use TLS; implied by --tlsverify
      --tlscacert string   Trust certs signed only by this CA (default "/home/fascue/.docker/ca.pem")
      --tlscert string     Path to TLS certificate file (default "/home/fascue/.docker/cert.pem")
      --tlskey string      Path to TLS key file (default "/home/fascue/.docker/key.pem")
      --tlsverify          Use TLS and verify the remote
  -v, --version            Print version information and quit


## buscar imagenes de docker en docker hub 

## Para descargar un imagen 

$ sudo docker pull <imagen>

## Para ejecutar una imagen

$ sudo docker run <nombre de imagen>
$ sudo docker run hello-world

## Para obtener la lista de imagenes instaladas en tu maquina

$ sudo docker images
/...
REPOSITORY        TAG       IMAGE ID       CREATED         SIZE
staphb/samtools   latest    442301e8069e   3 months ago    373MB
hello-world       latest    bf756fb1ae65   12 months ago   13.3kB

## Ejecutar imagenes desde la terminal (sin hacerlo interactivo)

sudo docker run staphb/samtools samtools view --help

/...
samtools view: unrecognised option '--help'

Usage: samtools view [options] <in.bam>|<in.sam>|<in.cram> [region ...]

Options:
  -b       output BAM
  -C       output CRAM (requires -T)
  -1       use fast BAM compression (implies -b)

/...

## Ejecutar imagenes de manera interativa

sudo docker run -it staphb/samtools bash
/...

$ root@38afc77abde1:/data# 

### internamente esta corriendo el programa samtools dentro un OS ubuntu


## Una vez ejecutada un contenedor se puede ver si estan en ejecucion de segundo plano o fueron detenidos

sudo docker ps ## activos
/...
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES

sudo docker ps -a ## detenidos
/...
ONTAINER ID   IMAGE             COMMAND                  CREATED         STATUS                          PORTS     NAMES
38afc77abde1   staphb/samtools   "bash"                   4 minutes ago   Exited (0) About a minute ago             epic_borg
b695af7343f4   staphb/samtools   "samtools view --help"   6 minutes ago   Exited (1) 6 minutes ago                  vigilant_austin
7e8463b189ba   staphb/samtools   "samtools view"          6 minutes ago   Exited (1) 6 minutes ago                  brave_kowalevski

sudo docker ps -aq ## solo los codigos para poder deterner o eliminar los contenedores
/...
38afc77abde1
b695af7343f4
7e8463b189ba

### tambien se pueden volver a reiniciar las imagenes detenidas

sudo docker start 38a ## "bash" interativo (los que no tienen interatividad no se iniciaran al ser un proceso especifico o momentaneo)

sudo docker stop 38a ## tambien se puede detener los contenedores otorgandole una lista

### Para ejecutar un servidor nginx

sudo docker run -p 80:80 nginx ## con este comando se bloquea la terminal 

sudo docker run -p 80:80 -d nginx ## detach (en segundo plano)


## para eliminar los diferentes contenedores otorgandoles una lista

sudo docker rm $(sudo docker ps -aq)

sudo docker rm $(sudo docker ps -aq) -f ## para forzar el borrado

########################################SEGUNDA PARTE#######################################

sudo docker run -p 80:80 -d --name "servidor" nginx ## para renombrar el contenedor

sudo docker run -p 80:80 -p 3000:80 -d --name "servidores" nginx ## para ejecutar varios servidores en un solo contenedor

## remover images 

sudo docker rmi <images> ## remover imagenes con los ID que se observar en "docker ps"


## Para copiar archivos de tu maquina al contenedor y viceversa
### volumes     

sudo docker run -v `pwd`:/data -it staphb/samtools bash  ## para montar en la direccion de la imagen la ubicacion actual
                                                        ### una vez montado copiara los archivos en pwd dentro del contenedor
sudo docker run -v $(pwd):/data -it staphb/samtools bash ## puede hacer lo mismo opcionalmente


