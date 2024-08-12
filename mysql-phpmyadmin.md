### install mysql and phpmyadmin 

```bash
sudo apt update && sudo apt upgrade

sudo apt install mysql-server 
sudo mysql_secure_installation
``` 
##### add the password for the root user 

### authentication for root user 

```bash 

## start mysql 

sudo mysql

```

```mysql

SELECT user,authentication_string,plugin,host FROM mysql.user;

```
``` output
Output
+------------------+------------------------------------------------------------------------+-----------------------+-----------+
| user             | authentication_string                                                  | plugin                | host      |
+------------------+------------------------------------------------------------------------+-----------------------+-----------+
| debian-sys-maint | $A$005$lS|M#3K #XslZ.xXUq.crEqTjMvhgOIX7B/zki5DeLA3JB9nh0KwENtwQ4 | caching_sha2_password | localhost |
| mysql.infoschema | $A$005$THISISACOMBINATIONOFINVALIDSALTANDPASSWORDTHATMUSTNEVERBRBEUSED | caching_sha2_password | localhost |
| mysql.session    | $A$005$THISISACOMBINATIONOFINVALIDSALTANDPASSWORDTHATMUSTNEVERBRBEUSED | caching_sha2_password | localhost |
| mysql.sys        | $A$005$THISISACOMBINATIONOFINVALIDSALTANDPASSWORDTHATMUSTNEVERBRBEUSED | caching_sha2_password | localhost |
| root             |                                                                        | auth_socket           | localhost |
+------------------+------------------------------------------------------------------------+-----------------------+-----------+
5 rows in set (0.00 sec)
```

#### no accept password

```bash
SHOW VARIABLES LIKE 'validate_password%';

SET GLOBAL validate_password.length = 6;
SET GLOBAL validate_password.number_count = 0;
````

```mysql
ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY 'password';

## alternative for better performace in phpmyadmin 
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';

FLUSH PRIVILEGES;

## repet the firts command 
SELECT user,authentication_string,plugin,host FROM mysql.user;
```

##### to start mysql after write : `mysql -u root -p` in the terminal and insert the password

```bash 
### start and restart mysql service 

sudo systemctl start mysql.service
sudo service start mysql ## another optiom

/ect/init.d/mysql start # anther option and sudo permissions

### install phpmyadmin
#before to install phpmyadmin install apache:
sudo apt install apache2
sudo apt install libapache2-mod-php
# install the following

sudo apt install phpmyadmin php-mbstring php-zip php-gd php-json php-curl
``` 
select the option server apache2
and dbconfig-common Yes to config 

``` bash 
##  enable the mbstring PHP extension
sudo phpenmod mbstring
## restart apache service
sudo systemctl restart apache2
```

##### to start usign phpmyadmin go to `https://your_domain_or_IP/phpmyadmin`
##### if you work in localhost go to `http://localhost/phpmyadmin`


### Errors and some problems 

if phpmyadmin is not avaible in the link 
`http://localhost/phpmyadmin`
Yo need to add the following line in the the config file of apache
```bash
sudo vim /etc/apache2/apache.conf
```
add in the end:

`Include /etc/phpmyadmin/apache.conf`

#### php code in URL instead to PHPMyAdmin 

```bash
sudo a2enmod php8.1
## Verify if this working
```
**if exist mpm_event issue, disabled this module**  
```bash
sudo a2dismod mpm_event
sudo systemctl restart apache2
sudo a2enmod mpm_prefork
sudo systemctl restart apache2
sudo a2enmod php8.1
sudo systemctl restart apache2
```

#### Restore root user's full privileges

add the the line `skip-grant-tables` in the following file:

```bash
sudo vim /etc/mysql/mysql.conf.d/mysqld.cnf
## restart the service and logging whitout password
sudo systemctl restart mysql.service
mysql
```

```mysql
UPDATE mysql.user SET Grant_priv = 'Y', Super_priv = 'Y' WHERE User = 'root';
FLUSH PRIVILEGES;
## you could change root pass
ALTER USER 'root'@'localhost' IDENTIFIED BY 'NewPassword';

```

Then remove the line in `mysqld.cnf` and restart the service `sudo systemctl restart mysql.service`
Loggin into mysql `mysql -u root -p`

```mysql
GRANT ALL PRIVILEGES ON mysql.user TO 'root'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```





