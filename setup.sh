#!/bin/sh

THEME="twentysixteen"
CHILD="twentysixteen-child"

# j'enleve les articles d'example
wp post delete 1
wp post delete 2
wp theme delete twentytwelve
wp theme delete twentythirteen
wp theme delete twentyfourteen
wp theme install twentysixteen --activate

#permaliens
wp rewrite structure "/%postname%/" --hard
wp rewrite flush --hard

curl http://loripsum.net/api/5 | wp post generate --post_content --count=5

wp post create --post_type=page --post_title='Accueil' --post_status=publish
wp post create --post_type=page --post_title='Blog' --post_status=publish
wp post create --post_type=page --post_title='Contact' --post_status=publish

# provenant de https://www.service-public.fr/professionnels-entreprises/vosdroits/F31228
wp post create --post_type=page --post_title='Mentions Légales' --post_status=publish --post_content="Tous les sites internet édités à titre professionnel, qu'ils proposent des ventes en ligne ou non, doivent obligatoirement indiquer les mentions légales suivantes :

pour un entrepreneur individuel : nom, prénom, domicile
pour une société : raison sociale, forme juridique, adresse de l'établissement ou du siège social (et non pas une simple boîte postale), montant du capital social
adresse de courrier électronique et numéro de téléphone
pour une activité commerciale : numéro d'inscription au registre du commerce et des sociétés (RCS)
pour une activité artisanale : numéro d'immatriculation au répertoire des métiers (RM)
en cas d'activité commerciale : numéro individuel d'identification fiscale numéro de TVA intracommunautaire
pour une profession réglementée : référence aux règles professionnelles applicables et au titre professionnel
nom et adresse de l'autorité ayant délivré l'autorisation d'exercer quand celle-ci est nécessaire
nom du responsable de la publication
coordonnées de l'hébergeur du site : nom, dénomination ou raison sociale, adresse et numéro de téléphone
pour un site marchand, conditions générales de vente (CGV) : prix (exprimé en euros et TTC), frais et date de livraison, modalité de paiement, service après-vente, droit de rétractation, durée de l'offre, coût de la technique de communication à distance
numéro de déclaration simplifiée Cnil, dans le cas de collecte de données sur les clients (non obligatoire, mais recommandé).
Avant de déposer ou lire un cookie, les éditeurs de sites ou d'applications doivent :

informer les internautes de la finalité des cookies,
obtenir leur consentement,
fournir aux internautes un moyen de les refuser.
La durée de validité de ce consentement est de 13 mois maximum. Certains cookies sont cependant dispensés du recueil de ce consentement.

Le manquement à l'une de ces obligations peut être sanctionné jusqu'à un an d'emprisonnement, 75 000 € d'amende pour les personnes physiques et 375 000 € pour les personnes morales.

  À savoir :
dans le cas d'un site non commercial ou d'un blog d'un particulier, les mentions légales doivent indiquer les nom, prénom, adresse et numéro de téléphone du créateur du site et de l'hébergeur."



wp menu create "Menu Principal"
wp menu item add-post menu-principal 6
wp menu item add-post menu-principal 7
wp menu item add-post menu-principal 8
wp menu item add-post menu-principal 9
wp menu location assign "Menu principal" primary

wp scaffold child-theme "$CHILD" --parent_theme="$THEME" --activate

cd wp-content/themes/"$CHILD"
git init
git add .
git commit -m "Initial commit"




