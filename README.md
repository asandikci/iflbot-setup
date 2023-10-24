## Izmir Science High School - Computer Lab Setup Script
> Install prerequisites, applications, tools; set up configs etc.

### Download & Install
```bash
wget -qO- https://raw.githubusercontent.com/asandikci/iflbot-setup/main/install.sh | bash <(cat) </dev/tty
```

### Features
- Auto MEB Certificate Installation
- Install Prerequisites for Building C/C++ Code: gcc, g++, build-essential
- Install Apps: VSCodium, Sublime Text, Xournal++
- Ready to Use C/C++ Sublime Build Files for both file/terminal execution
- Dark Theme
- Panel Settings: 28px
- Auto Login to user account
- Screen Auto Dimming: 1H, Screen Auto Off: 2H


### Compatibility
- Pardus 23.0 XFCE

### LICENSE
- GNU GPLv3+

### TODO
- [ ] Add Apps to Panel: VSCodium, SublimeText, Firefox, File Explorer
  - [ ] Also Favorite
- [ ] Default file assocation for Sublime text with .c, .cpp
- [ ] Disable annoying bell sound (in each restart)
- Firefox
  - [ ] Firefox Change MainPage
  - [ ] Firefox Change Search Engine
  - [ ] Firefox Auto Import Certificate
  - [ ] Firefox Alt+Tab Last Viewed
- [ ] Dark Theme Problems? Refresh?


---

- [ ] Sublime Extra Configurations
- [ ] VSCodium Auto Configurations
- XFCE General Configurations
  - [ ] Auto Sleep 2H
  - [ ] Auto Dimming 2H
- [ ] Disable root login

---
- [ ] Create Settings file (json?) for easy editing configs, apps etc. manually
- [ ] Sync Settings with GitHub/Website URL

- [ ] ISSUE: mix 2 config file and resolve sudo issue

- [ ] End-of-life after [LabManage](https://git.aliberksandikci.com.tr/asandikci/labmanage) application ready-to-use (WIP/private for now)
