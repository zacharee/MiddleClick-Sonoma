<div align="center">
  <h1>
    MiddleClick <img align="center" height="80" src="MiddleClick/Images.xcassets/AppIcon.appiconset/mouse128x128.png">
  </h1>
  <p>
    <b>Emulate a middleclick with three finger Click or Tap on MacBook trackpad and Magic Mouse</b>
  </p>
  <p>
    with <b>macOS</b> Catalina<a href="//www.apple.com/macos/catalina-preview/"><sup>10.15</sup></a> support!
  </p>
  <br>
</div>

##### It's useful (more than just <kbd>⌘</kbd>+click):
> System-wide · close tabs by middleclicking on them.

> In Safari · middleclicking on a link opens it in background.

<br>

## Install

### Via :beer: [Homebrew Cask](//brew.sh) (Recommended)

```powershell
brew cask install dafuqtor/tap/midclick
```

### Direct Download

<details>
  <summary>
    <a href="//github.com/DaFuqtor/MiddleClick/releases/latest/download/MiddleClick.app.zip">
      Latest Release
    </a>&nbsp·&nbsp
    <a href="//github.com/DaFuqtor/MiddleClick/releases/latest">
      <img align="center" alt="GitHub release" src="https://img.shields.io/github/release/dafuqtor/middleclick?label=%20&color=gray">
    </a>
  </summary>

  > Additionally, you may also view <a href="//github.com/DaFuqtor/MiddleClick/releases">Earlier Releases</a>

</details>

<br>

### Hide Status Bar Item

1. Holding `⌘`, drag it away from the status bar until you see a :heavy_multiplication_x: (cross icon)
2. Let it go

> To recover the item, just open MiddleClick when it's already running

### Number of Fingers
- Want to use 4, 5 or 2 fingers for middleclicking? No trouble. Even 10 is possible.

```sh
defaults write com.rouge41.middleClick fingers <int>
```
> Initially, it's 3 fingers to middleclick.

### Add Login Item

> Make it open automatically when you log in (it's handy to do using command line)

```powershell
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/MiddleClick.app", hidden:true}'
```

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
