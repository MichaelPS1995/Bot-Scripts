#Include, RandomBezier.ahk
#Include, NormalRand.ahk

;NormalRand is a weighted random function, RandomBezier is the function to make non-linear mouse movements.

global odds := 0
global guess := 0
global level := 0

;click function that emulates my clicks specifically
click() {

	click, down
	clickDelay := NormalRand(65, 95)
	sleep %clickDelay%
	click, up
	
}


;Delay that emulates my specific delay of events when doing things (ex: moving mouse over to something before I click)
actionDelay() {

	rest := NormalRand(140,210)
	sleep %rest%

}


;opens the banking interface, sometimes will throw in a double click
clickBank() {

	PixelSearch, Px, Py, 400, 400, 480, 450, 0x00FF00, 1, Fast
	if(Errorlevel = 0) {
		ml := NormalRand(200,400)
		Xfin := Px + NormalRand(-5, 50)
		Yfin := Py + NormalRand(-5,35)
		MouseGetPos, Xs, Ys
		RandomBezier(Xs, Ys, Xfin, Yfin, Tm1 RO OB10 OT10 OL0 OR0 P2-4)
	}
	odds := NormalRand(12,19)
	guess := NormalRand(1,odds)
	if( guess == 4){
		actionDelay()
		click()
		sleep NormalRand(50, 85)
		click()
		actionDelay()
	}
	else{
		actionDelay()
		click()
		actionDelay()
		actionDelay()
	}
	
}


;withdraws molten glass from the bank, will sometimes mislick to emulate human input
getGlass() {
	
	PixelSearch, Px, Py, 114, 105, 153, 136, 0x7C92D0, 1 Fast
	if(Errorlevel == 0) {
		odds := NormalRand(15,28)
		guess := NormalRand(1,odds)
		if(guess == 12) {
			ml := NormalRand(437,626)
			Random, X, 174, 180
			Random, Y, 112, 131	
			MouseGetPos, Xs, Ys
			RandomBezier(Xs, Ys, X, Y, Tm1 RO OB10 OT10 OL0 OR0 P2-4)
			actionDelay()
			send, {shift down}
			actionDelay()
			click()
			ml := NormalRand(97,148)
			Random, X, 121, 146
			Random, Y, 112, 131
			MouseGetPos, Xs, Ys
			RandomBezier(Xs, Ys, X, Y, Tm1 RO OB10 OT10 OL0 OR0 P0)
			actionDelay()
			click()
			send, {shift up}
			actionDelay()
		}
		else{
			ml := NormalRand(375,625)
			Random, X, 121, 146
			Random, Y, 112, 131	
			MouseGetPos, Xs, Ys
			RandomBezier(Xs, Ys, X, Y, Tm1 RO OB2 OT2 OL2 OR2 P2-4)
			actionDelay()
			send, {shift down}
			actionDelay()
			click()
			actionDelay()
			send, {shift up}
			actionDelay()
		}
	}
	else {
		exitBank()
		actionDelay()
		logOut()
	}

}


;exits out of the bank
exitBank() {

	send, {Esc down}
	actionDelay()
	send, {Esc up}
	actionDelay()
	actionDelay()

}


;deposits all the glass after it's been crafted
bankGlass() {

	PixelSearch, Px, Py, 694, 395, 731, 412, 0x403532, 1, Fast
	if(Errorlevel = 0) {
		Xpos := NormalRand(702,723)
		Ypos := NormalRand(395,413)
		MouseGetPos, Xs, Ys
		ml := NormalRand(400,580)
		RandomBezier(Xs, Ys, Xpos, Ypos, Tm1 RO OB10 OT10 OL0 OR0 P2-4)
		actionDelay()
		send, {shift down}
		actionDelay()
		click()
		actionDelay()
		send, {shift up}
	}

}


;logs out of the game and exits the program
logOut() {

	ml := NormalRand(200,400)
	MouseGetPos, Xs, Ys
	Random, X, 722, 747
	Random, Y, 646, 675
	RandomBezier( Xs, Ys, X, Y, Tm1 RO OB10 OT10 OL0 OR0 P2-4)
	actionDelay()
	Click()
	actionDelay()
	Random, X, 667, 800
	Random, Y, 597, 620
	RandomBezier( Xs, Ys, X, Y, Tm1 RO OB10 OT10 OL0 OR0 P2-4)
	actionDelay()
	Click()
	exitapp
	
}


;crafts the molten glass, sometimes misclicks, sometimes swaps the pipe with the glass then corrects
blowGlass() { 

	PixelSearch, Px, Py, 665, 395, 695, 412, 0x48494E, 1, Fast
	if(Errorlevel == 0) {
		odds := NormalRand(30,37)
		guess := NormalRand(1,odds)
		if(guess == 17) {
			swap()
		}
		else if (guess == 19) {
			misclickGlass()
		}
		ml := NormalRand(300,400)
		MouseGetPos, Xs, Ys
		xf := Px + NormalRand(-6, 12)
		yf := Py + NormalRand(-20, 6)
		RandomBezier(Xs, Ys, xf, yf, Tm1 RO OB10 OT10 OL0 OR0 P2-4)
		actionDelay()
		click()
		actionDelay()
		MouseGetPos, Xs, Ys
		Random, X, 659, 685
		Random, Y, 433, 449
		RandomBezier(Xs, Ys, X, Y, Tm1 RO OB10 OT10 OL0 OR0 P2-4)
		actionDelay()
		click()
		sleep NormalRand(645, 725)
		send, {space down}
		actionDelay()
		send {space up}
	}

}


;swaps the glassblowingpipe with the molten glass (this function is strictly for human error emulation)
swap() {
	
	PixelSearch, Px, Py, 650, 395, 695, 412, 0x48494E, 1, Fast
	if(Errorlevel == 0) {
		ml := NormalRand(200,400)
		MouseGetPos, Xs, Ys
		xf := Px + NormalRand(-6, 16)
		yf := Py + NormalRand(-20, 12)
		RandomBezier(Xs, Ys, xf, yf, Tm1 RO OB0 OT0 OL0 OR0 P2-4)
		actionDelay()
		click, down
		MouseGetPos, Xs, Ys
		Random, X, 660, 682
		Random, Y, 431, 447
		MouseMove X,Y,4
		click, up
		actionDelay()
		ml := NormalRand(200,400)
		MouseGetPos, Xs, Ys
		xf := Px + NormalRand(-6, 16)
		yf := Py + NormalRand(-20, 12)
		RandomBezier(Xs, Ys, xf, yf, Tm1 RO OB0 OT0 OL0 OR0 P2-4)
		actionDelay()
		click, down
		MouseGetPos, Xs, Ys
		Random, X, 660, 682
		Random, Y, 431, 447
		MouseMove X,Y,3
		click, up
		actionDelay()
	}

}


;this function is something I wrote to call in other functions to misclick to emulate human input
misclickGlass() {
		
		PixelSearch, Px, Py, 695, 395, 730, 412, 0x48494E, 1, Fast
		if(Errorlevel == 0) {
			ml := NormalRand(200,400)
			MouseGetPos, Xs, Ys
			xf := Px + NormalRand(-6, 12)
			yf := Py + NormalRand(-20, 12)
			RandomBezier(Xs, Ys, xf, yf, Tm1 RO OB10 OT10 OL0 OR0 P2-4)
			actionDelay()
			click()
			actionDelay()
			MouseGetPos, Xs, Ys
			Random, X, 660, 682
			Random, Y, 457, 460
			RandomBezier(Xs, Ys, X, Y, Tm1 RO OB10 OT10 OL0 OR0 P2-4)
			actionDelay()
			click()
			actionDelay()
		}
}


;this function waits for the action performed to be finished (usually moves mouse off screen while waiting, will sometimes move mouse randomly around the screen
;anywhere from 2-6 times, with random time delay between each one
waitForGlass() {
	
	count := 0
	odds := NormalRand(10,15)
	guess := NormalRand(1,odds)
	if( guess == 9) {
		sleep NormalRand(0,1000)
		totalSleep := NormalRand(49000,53000)
		amountSlept := 0
		while ( amountSlept < totalSleep) {
			sleepTimer := NormalRand(8000,25000)
			MouseGetPos xs, ys
			xfin := NormalRand(40, 800)
			yfin := NormalRand(100, 600)
			ml := NormalRand(460,900)
			RandomBezier(xs, ys, xfin, yfin, Tm1 R0 OB10 OT10 OL10 OR10 P2-4)
			amountSlept := amountSlept + sleepTimer
			sleep sleepTimer
			checkForLevelUp()
			if(level == 1) {
				level := 0
				continueGlassMake()
				break
			}
		}
	}
	else {
		ml := NormalRand(475,625)
		wait := NormalRand(53, 55)
		MouseGetPos X,Y
		yfin := NormalRand(50,600)
		RandomBezier(xs, ys, -100, yfin, "T500 R0 OB10 OT10 OL10 OR0 P2-4")
		while(count < wait) {
			sleeper := NormalRand(940,1030)
			sleep sleeper
			count := count + 1
			checkForLevelUp()
			if(level == 1) {
				level := 0
				continueGlassMake()
				break
			}
		}
	}
}


;this functions purpose to to check the progress of the skill I'm working on (make it look like the human player is checking progress made)
checkCraftingLvl() {

	send {F2 down}
	actionDelay()
	send {F2 up}
	MouseGetPos, X0, Y0
	Random, xf, 710, 760
	Random, yf, 514, 535
	RandomBezier( X0, Y0, xf, yf, Tm1 R0O OB30 OT30 OL30 OR0 P2-4)
	Random, rand, 3030, 4619
	sleep %rand%
	actionDelay()
	send {Esc down}
	actionDelay()
	send {Esc up}
					
}


;When you level up it auto stops your actions, this function is to check if I have reached a new level (to see if I have stopped crafting glass)
checkForLevelUp() {

	PixelSearch, Px, Py, 13, 524, 233, 645, 0x093D5B, 1, Fast
	if(Errorlevel == 0) {
		rand := NormalRand(6,9)
		loop, %rand% {
			send {space down}
			rand := NormalRand(50,93)
			sleep rand
			send {space up}
			rand := NormalRand(50,93)
			sleep rand
		}
		level := 1
	}

}


;this method is an afk that will be between 55 seconds to 2 minutes (if odds are even the mouse will sleep where it is, else it will move off screen)
afk(odds) {

	if(Mod(odds,2) == 0) {
		sleeper := NormalRand(55000, 120000)
		sleep sleeper
	}
	else {
		MouseGetPos, px, py
		fx := NormalRand(-100, -200)
		fy := NormalRand(0, 680)
		ml := NormalRand(200,400)
		RandomBezier(px, py, fx, fy, Tm1 RO OB10 OT10 OL0 OR0 P2-4)
		sleeper := NormalRand(50000, 180000)
		sleep sleeper
	}

}


;this is the wait function for the action, will move off screen usually, sometimes move mouse around screen randomly
continueGlassMake() {

	PixelSearch, Px, Py, 695, 395, 730, 412, 0x48494E, 1, Fast
	if(Errorlevel == 0) {
		ml := NormalRand(200,400)
		MouseGetPos, Xs, Ys
		xf := Px + NormalRand(-6, 16)
		yf := Py + NormalRand(-20, 12)
		RandomBezier(Xs, Ys, xf, yf, Tm1 RO OB10 OT10 OL0 OR0 P2-4)
		actionDelay()
		click()
		actionDelay()
		PixelSearch, Px, Py, 685, 380, 860, 630, 0x1468AB, 1, Fast
		if(Errorlevel == 0) {
			MouseGetPos, x,y
			xfin := NormalRand(-8,15) + Px
			yfin := NormalRand(-7, 7) + Py
			RandomBezier( x, y, xfin, yfin, Tm1 RO OB10 OT10 OL0 OR0 P2-4 )
			actionDelay()
			click()
			actionDelay()
			sleep NormalRand(600, 734)
			send, {space down}
			actionDelay()
			send {space up}
			actionDelay()
			if(yfin > 600) {
				sleep NormalRand(7500, 7785)
			}
			else if(yfin > 565) {
				sleep NormalRand(14730, 15420)
			}
			else if(yfin > 530) {
				sleep NormalRand(22430, 22833)
			}
			else if(yfin > 495) {
				sleep NormalRand(29130, 29750)
			}
			else if(yfin > 458) {
				sleep NormalRand(36839, 37321)
			}
			else {
				sleep NormalRand(49000, 52000)
			}
		}
	}

}


z::

clickBank()

loop {

	getGlass()
	exitBank()
	blowGlass()
	waitForGlass()
	odds := NormalRand(70,90)
	guess := NormalRand(1,odds)
	if(guess == 85) {
		afk(odds)
	}
	clickBank()
	bankGlass()
	odds := NormalRand(50,70)
	guess := NormalRand(1,odds)
	if(guess == 35) {
		afk(odds)
	}

}


`::
	pause

0::
	exitapp

