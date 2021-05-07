#!/bin/bash -exp
#developer  : Nicholas Thiago Costa | Prometheus Systems
#created    : 06/05/2021

#######################################################################
#### VARIABLES ########################################################

SECONDS=0

endMsg=()

gitDir="/home/dev-03/github/"

repos=(
	'erp_cloud_main'
	'uselimp_plataform'
	'prometheus_web_app_auth'
	'pay_support_first_plataform'
	'food_delivery_app_plataform'
)


#######################################################################
#### FUNCTIONS ########################################################

## loop through repos, running git fetch and git pll commands
for repo in ${repos[@]}
	do
		clear

		printf "\n fetching and updating repo : [ ${repo} ] \n \n"

		git -C "${gitDir}${repo}/" fetch

		git -C "${gitDir}${repo}/" merge

		endMsg+="\n - ${repo} : \n $( git -C "${gitDir}${repo}/" pull origin main 2>&1 ) \n"

	done

clear

## printf " Select method: \n 0 : end shell script \n 1 : run yarn commands \n >> "
## read method

## 	if [[ "$method" -gt 0 ]]
##		then
##	fi


## loop through react-app list to run yarn [ install / upgrade / build ]
for repo in ${repos[@]}
	do
		for app in $( cat "${gitDir}${repo}/${repo}/react_apps.list" )
			do
				printf "\n ${gitDir}${repo}/$app \n"

				( cd "${gitDir}${repo}/$app" ; yarn install && yarn upgrade && yarn build && clear )
			done

	done


## print finale status message [ SUCCESS | ERROR ]
printf "\n repositories update status \n"

for msg in ${endMsg[@]}
	do
		printf " ${msg}"
	done


#######################################################################
#### TIME ELAPSED #####################################################

## conclusion message & time elapsed for shell script
elapsed="\n time elapsed : $((($SECONDS / 60) % 60)) min $(($SECONDS % 60)) secs \n"

printf "${elapsed} \n"


#######################################################################
#### SHELL FINISHED ###################################################

## · NUM1 -eq NUM2 returns true if NUM1 and NUM2 are numerically equal.
## · NUM1 -ne NUM2 returns true if NUM1 and NUM2 are not numerically equal.
## · NUM1 -gt NUM2 returns true if NUM1 is greater than NUM2.
## · NUM1 -ge NUM2 returns true if NUM1 is greater than or equal to NUM2.
## · NUM1 -lt NUM2 returns true if NUM1 is less than NUM2.
## · NUM1 -le NUM2 returns true if NUM1 is less than or equal to NUM2.

#### SHELL FINISHED ###################################################
#######################################################################