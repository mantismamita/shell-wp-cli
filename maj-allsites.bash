#!/usr/bin/env bash

# changer les noms et chemins des sites selon le serveur

declare -a sites=('/srv/www/wp1/htdocs' '/srv/www/wp2/htdocs' )
cd
for site in "${sites[@]}";
do
wp --path=$site core update --debug
done