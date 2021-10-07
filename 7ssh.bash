### internet 
# OSI MODEL 
#1 Physical Layer
    #hardware componet (cables)
#2 Data Link Layer 
    #Transferencia de informacion
    # {Tarjetas de red} y la {direccion MAC}
    # desconfigurar internet (NetworkManager)
    sudo systemctl stop NetworkManager.service
    # Apagar nuestra tarjeta de red
    sudo ip l s enp1s0 down  
#3 Network Layer 
    # IP (protocolo de internet numero de 32 bits) / LAN (red de area local)
    # IP (4 partes de 8 bits representado con numeros decimales)
    # Mask (numero de 32 bits 111111111111111111111111 00000000  24(1) / 8(0) mascara 24)
    # IP + Mask = IP de la red 

#4 Transport Layer 
    # tabla de enrutamiento (Router)
    # NAT (NETWORK ADDRESS TRANSLATION -- asociar IP publica con IP privada)
    # DNS (DOMAIN NAME SYSTEM / Servidor DNS contiene una tabla con la direcciones de paginas asociadas a IP´s)
    # TCP (TRANSMISSION CONTROL PROTOCOL > ssh: 22; )
#5 Session layer
    # 

#6 Presentation Layer
    #

#7 Application Layer 


# Configuracion internet en LINUX
# Encender tarjeta de red 
ip address                               # optenemos el nombre de tarjeta 
ip link set dev enp1s0 up                # encendemos la tarjeta de red 
ip address add 192.168.1.2/24 dev enp1s0 # asginar una direccion IP
ping 192.168.1.1                         # regresa conexion del router
ip route add default via 192.168.1.1     # añade un puerto por defecto para conectarse a internet
vim /etc/resolv.config                   # configurar servidor DNS

### montar un servidor en casa 

loopback

#### activar y desactivar el network manger

sudo sytemctl unmask NetworkManager.service

sudo sytemctl enable NetworkManager.service

sudo sytemctl start NetworkManager.service


sudo sytemctl disable NetworkManager.service

sudo sytemctl mask NetworkManager.service

sudo sytemctl stop NetworkManager.service



### reaver

sudo apt-get install reaver

nmcli -f ALL dev wifi

sudo reaver -i wlp2s0 -b E8:DE:27:BF:FF:5C
















ssh -X fascue@200.123.25.26 -p 4428
ssh -X tesista3@172.16.22.70 
ssh -X biotecanimal@172.16.22.83 -p 4428
s
scp -P 4428 fascue@200.123.25.26:/path/to/retrive_file/ /path/to/export_file

scp -P 2322 file.txt remote_username@10.10.0.2:/remote/directory 


#############PRIMERA PARTE ###############################################

TELNET VS SSH 

### lo malo del telnet es inseguro
### ssh le da doble candado al protocolo de transmision 

#instalacion

apt-get install openssh-server

ssh usuario@ipserver 
	## la primera vez te pregunta la finger print al server

##  esto se ejecuta en tu maquina

ssh-keygen ## crea un id publico 

cat .ssh/id_rsa.pub ## copiamos el id publico que sale en la consola


### entramos al servidor 

shh usuario@ipserver 

vim .ssh/authorized_keys ## pegamos el id publico aqui 

# depues de para logearte al servidor la proxima vez no es necesario 


############################ SEGUNDA PARTE ##########################################


### como copiar key_publica al servidor mas rapida 
## desde nuestra maquina

ssh-copy-id usuario@ipserver 

### cotraseña : ......
## si hacen esto el key_publica rapido 

### usar como cliente de chat 

ssh -t usuario@ipserver irssi

### bloqueo de paginas, usar ssh como proxy para navegador

ssh -D 9999 usuario@ipserver

### si quieres ejecutar los programas del servidor en mi maquina

ssh -X usuario@ipserver

#### 

ssh -L 2020:ipserver2 usuario@ipserver1 



ssh -R 2020:localhost:22 root@ipexterno 

## add user a sudo group

usermod -aG sudo newuser

## Verify cloud manager 

sudo nano /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg

## Network configuration /etc/netplan/01-netcfg.yaml


network:
  version: 2
  renderer: networkd
  ethernets:
    ens3:
      dhcp4: no
      addresses:
        - 192.168.121.221/24
      gateway4: 192.168.121.1
      nameservers:
          addresses: [8.8.8.8, 1.1.1.1]


############ 
ip link

sudo netplan apply
ip addr show dev ens3

