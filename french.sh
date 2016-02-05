#!/bin/sh

#Je télécharge WordPress en français
wp core download --locale=fr_FR --force

#Je change la langue de l'installation et je l'active
wp core language install fr_FR --activate

wp core language activate fr_FR --debug
