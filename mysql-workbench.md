### Installation MYSQL-WB 

download `deb` from : [mysql-workbench](https://dev.mysql.com/downloads/workbench/)

`(mysql-workbench-community_8.0.36-1ubuntu22.04_amd64.deb)`

```bash
cd /path/to/download/deb

### install 
sudo dpkg -i mysql-workbench-community_8.0.36-1ubuntu22.04_amd64.deb

### Lib's dependency
sudo apt install libatkmm-1.6-1v5 libglibmm-2.4-1v5 libgtkmm-3.0-1v5 libmysqlclient21 libproj22

### fix - problems
sudo apt --fix-broken install
```

## Error in KDE-plama desktop

### install polkit / restart polkit 
```
sudo apt-get install policykit-1

sudo systemctl start polkit

## restart if persist error's
sudo systemctl restart polkit
```

### install  gnome-keyring

```
sudo apt install gnome-keyring
```





