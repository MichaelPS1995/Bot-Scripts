#If WinActive("RuneLite") or WinActive("Old School RuneScape") or WinActive("OSBuddy") or WinActive("OSBuddy Pro")

pressTwo() {
	Send, 2
}

rightClick() {
	
	Click, down right
	Random, rand, 20, 35
	sleep %rand%
	Click, up right

}

leftClick() {
	
	Click, down left
	Random, rand, 20, 35
	sleep %rand%
	Click, up left
}


setXValue(){
	Send, 14
	sleep 120
	Send, {enter down}
	Random, rand, 15, 30
	Send, {enter up}
}

;This is the mouse move to move down from the right click to set to 14 [	Mousemove, 3, 90, 3, Rel		]

getVial() {

	Random, randX, 80, 100
	Random, randY, 115, 135
	Mousemove %randX% , %randY%, 6
	leftClick()
}

getHerb() {

	Random, randX, 130, 155
	Random, randY, 115, 135
	Mousemove %randX% , %randY%, 6
	leftClick()
	
}

2::

	Random, randX, 200, 300
	Random, randY, 40, 210
	Mousemove, %randX% , %randY%, 6
	sleep 232
	leftClick()
	sleep 252
	Mousemove 313, 346, 6
	leftClick()
	sleep 243
	Mousemove, 91, 124, 6
	sleep 234
	rightClick()
	sleep 225
	Mousemove, 3, 97, 3, Rel
	sleep 253
	leftClick()
	sleep 2000
	setXValue()
	sleep 150
	getHerb()
	Random, randX, 484, 496
	Random, randY, 42, 58
	Mousemove, %randX% , %randY%, 6
	leftClick()

	loop {

		Random, randX, 612, 637
		Random, randY, 352, 365
		Mousemove, %randX% , %randY%, 6
		leftClick()
		Random, randX, 653, 677
		Mousemove, %randX% , %randY%, 6
		leftClick()
		Random, rand, 800, 1000
		sleep %rand%
		Send, {space down}
		sleep Random, rand, 20, 40
		Send, {space up}
		Random, sleepTimer, 10000, 12500
		sleep %sleepTimer%
		Random, randX, 200, 300
		Random, randY, 40, 210
		Mousemove, %randX% , %randY%, 6
		sleep 132
		leftClick()
		Random, rand, 350, 500
		sleep %rand%
		Random, randX, 435, 455
		Random, randY, 325, 350
		Mousemove, %randX% , %randY%, 6
		sleep 93
		leftClick()
		Random, rand, 350, 500
		sleep %rand%
		getVial()
		sleep %rand%
		getHerb()
		sleep %rand%
		Random, randX, 484, 496
		Random, randY, 42, 58
		Mousemove, %randX% , %randY%, 6
		leftClick()


	}
return

`:: ; Pressing ` (~/console key) turns the AHK icon in your system tray to red to let you know that's it's suspended.
    Suspend, Permit
    if not A_IsSuspended
    {
        Menu, Tray, Icon, %A_AhkPath%, 5, 1
        Suspend, On
    }
    else
    {
        Menu, Tray, Icon, %A_AhkPath%, 1, 0
        Suspend, Off
    }
    return

0::exitapp
