DEPLOY


NAME
		Deploy's mongodb hosted on node server


SYNOPSIS
		deploy [option] [url]


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
		get		downloads a git repository into the app folder and then 
				aunches the app as 
				well as it launches a mongo databse. 

		use 	uses a current directory to launch an api from. Users can
				either use an URL to
				the directory or they can use the basename of the folder. 
				*important* Case matters

		stop	Stops the  database and node server. Make sure you want to do
				this because the port is going to be randommized when started 
				again