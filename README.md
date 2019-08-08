<h1 align="center">MiddleClick <img align="center" height="80" src="Images.xcassets/AppIcon.appiconset/mouse128x128.png"></h1>

<p align="center">Emulate a middleclick with triple click or tap on MacBook trackpad and Magic Mouse.</p>

<h2 align="center">
   <a href="//github.com/DaFuqtor/MiddleClick/releases/latest/download/MiddleClick.app.zip">
      Download latest release
   </a>
   <a href="//github.com/DaFuqtor/MiddleClick/releases/latest">
      <img align="right" alt="GitHub tag" src="https://img.shields.io/github/release/dafuqtor/middleclick">
   </a>
</h2>

## or Install using [Homebrew](//brew.sh)

```powershell
brew cask install dafuqtor/tap/midclick
```

After installation, I recommend to

### Add Login Item

> It's handy to do using command line

```powershell
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/MiddleClick.app", hidden:true}'
```

---

#### If you can’t even imagine why you need this:

1. In Safari, middleclicking on a link opens it in background.
2. System-wide, you can close tabs by middleclicking on them.

##### This fork differs from the base fork in some ways which are listed below:

- Configuration: Click or Tap
  - preferred setting is saved for every user
- Removed old 32-bit/PowerPc `relaunch` binary due to it's incompatibility with macOS 10.15 Catalina and greater. Replaced with inline restarting of the app
- The App will not only restart on waking the Mac, but when a new touch device is added (so it immediately gains middleclicking ability) and when a display is added/reconfigured (which seems to be necessary)

#### Important

Make sure you quit an old version of MiddleClick, remove it from the privacy settings and enable the new version in privacy settings when prompted (seems to be necessary for every new version). It's important to first quit MiddleClick and afterwards remove it from privacy settings, otherwise the Mouse may not be clickable and you have to force reset the Mac or quit MiddleClick via terminal.
