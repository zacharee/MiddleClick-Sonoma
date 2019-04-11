# MiddleClick

Emulate a middleclick with triple click/tap on a Magic Mouse. Use private osx api for using the [macbook multitouch trackpad code](http://www.steike.com/code/multitouch/) and some [middleclick code](http://www.r0ssar00.com/2008/12/middle-click-on-mac-code.html).

This fork differs from the base fork in some ways which are listed below:

- [added in 2.0] Middle Click now again supports using a "Click" with three fingers instead of tap
- [re added in 2.1] Tapping is still available. Wether you want to click or tap, is configured in the status bar menu which was re enabled.
- [added in 2.2]The preferred setting is now saved for every user. So when the App starts, clicking or tapping will be like configured last time.
- [added in 2.2 extended in 2.3] Removed old 32bit / PowerPc relaunch binary and replaced with inline restarting of the app (so when it restarts there will no longer be a message about incompatibility with OS versions after Mojave)
- [added in 2.3] The App will not only restart on waking the Mac, but when a new touch device is added (so it gains the same function with 3 finger click or tapping) and when a display is added / reconfigured (which seems to be necessary)


# IMPORTANT

Make sure you quit an old version of MiddleClick, remove it from the privacy settings and enable the new version in privacy settings when prompted (seems to be necessary for every new version). It's important to first quit MiddleClick and afterwards remove it from privacy settings, otherwise the Mouse may not be clickable and you have to force reset the Mac or quit MiddleClick via terminal.

