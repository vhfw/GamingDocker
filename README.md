# GamingDocker

My take on gaming in Docker with Nvidia passthrough for Linux. Inspired by webanck/docker-wine-steam from a couple of years ago. This one is more up to date.

This docker setup works on Windows works too, but requires some dependencies from the Windows and Nvidia Insider Programs to work with WSL2. Finger's crossed that it eventually makes it into public release!

### Audio
Due to a bunch of changes with pulseaudio packages, this has been put on hold for a bit. Should be fixed in the next release.

## Installation
Clone this repository to get the [Dockerfile](./Dockerfile) and the helper scripts to build and launch a corresponding container.
```
git clone https://github.com/webanck/docker-wine-steam.git
cd docker-wine-steam
./builder.sh
./launcher.sh
```
Then you should be inside the container as the wine user. The last steps are an ultimate Wine configuration and the installation of Steam (which you can skip if you just want to use Wine for Windows games/applications).

```
finalize_installation
```
It will open the Wine configuration tool `winecfg`.
My advice: let Windows XP as default.
In the Audio tab, choose pulseaudio for each device.

![audio tab configuration](./winecfg-audio.png)

In the Graphics tab, I recommend to disable windows decorations and to emulate a virtual desktop of your screen's resolution.

![graphics tab configuration](./winecfg-graphics.png)

After the installation of Steam, you can simply use the provided alias `steam` to launch it.
Before playing any game, be sure to turn the Steam overlay off (uncheck Steam->Settings->In-Game->Enable the Steam Overlay) because it's not supported by Wine.

## Subsequent uses and data flow
After the installation is finished, you can leave the container typing `exit` or using the keys `Ctrl+D`.
Your data will remain in the container while you don't delete it, and you can restart it easily with the former launcher script.
```
./launcher.sh
```
You might want to copy some files into the [shared_directory](shared_directory) which is mounted in the home of the wine user. Some scripts are provided to help you [import](shared_directory/importSteam.sh) or [export](shared_directory/exportSteam.sh) quickly your steam installation.

## Motivation
Have you ever tried to install Wine?
And have you ever tried to install Wine while using CUDA on your system?
Well, if you have not, do not try, it's messy.
