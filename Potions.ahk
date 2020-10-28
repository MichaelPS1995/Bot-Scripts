#If WinActive("RuneLite") or WinActive("Old School RuneScape") or WinActive("OSBuddy") or WinActive("OSBuddy Pro")
#Include, NormalRand.ahk


rightClick() {
	
	Click, down right
	Random, rand, 20, 35
	actionDelay()
	Click, up right
	actionDelay()

}

leftClick() {
	
	Click, down left
	actionDelay()
	Click, up left
	actionDelay()
}


setXValue(){
	Send, 14
	sleep 120
	Send, {enter down}
	actionDelay()
	Send, {enter up}
	actionDelay()
}

;This is the mouse move to move down from the right click to set to 14 [	Mousemove, 3, 90, 3, Rel		]

getVial() {

	Random, randX, 80, 100
	Random, randY, 115, 135
	Mousemove %randX% , %randY%, 6
	leftClick()
	actionDelay()
}

getHerb() {

	Random, randX, 130, 155
	Random, randY, 115, 135
	Mousemove %randX% , %randY%, 6
	leftClick()
	actionDelay()
	
}

actionDelay() {

	rest := NormalRand(140,210)
	sleep %rest%

}

;This first block gets everything set up correctly for the loop to run smoothly

2::
	Pixelsearch, px, py, 334, 30, 433, 90, 0x08405A, 1, Fast
	if (ErrorLevel != 0) {
		Mousemove 650, 510, 6
		actionDelay()
		leftClick()
		actionDelay()
		Mousemove 650, 460, 6
		actionDelay()
		leftClick()
		exitapp
	}

	Random, randX, 200, 300
	Random, randY, 40, 210
	Mousemove, %randX% , %randY%, 6
	leftClick()
	Mousemove 313, 346, 6
	actionDelay()
	leftClick()
	Mousemove, 91, 124, 6
	rightClick()
	Mousemove, 3, 97, 3, Rel
	leftClick()
	sleep NormalRand(2000,2200)
	setXValue()
	actionDelay()
	getHerb()
	Random, randX, 484, 496
	Random, randY, 42, 58
	Mousemove, %randX% , %randY%, 6
	leftClick()

	Breakloop = 0
	
	loop {
		Pixelsearch, px, py, 334, 30, 433, 90, 0x08405A, 1, Fast
		if (ErrorLevel != 0) {
			Mousemove 650, 510, 6
			actionDelay()
			leftClick()
			Mousemove 650, 460, 6
			actionDelay()
			leftClick()
			exitapp
		}

		Random, randX, 612, 637
		Random, randY, 352, 365
		Mousemove, %randX% , %randY%, 6
		leftClick()
		Random, randX, 653, 677
		Mousemove, %randX% , %randY%, 6
		leftClick()
		Send, {space down}
		actionDelay()
		Send, {space up}
		actionDelay()
		sleep NormalRand(10000,12500)
		Random, randX, 210, 310
		Random, randY, 40, 210
		Mousemove, %randX% , %randY%, 6
		actionDelay()
		leftClick()
		actionDelay()
		Random, randX, 435, 455
		Random, randY, 325, 350
		Mousemove, %randX% , %randY%, 6
		actionDelay()
		leftClick()
		actionDelay()
		actionDelay()
		getVial()
		getHerb()
		Random, randX, 484, 496
		Random, randY, 42, 58
		Mousemove, %randX% , %randY%, 6
		leftClick()


	}

Esc::
	Pause

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
