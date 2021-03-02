# GamingDocker

My take on gaming in Docker with Nvidia passthrough for Linux. Inspired by webanck/docker-wine-steam from a couple of years ago. This one is more up to date.

This docker setup works on Windows too, but requires some dependencies from the Windows and Nvidia Insider Programs to work with WSL2. Finger's crossed that it eventually makes it into public release!

## Side Note
While Docker for Windows makes it very easy to do gpu pass-through now, it doesn't support GUI applications. The GPU is simply for heavy computation. This forces us to use Wine and WSL/Docker for Linux directly. Either way, it is better than spinning up a docker to run KVM/QEMU Windows VMs, and Wine has come a long way.

If you are using WSL, you will need XLaunch or another type of X11 software on the Windows host to give Docker somewhere to send display data.

### Audio
Due to a bunch of changes with pulseaudio packages, this has been put on hold for a bit. Should be fixed in the next release.

## Installation
Clone this repository to get the [Dockerfile](./Dockerfile) and the helper scripts to build and launch a corresponding container.
```
git clone git@github.com:vhfw/GamingDocker.git
cd GamingDocker
./buildit_nix.sh
./run.sh
```

run in shell
```
finalize_installation
```

It will open the Wine configuration tool `winecfg`.

In the Graphics tab, disable windows decorations and set screen resolution.

Wine will then run the Steam setup.

Before playing any game, be sure to turn the Steam overlay off (uncheck Steam->Settings->In-Game->Enable the Steam Overlay) because it's not supported by Wine.

## Subsequent uses and data flow
After the installation is finished, you can leave the container typing `exit` or using the keys `Ctrl+D`.
Your data will remain in the container while you don't delete it, and you can restart it easily with the former launcher script. If you mount a directory to store everything, you only have to install apps once. Though I recommend having one container per game. 

## Future TO-DOs
Add sunshine and moonlight to the container for remote streaming
Fix audio problems
Automate some of the winecfg setup/app install with flags
Wait patiently for WSL to get their stuff together so I can make this work for Windows hosts too
