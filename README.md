# Sparta Global Laptop Config

This script is designed to install and configure Sparta student and trainer macOS machines.

## Steps to configure a new Mac

1. Initial macOS Setup Wizard (Laptop name, WiFi etc). Admin staff will provide the username and password to use when configuring this part.
2. Open the Terminal application.
3. Run the install script:

```shell
`cd ~; bash <(curl -s https://raw.githubusercontent.com/spartaglobal/laptop/master/remote-install)`
```
Type the **password you use to login** when prompted.

## Steps to reset a Mac

1. Open the Terminal application.
2. Run the install script:

```shell
`cd ~; bash <(curl -s https://raw.githubusercontent.com/spartaglobal/laptop/master/remote-reset)`
```
Type the **password you use to login** when prompted.


## Inspiration

Bits of this script were borrowed from all over the internet, but in particular:

- <https://github.com/attack/laptop>
- <https://github.com/thoughtbot/laptop/>

Initially built by [@dannysmith](http://github.com/dannysmith), edited by [Ollie Holden](http://github.com/odholden).
