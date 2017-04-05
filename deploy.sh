# !/bin/bash

# man page 
# creation http://www.linuxhowtos.org/System/creatingman.htm

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

	# Generates random's for DB
	secret="$(tr -d -c '[:alnum:]' </dev/urandom | head -c 36 | base64)"
	echo -e "{\n\t\"secret\": \"$secret\"," > app/$name/bin/config.json
	port=$RANDOM
	echo -e "\t\"mongoConnection\": \"mongodb://localhost:$port/\"\n}" >> app/$name/bin/config.json
}

function start {
	# Starts mongodb and forks it to the background
	cd app/$name &&	npm install && npm start 
	mongodb app.js --quiet --port $port --host mongodb://localhost:$port &
}

function getApi {
 	if [ -d app/$name ]; then
 		echo "Are you sure you want to overrite this API? ( y | n)"
 		read y
 		if [ "${y,,}" == 'y' ]; then
 			rm -fr app/$name
 			git clone $url app/$name --quiet
 		fi
 	else
 		git clone $url app/$name --quiet
 	fi
 	setup 
 	start

	exit
}

function stopApi {
	process="$(ps -ef | awk '/[m]ongodb/{print $2}')"
	sudo kill $process
	# sudo killall mongodb
	# mongod --shutdown &
	exit
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
	"start") start ;;
	"set") setApi ;;
	"get") getApi ;;
	# As of now requires 
	"stop") stopApi ;; 
	*) echo -e "Sorry that is not an option, please refer to the man page\n'man deploy'"
esac