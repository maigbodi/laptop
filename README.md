# Sparta Global Laptop Config

This script is designed to install and configure Sparta student and trainer macOS machines.

## Instructions

### Factory Reset - OS X Sierra only (if the Mac is not new...)

1. Turn the mac on while holding down Command+R - this should open the Mac OSX Utility screen.
2. Select Disk Utility
3. Select the disk title Macintosh HD and select Erase - don't be scared.
4. Once the disk has been erased, go back to the Mac OSX Utility screen by shutting down Disk Utility
5. Select Reinstall OSX, the second option, and click through the screens to complete reinstall.
6. Complete the OSX install Wizard and create the profile with the necessary credentials (sourced from admin).

### Laptop Script

1. Open the Terminal application.
2. Run the following install scripts, one after the other. If promted to install Xcode Command Line tools, do so then rerun the script that you attempted.

```shell
cd ~; rm -rf ./laptop;

bash <(curl -s https://raw.githubusercontent.com/spartaglobal/laptop/master/main);

bash <(curl -s https://raw.githubusercontent.com/spartaglobal/laptop/master/cleanup);

cd ~; rm -rf ./laptop;

```
Type the **password you use to login** when prompted.

## Developer Notes

There are two scripts to be cloned down and run:
 - `main`: The main script which installs relevant packages and configures the machine
 - `cleanup`: Due to the install of oh-my-zsh, unfortunately the bash session is closed automatically. The final zshrc configuration and download of the Spartan custom theme is housed in this script to be run separately.
 
### Script breakdown

 - **config.sh** - Adds some fancier echos to make the script easier on the eye. Also sets the super user so that it needs only be entered once.
 - **homebrew.sh** - Installs the Homebrew package manager and necessary packages. Please use the Brewfile to change the packages that are installed.
 - **ruby.sh** - Uses `rbenv` (installed using homebrew) to install and configure the ruby version for the machine. To alter the ruby version, use this file.
 - **node.sh** - Uses `nvm` to install and update `node` and `npm`. `nodemon` is the only package to be pre-installed, all others are currently added in lessons. However, any node packages can be added here.
 - **macos.sh** - Configures the machine including user preferences, default images and desktop backgrounds. 
 - **ohmyzsh.sh** - Installs `zsh` and `oh-my-zsh` for easier command line usage. Can be excluded from the script to leave plain bash if desired. If excluded, the `cleanup` script is also redundant.

Initially built by [@dannysmith](http://github.com/dannysmith), edited by [Ollie Holden](http://github.com/odholden).
