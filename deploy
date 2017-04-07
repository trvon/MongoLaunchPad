# !/bin/bash
# 
# man page 
# creation http://www.linuxhowtos.org/System/creatingman.htm
# 
# Login in scheme
# curl -H "Content-Type: application/json" -X POST -d '{"username":"xyz","password":"xyz"}' http://localhost:3000/api/login

url=$2
name="${2##*/}"
option="${1,,}"

# Most of these function work assuming git and mongodb is installed
# Might install a check just in case
function setup {
	# Project Directory creation
    if [ ! -d app ]; then
    	mkdir app
    fi
    # Creates mongo database folder for initalization
    if [ ! -d data ]; then
    	mkdir -p data/db
	# Generates random's for DB
	# secret="$(tr -d -c '[:alnum:]' </dev/urandom | head -c 36 | base64)"
	# echo -e "{\n\t\"secret\": \"$secret\"," > app/$name/bin/config.json
	port=$RANDOM
	echo -e "{\n\t\"mongoConnection\": \"mongodb://localhost:$port/\"\n}" > app/$name/bin/config.json
}

function start {
	# Starts mongodb and forks it to the background
	# Starting DB
	if [ -f data/db/*.lock ]; then
		  rm data/db/*.lock
	fi
	mongod --dbpath data/db --port $port &
	echo -e "\n\nYou can find the project at\n localhost:$port\n\n"
	# So you know what port webhost is located on
	cd app/$name &&	npm install --silent && npm start &
}

function getApi {
 	if [ -d app/$name ]; then
 		echo "Are you sure you want to overrite this API? ( y | n)"
 		read y
 		if [ "${y,,}" == 'y' ]; then
 			rm -fr app/$namev
 			git clone $url app/$name --quiet
 		fi
 	else
 		git clone $url app/$name --quiet
 	fi
 	# rm -fr data/db
	# mkdir -p data/db
	setup 
 	start

	exit
}

# Stops the mongodb and node server 
function stopApi {
	ps aux | grep -E "[m]ongod|[d]eploy|[n]pm|[n]ode" | awk {'print $2'} | xargs kill
}

# Need to fix
function setApi {
	if [ ! -d app/$name ]; then
		echo "No API has been installed with that name"
	fi
	# function generates random secret on start and stores it in the 
	# config located in the bin 
	setup
	start
	exit
}

case $option in 
	# "start") start ;;
	"use") setApi ;;
	"get") getApi ;;
	# As of now requires 
	"stop") stopApi ;; 
	*) echo -e "Sorry that is not an option, please refer to the man page\n'man deploy'"
esac
