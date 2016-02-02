#!/bin/sh

SITEURL=`wp option get siteurl | awk -F/ '{print $3}'`
NAME="$SITEURL"-`date +%d-%m-%Y`

wp db export "$NAME".sql
tar vcf "$NAME".tar ./wp-content

# ou tar zvcf monsite.tar.gz ./wp-content