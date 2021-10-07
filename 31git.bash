########################################PRIMERA PARTE#######################################
git version

git config --global user.name "Francisco Ascue"
git config --global user.email "francisco.ascue131@gmail.com"

git config --list ### ver configuraciones

git init ## 
	vim .gitignore / filename.ext
	
### staging area 

git status # nos muestra el estado

git add -A ## agrega todos lo archivos
	git add myfile.txt # agrega file especificos

git rm --cached file.ext # remueve al archivo de stagin area

## repositorio local

git commit -m "comentario" ## agrega un comentario 
 # añade los archivos en el repositorio

### desde un repositorio remoto en la nube

git clone https://github.com/FranciscoAscue/allgenome.git

	git log 
	# modificamos un archivo
	git status
	git diff # miras las diferencias
	# agregamos a staging area
	git add -A
	# agregando al repositorio local
	git commit -m "asdasdasdas"

#### ahora subimos al repositorio en la nube
	
git push origin master ## subes con el branch master

git pull origin master ## para descargar la version actual

##### crear branch

git branch nuevabranch

### cambiar al nuevo branch

git checkout nuevabranch
	git status
	
git branch ### muestras todas las branch

### modificando el archivo a traves del branch
### para atualizar el repositorio

git push -u origin nuevabranch

### para ver branch locales y remotos

git branch -a

### unir branch nuevabranch a master

git checkout master ## pasamos al master branch
git pull origin master ## actualizamos el repositorio si es remoto

git branch --merged # muestra las merged anteriores
git merged nuevabranch # merged la branch actual 

git push origin master ## subimos los cambios a la nube

#### limpiar la branch

git push origin --delete nuevabranch ## borramos la branck en la nube
	git branch -a
	
git branch -d nuevabranch ### esto l borra del repositorio local


########################################SEGUNDA PARTE#######################################


### Modificamos

git status

 git checkout file.ext ## regresa a la version original
 
git add file.ext ## stagin area

git commit --amend ## permite modificar el ultimo commit

git log ## verificamos que se sobreescribe el commit anterior 

git log --stat

### cambios en la branch master a otra 

### debes copiar la commit hash (codigo de la commit) desde master

git checkout nuevabranch 

git cherry-pick "hash del commit sin doble comillas" # esto copia el commit de modo que estan en ambos

git status

### pero debemos borrar en el master el commit

git checkout master
	git log

### git reset tiene  3 opciones:
	## soft
	## mix
	## hard 

git reset --soft "has del commit" ## con esta opcion le quitamos el paso commit

git reset "has del commit" ## este el mix, o quita del area del staging area

git reset --hard "has del commit" ## deja limpo al area de trabajo




### pero podemos recupera los commit incluso despues del reset

git reflog

git diff "has original" "hash amend"



##### Trabajar en equipo con git (github)

### creas tu repositorio en github 
### si quieres puedes linkear al repositorio en tu maquina

git remote add origin git....

git log

git push -u origin master ##-u linkea el master local con el repositorio

	git push # si haces el comando anterior puedes simplemente este comando para actualiar el repositorio




#### ahora merged en el repositorio github
## cambiamos a otra branch


git checkout nuevabranch

git log

git push -u origin nuevabranch ### actualiza el nueva branch en github























####


…or create a new repository on the command line

echo "# PythonScripts" >> README.md

git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin git@github.com:FranciscoAscue/PythonScripts.git
git push -u origin main

…or push an existing repository from the command line
git remote add origin git@github.com:FranciscoAscue/PythonScripts.git
git branch -M main
git push -u origin main

…or import code from another repository
You can initialize this repository with code from a Subversion, Mercurial, or TFS project.



