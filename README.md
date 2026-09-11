# homebrew-pantersoft

### Installation Tap
1. Tap the repository:
    ```sh
    brew tap PanterSoft/homebrew-pantersoft
    ```

### Applications inside this tap
| Build Passed    | Name            | Description                  |
|-----------------|-----------------|------------------------------|
| :x: | NetworkProfiles | Manage network profiles inside your Menue Bar      |
| :white_check_mark: | rpiboot         | Boot Raspberry Pi over USB (https://github.com/raspberrypi/usbboot)  |
| :white_check_mark: | cantracer       | CAN bus tracer with DBC decoding, macOS app cask (https://github.com/PanterSoft/CANtracer) |


### Casks

`cantracer` is a cask, so it needs to be trusted once before installing:

```sh
brew trust --cask pantersoft/pantersoft/cantracer
brew install --cask cantracer
```

The app is ad-hoc signed rather than notarised; if macOS refuses to open it:

```sh
xattr -dr com.apple.quarantine /Applications/CANtracer.app
```

### Formula Descriptions

#### Rpiboot

If you want to flash a RPI5/CM5 use the command with the `-d` flag and the mass-storage-gadget64 directory. the correct command is shown when executing:
```sh
brew info rpiboot
```