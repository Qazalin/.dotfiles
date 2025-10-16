sudo defaults write /Library/Preferences/com.apple.iokit.AmbientLightSensor "Automatic Keyboard Enabled" -bool false
sudo defaults write /Library/Preferences/com.apple.iokit.AmbientLightSensor "Keyboard Backlight Level" -float 0
sudo killall corebrightnessd
