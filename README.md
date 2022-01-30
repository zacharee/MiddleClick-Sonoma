<a href="https://github.com/artginzburg/MiddleClick-BigSur/releases">
  <img align="right" src="https://img.shields.io/github/downloads/artginzburg/middleclick-bigsur/total?color=teal" title="GitHub All Releases">
</a>

<div align="center">
  <h1>
    MiddleClick <img align="center" height="80" src="MiddleClick/Images.xcassets/AppIcon.appiconset/mouse128x128.png">
  </h1>
  <p>
    <b>Emulate a scroll wheel click with three finger Click or Tap on MacBook trackpad and Magic Mouse</b>
  </p>
  <p>
    with <b>macOS</b> Big Sur<a href="https://www.apple.com/macos/big-sur/"><sup>11.5</sup></a> support!
  </p>
  <br>
</div>

<img src="demo.png" width="55%">

<h2 align="right">:mag: Usage</h2>

<blockquote align="right">
  
  It's more than just `⌘`+click
</blockquote>

<p align="right">
  
  `System-wide` · close tabs by middleclicking on them
</p>

<p align="right">
  
  `In Safari` · middleclicking on a link opens it in background
</p>

<br>

## Install

### Via :beer: [Homebrew Cask](//brew.sh) (Recommended)

```ps1
brew install --cask --no-quarantine middleclick
```

### Direct Download

<details>
  <summary>
    <a href="https://github.com/artginzburg/MiddleClick-BigSur/releases/latest/download/MiddleClick.zip">
      Latest Release
    </a>&nbsp·&nbsp
    <a href="https://github.com/artginzburg/MiddleClick-BigSur/releases/latest">
      <img align="center" alt="GitHub release" src="https://img.shields.io/github/release/artginzburg/middleclick-BigSur?label=%20&color=gray">
    </a>
  </summary>

  > Additionally, you may also view <a href="https://github.com/artginzburg/MiddleClick-BigSur/releases">Earlier Releases</a>

</details>

<br>

### Hide Status Bar Item

1. Holding `⌘`, drag it away from the status bar until you see a :heavy_multiplication_x: (cross icon)
2. Let it go

> To recover the item, just open MiddleClick when it's already running

### Number of Fingers
- Want to use 4, 5 or 2 fingers for middleclicking? No trouble. Even 10 is possible.

```ps1
defaults write com.rouge41.middleClick fingers <int>
```
> Initially, it's 3 fingers to middleclick.

### Delay on wake
If the app starts before the trackpad/magic mouse is initialized:
> Usually appears after wake from sleep, forcing the user to manually restart the app.

```ps1
defaults write com.rouge41.middleClick autoRestartOnWake -int 3
```
Tweak the setting above to your needs. 3 seconds should be fine in most cases.

### Add Login Item

> Make it open automatically when you log in

<details>
  
<summary>Just add MiddleClick to your "Login Items". <p align="right">(it's handy to be done using command line)</p></summary>
  
```ps1
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/MiddleClick.app", hidden:true}'
```

</details>

---

<details>
  <summary>This fork differs from the <a href="//github.com/cl3m/MiddleClick">base fork</a> in some ways</summary>

- Configurations: Number of Fingers, Click or Tap
  - preferred setting is saved for every user
- Removed old 32-bit/PowerPc `relaunch` binary due to it's incompatibility with macOS 10.15 Catalina and greater. Replaced with inline restarting of the app
- The App will not only restart on waking the Mac, but when a new touch device is added (so it immediately gains middleclicking ability) and when a display is added/reconfigured (for proper click positioning)
</details>

#### Attention! Make sure to:

1. Quit an old version of MiddleClick
2. Remove it from the privacy settings
3. Enable the new version in privacy settings when prompted

> The app should be closed when you change the privacy settings, otherwise the Mouse may not be clickable and you may have to `killall MiddleClick` via terminal or even force restart the Mac.

<details>
  <summary><b>Credits</b></summary>
  <blockquote>
  <br>
    
  This project was made by [Clément Beffa](//clement.beffa.org/),

  Extended by [LoPablo](//github.com/LoPablo)

  and [artginzburg](//github.com/artginzburg) (it's me)
  </blockquote>
</details>
