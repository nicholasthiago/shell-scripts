#!/bin/bash -exp
#developer  : Nicholas Thiago Costa | Prometheus Systems
#created    : 06/05/2021


#### VARIABLES ########################################################

SECONDS=0

endMsg=()

cmtMsg=()

gitDir="/home/dev-03/github/"

repos=(
	'erp_cloud_main'
	'uselimp_plataform'
	'prometheus_web_app_auth'
	'pay_support_first_plataform'
	'food_delivery_app_plataform'
)

#### FUNCTIONS ########################################################

## loop through repos, running git fetch and git pll commands
for repo in ${repos[@]}
	do
		clear

		printf "\n fetching and updating repo : [ ${repo} ] \n \n"

		git -C "${gitDir}${repo}/" stage --all

		cmtMsg+="\n - ${repo} : \n $( git -C "${gitDir}${repo}/" commit -s -m "${repo} updated" 2>&1 ) \n"

		endMsg+="\n - ${repo} : \n $( git -C "${gitDir}${repo}/" push 2>&1 ) \n"

	done

clear

## print finale status message [ SUCCESS | ERROR ]
printf "\n repositories update status \n"

for msg in ${cmtMsg[@]}
	do
		printf " ${msg}"
	done

for msg in ${endMsg[@]}
	do
		printf " ${msg}"
	done


#### TIME ELAPSED #####################################################

## conclusion message & time elapsed for shell script
elapsed="\n time elapsed : $((($SECONDS / 60) % 60)) min $(($SECONDS % 60)) secs \n"

printf "${elapsed} \n"

#### SHELL FINISHED ###################################################