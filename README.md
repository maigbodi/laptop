# Sparta Global Laptop Config

This script is designed to install and configure Sparta student and trainer macOS machines.

## Factory Reset (only if the Mac is being reset...)

1. Turn the mac on while holding down Command+R - this should open the Mac OSX Utility screen.
2. Select Disk Utility
3. Select the disk title Macintosh HD and select Erase - ensure the dropdown has the _Journaled_ option selected.
4. Once the disk has been erased, go back to the Mac OSX Utility screen by shutting down Disk Utility
5. Select Reinstall OSX, the second option, and click through the screens to complete reinstall.
6. Once reinstall has been completed, restart the mac.
7. Complete the OSX install Wizard and create the profile with the necessary credentials (sourced from admin).

## Laptop Script

1. Open the Terminal application.
2. Run the following install scripts, one after the other:

```shell
cd ~; rm -rf ./laptop;

bash <(curl -s https://raw.githubusercontent.com/spartaglobal/laptop/master/remote-install);

bash <(curl -s https://raw.githubusercontent.com/spartaglobal/laptop/master/ohmyzsh-cleanup);

cd ~; rm -rf ./laptop;

```
Type the **password you use to login** when prompted.

Initially built by [@dannysmith](http://github.com/dannysmith), edited by [Ollie Holden](http://github.com/odholden).
