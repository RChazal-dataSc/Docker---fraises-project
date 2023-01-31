#pour utiliser une image de base (sur un repo dockerhub par défaut)
FROM debian:9

#execution de commandes linus : il va checher curl et nodejs (node java script)
RUN apt-get update -yq \
&& apt-get install curl gnupg -yq \
&& curl -sL https://deb.nodesource.com/setup_10.x | bash \
&& apt-get install nodejs -yq \
&& apt-get clean -y


#ajoute les données dans ce dossier du conteneur
ADD . /app/

#comme cd : se positionner dans le dossier de travail
WORKDIR /app

#ajoute les dépendances (npm install dans le cas de note. requirement.txt pour les librairies python, pip install)
RUN npm install


#ouvre le port 8080 pour que l'hote puisse écouter dessus (http://127.0.0.1:8080)
EXPOSE 8080

#stocker le log à cet endroit : les volumes sont des stocks à l'extérieur du conteneur :
#  il faudra renseigner une option en local lors du lancement du dockerfile
VOLUME /app/logs

#lance le conteneur : cmd = ligne de commande. execute nmp (node).
CMD npm run start