LaunchPad

*Disclaimer*

Some commands may or may not work until everything is sufficently tested

NAME"
		A deployment console for mongoDB and node projects


SYNOPSIS
		deploy [option] [project] [URL]


DESCRIPTION

		Disclaimer - This script is tested on Linux Platforms and utitlizes
		bash.

		This script randomizes the port app/$foobar/bin folder, 
		which hosts the application. Users can download multiple API's and
		launch them with the (get) command or use current downloaded API's with
		the (use) command.

		The path's are relative, so it is advised to launch the deploy command
		within the top directory, especially after launching it for the first
		time. After the first launch the target directory should contain an app
		folder and an data/db folder path

OPTIONS

	get		downloads a git repository into the app folder in side of the
			specified project directory. 

	set 	Depending on project specified, the user sets the project
			directory that they wold like to launch from. 

	start

		start-all:
		start-ui:
		start-api:
		start-db:

	stop

		stop-all: 		Stops the  database and node server. Make sure you 
						want to do this because the port is going to be 
						randommized when started again
		stop-ui:
		stop-api:
		stop-db:
        
    update

       	update:			Pulls from all the current git repositories located 
       					in the app directories.

       	update [url]: 	Updates a specific repository in the project directory

       	update-current: Updates the selected projects

PROJECT

	UI 		This directory is for the front end development.
	API 	This directory is for the back end development

URL
		As of now, the url supports git repositories, but I will be working
		to support different version control systems. 
