A deployment console for mongoDB and node projects

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
To use script globally, clone the repository and run the setup script
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

*Disclaimer*

	- This script is tested on Linux Platforms and utitlizes bash.
		
	- Some commands may or may not work until everything is sufficently tested

	- Ubuntu Systems
		Since ubuntu uses dash default, an easy fix requires this simple line of code:
		sudo rm /bin/sh && sudo ln -s /bin/bash /bin/sh

Synopsis:	

		deploy [option] [project] [URL]


Description

		This script randomizes the port app/$foobar/bin folder, 
		which hosts the application. Users can download multiple API's and
		launch them with the (get) command or use current downloaded API's with
		the (use) command.

		The path's are relative, so it is advised to launch the deploy command
		within the top directory, especially after launching it for the first
		time. After the first launch the target directory should contain an app
		folder and an data/db folder path

Options

	get		downloads a git repository into the app folder in side 
			of the specified project directory. 

	setrepo		Depending on project specified, the user sets the project
			directory that they wold like to launch from. 

	start [option]

		all:
		ui:
		api:
		db:

	stop [option]

		all:	Stops the  database and node server. Make sure you 
			want to do this because the port is going to be 
			randommized when started again
		ui:
		api:
		db:
        
    update [option]
    
       	all	Pulls from all the current git repositories located 
       		in the app directories.

Project

	UI 	This directory is for the front end development.
	API 	This directory is for the back end development

Url

	As of now, the url supports git repositories, but I will be 
	working to support different version control systems. 
