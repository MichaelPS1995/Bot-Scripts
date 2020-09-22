#Include, RandomBezier.ahk
#Include, NormalRand.ahk



;NormalRand is a weighted random function, RandomBezier is the function to make non-linear mouse movements.



;click function that mimics my clicks
click() {

	click, down
	clickDelay := NormalRand(65, 95)
	sleep %clickDelay%
	click, up
  
}


;logs out of game
logOut() {

	ml := NormalRand(200,400)
	MouseGetPos, Xs, Ys
	Random, X, 757, 783
	Random, Y, 646, 675
	RandomBezier( Xs, Ys, X, Y, Tm1 RO OB10 OT10 OL0 OR0 P2-4)
	actionDelay()
	Click()
	actionDelay()
	Random, X, 710, 820
	Random, Y, 597, 620
	RandomBezier( Xs, Ys, X, Y, Tm1 RO OB10 OT10 OL0 OR0 P2-4)
	actionDelay()
	Click()
  exitapp
  
}

;simulates player looking at progress of skill being trained
checkMagicLvl() {

	send {F2 down}
	actionDelay()
	send {F2 up}
	MouseGetPos, X0, Y0
	Random, xf, 683, 732
	Random, yf, 548, 568
	RandomBezier( X0, Y0, xf, yf, Tm1 RO OB10 OT10 OL0 OR0 P2-4 )
	Random, rand, 2400, 3500
	sleep %rand%
	send {F6 down}
	actionDelay()
	send {F6 up}
					
}

;simulates player looking at progress of skill being trained
checkCraftingLvl() {

	send {F2 down}
	actionDelay()
	send {F2 up}
	MouseGetPos, X0, Y0
	Random, xf, 746, 792
	Random, yf, 514, 535
	RandomBezier( X0, Y0, xf, yf, Tm1 RO OB10 OT10 OL0 OR0 P2-4 )
	Random, rand, 2400, 3500
	sleep %rand%
	send {F6 down}
	actionDelay()
	send {F6 up}
					
}

;opens the bank and waits for interface to pop up
clickBank() {

	PixelSearch, Px, Py, 185, 197, 523, 327, 0x00FF00, 1, Fast
	if(Errorlevel = 0) {
		ml := NormalRand(200,400)
		Xfin := Px + NormalRand(15,95)
		Yfin := Py + NormalRand(0,60)
		MouseGetPos, Xs, Ys
		RandomBezier(Xs, Ys, Xfin, Yfin, Tm1 RO OB10 OT10 OL0 OR0 P2-4)
	}
	actionDelay()
	click()
	sleep NormalRand(600, 1000)

}

;withdraws raw material
getSeaWeed() {
	
	ml := NormalRand(375,625)
	Random, X, 139, 165
	Random, Y, 110, 131	
	MouseGetPos, Xs, Ys
	RandomBezier(Xs, Ys, X, Y, Tm1 RO OB10 OT10 OL0 OR0 P2-4)
	actionDelay()
	loop, 3 {
		click()
		spamClick := NormalRand(30,50)
		sleep %spamClick%
	}
	actionDelay()
}

;withdraws raw material
getSand() {

	ml := NormalRand(200,400)
	Random, X, 187, 208
	Random, Y, 112, 136	
	MouseGetPos, Xs, Ys
	RandomBezier(Xs, Ys, X, Y, Tm1 RO OB10 OT10 OL0 OR0 P2-4)
	actionDelay()
	send, {shift down}
	actionDelay()
	click()
	actionDelay()
	send, {shift up}
	actionDelay()

}

;closes bank
exitBank() {

	send, {Esc down}
	actionDelay()
	send, {Esc up}

}

;delay in ms that mimics my delay between mouse inputs
actionDelay() {

	rest := NormalRand(140,210)
	sleep %rest%

}

;casts the spell to make glass, if spellbook isn't open it opens spellbook
glassMake() {

	PixelSearch, Px, Py, 676, 433, 865, 554, 0xECECED, 1, Fast
	if(Errorlevel = 0) {
		Y := Py + NormalRand(0,16)
		X := Px + NormalRand(0,10)
		MouseGetPos, Xs, Ys
		ml := NormalRand(200,400)
		RandomBezier(Xs, Ys, X, Y, Tm1 RO OB10 OT10 OL0 OR0 P2-4)
		actionDelay()
		click()
		actionDelay()
	}
	else {
		send, {F6 down}
		actionDelay()
		send, {F6 up}
		PixelSearch, Px, Py, 676, 433, 865, 554, 0xECECED, 1, Fast
		if(Errorlevel = 0) {
			Y := Py + NormalRand(0,16)
			X := Px + NormalRand(0,10)
			MouseGetPos, Xs, Ys
			ml := NormalRand(200,400)
			RandomBezier(Xs, Ys, X, Y, Tm1 RO OB10 OT10 OL0 OR0 P2-4)
			actionDelay()
			click()
			actionDelay()
		}
	}

}

;banks the glass made
bankGlass() {

	PixelSearch, Px, Py, 735, 395, 766, 412, 0x96A5D4, 1, Fast
	if(Errorlevel = 0) {
		Xpos := NormalRand(737,760)
		Ypos := NormalRand(400,413)
		MouseGetPos, Xs, Ys
		ml := NormalRand(400,580)
		RandomBezier(Xs, Ys, Xpos, Ypos, Tm1 RO OB10 OT10 OL0 OR0 P2-4)
		actionDelay()
		send, {shift down}
		actionDelay()
		click()
		actionDelay()
		send, {shift up}
		actionDelay()
	}

}

;this function picks up glass off the floor if excess is made
pickUpGlass() {

	PixelSearch, Px, Py, 246, 288, 600, 470, 0x7C99D8, 1, Fast
	if(Errorlevel = 0) {
	X := Px + NormalRand(0,40)
	Y := Py + NormalRand(0,22)
	MouseGetPos, Xs, Ys
	ml := NormalRand(400,600)
	RandomBezier(Xs, Ys, X, Y, Tm1 RO OB10 OT10 OL0 OR0 P2-4)
	while(Errorlevel = 0) {
		click()
		spamClick := NormalRand(30,50)
		sleep %spamClick%
		PixelSearch, Px, Py, 246, 288, 600, 470, 0x7C99D8, 1, Fast
	}
	actionDelay()
	}

}

;waits for spell to finish animation
waitForGlass() {
	
	rest := NormalRand(2000,2700)
	sleep %rest%

}


global glassFound := 0
global odds := 0

;this glass checks to see if excess was made, and changes a global variable for another function to know to pick up the glass
checkFloor() {
	
	glassFound := 0

	PixelSearch, Px, Py, 246, 288, 600, 470, 0x7C99D8, 1, Fast
	if(Errorlevel = 0) {
		glassFound := 1
	}
	else {
		glassFound := 0
	}

}

;I combined both check level functions into one function call, where it takes an int parameter, checks magic if the parameter is even, crafting if parameter is odd
checkLevels(odds) {

	exitBank()

	if(Mod(odds,2) == 0) {
		checkMagicLvl()
	}
	else{
		checkCraftingLvl()
	}

}

;simulates afk breaks between 15 seconds and 2 minutes with mouse on screen and between 20 seconds and 2.5 minutes with mouse off screen
afk(odds) {

	if(Mod(odds,2) == 0) {
		sleeper := NormalRand(15000, 120000)
		sleep sleeper
	}
	else {
		MouseGetPos, px, py
		fx := NormalRand(-100, -200)
		fy := NormalRand(0, 680)
		ml := NormalRand(200,400)
		RandomBezier(px, py, fx, fy, Tm1 RO OB10 OT10 OL0 OR0 P2-4)
		sleeper := NormalRand(20000, 150000)
		sleep sleeper
	}

}


q::

clickBank()

loop {

	getSeaWeed()
	getSand()
	exitBank()
	glassMake()
	waitForGlass()
	checkFloor()
	if(glassFound == 1) {
		clickBank()
		bankGlass()
		exitBank()
		pickUpGlass()
		clickBank()
		bankGlass()
	}
	else{
		clickBank()
		bankGlass()
	}

	odds := NormalRand(50,75)
	guess := NormalRand(1,odds)
	if(guess == 20) {
		checkLevels(odds)
		clickBank()
		continue
	}
	odds := NormalRand(40,50)
	guess := NormalRand(1,odds)
	if(guess == 15) {
		afk(odds)
		continue
	}
	
}

z::
Pause
