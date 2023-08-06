# virtualmic/pulseaudio <!-- omit in toc --> 

<h4 align="center">Script Bash to set virtual microphone to OBS with PulseAudio</h4>

&nbsp;

<div align="center">

<a href="./LICENSE">
	<img alt="License: MIT" src="https://img.shields.io/badge/MIT-License-yellow.svg">
</a>
<a href="./CODE_OF_CONDUCT.md">
	<img alt="Contributor covenant: 2.1" src="https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg">
</a>
<a href="https://semver.org/">
	<img alt="Semantic Versioning: 2.0.0" src="https://img.shields.io/badge/Semantic--Versioning-2.0.0-a05f79?logo=semantic-release&logoColor=f97ff0">
</a>

<a href="./issues/new/choose">Report Bug</a>
·
<a href="./issues/new/choose">Request Feature</a>

<a href="https://twitter.com/intent/tweet?text=👋%20Check%20this%20amazing%20repo%20https://github.com/mauroalderete/coding-projects-template,%20created%20by%20@_mauroalderete%0A%0A%23DEVCommunity%20%23100DaysOfCode%20%23Golang%20%23gcode">
	<img src="https://img.shields.io/twitter/url?label=Share%20on%20Twitter&style=social&url=https%3A%2F%2Fgithub.com%2Fatapas%2Fmodel-repo">
</a>

</div>

- [Introducing](#introducing)
- [How to work?](#how-to-work)
- [Installation](#installation)
- [Usage](#usage)
	- [Creating a Channel](#creating-a-channel)
	- [Disabling a Channel](#disabling-a-channel)
	- [Listing Existing Channels](#listing-existing-channels)
	- [Help](#help)
- [Practical Examples](#practical-examples)
	- [Using a Virtual Microphone in OBS to Inject Audio](#using-a-virtual-microphone-in-obs-to-inject-audio)
	- [Using a Virtual Microphone in Discord to Talk](#using-a-virtual-microphone-in-discord-to-talk)
	- [Configure a Virtual Microphone at Start the System](#configure-a-virtual-microphone-at-start-the-system)
- [Code of conduct](#code-of-conduct)


&nbsp;
## Introducing

Manage channels of audio source composed by virtual speakers and virtual microphones.

- Allow load a new channel with PulseAudio temporally.
- Allow unload the channel upped previously.
- Allow list all channels created.

> This script is based on the answer of [Broadways8701](https://obsproject.com/forum/members/broadways8701.428018/) in [OBS Forum](https://obsproject.com/forum/) to thread [Audio output whit the virtual camera](https://obsproject.com/forum/threads/audio-output-with-the-virtual-camera.155140/)


## How to work?

This script use the PulseAudio module [module-pipe-source](https://www.freedesktop.org/wiki/Software/PulseAudio/Documentation/User/Modules/#module-pipe-source) to create a virtual microphone and [module-pipe-sink](https://www.freedesktop.org/wiki/Software/PulseAudio/Documentation/User/Modules/#module-pipe-sink) to create a virtual speaker.

The script creates a new virtual microphone and speaker with the `_Mic` and `_Speaker` prefix respectively. Additionally, a sync file with `_Sink` prefix is created to sync the virtual speaker with the virtual microphone, creating a channel.

Softwares such as OBS can use the virtual speaker `_Speaker` pipeline as a monitoring device and inject audio in the channel to send it to the virtual mic `_Mic`.
Other softwares such as Discord or Google Meets can use the virtual microphone `_Mic` as input and revice the audio injected.

This is very useful to stream with OBS and use Discord or Google Meets to talk with other people with your own filters and customize your voice.

## Installation

To install the script, clones this repository and execute `install.sh` file with root permissions. For example:

```bash
git clone https://github.com/mauroalderete/virtualmic-pulseaudio
cd virtualmic-pulseaudio
sudo bash install.sh
```

This copy the main script to /usr/local/bin and does it accesible from any terminal. It will install the dependencies too.

## Usage


Once the `virtualmic` script is installed, you can manage your virtual microphones and speakers using the following commands:

### Creating a Channel

To create a new virtual audio channel, use the `up` command. By default, this channel will be named "virtualmic", but you can specify a different name using the `--channel` or `-c` option.

```bash
virtualmic up
```

To create a channel with a specific name, e.g., "streaming":

```bash
virtualmic up --channel streaming
```

### Disabling a Channel

To disable a virtual audio channel you no longer need, use the down command. Just like with the up command, the default channel name is "virtualmic", but you can specify a different name using the --channel or -c option.

```bash
virtualmic down
```

To disable a channel with a specific name, e.g., "streaming":

```bash
virtualmic down --channel streaming
```

### Listing Existing Channels

If you want to see a list of all the channels you've created, use the list command:

```bash
virtualmic list
```

### Help

To get an overview and a list of all available options, you can use the help command:

```bash
virtualmic help
```

## Practical Examples

### Using a Virtual Microphone in OBS to Inject Audio

1. Create a new virtual microphone channel:

```bash
virtualmic up --channel obs
```

2. Open OBS and go to Settings > Audio > Advanced. Set "Monitoring Device" to the `obs_Speaker`. Remember select the "Speaker" pipeline.

3. Select a audio source on your audio mixer and set "Audio Monitoring" to "Monitor and Output".
> With this configuration, you can send the audio source to the virtual speaker with all filters and effects applied.

4. When you're done, disable the virtual microphone:

```bash
virtualmic down --channel obs
```

### Using a Virtual Microphone in Discord to Talk

1. Create a new virtual microphone channel:

```bash
virtualmic up --channel discord
```

2. Open Discord and go to Settings > Voice & Video. Set "Input Device" to the `discord_Mic`. Remember select the "Microphone" pipeline.
> With this setup, Discord will capture the audio routed through the discord_Speaker channel, even if the source is another application, such as OBS..

3. When you're done, disable the virtual microphone:

```bash
virtualmic down --channel discord
```

### Configure a Virtual Microphone at Start the System

Each you session is restarted the audio channel created is lost. To avoid this, you can add in your bash script `~/.bashrc` the command to create the channel.

```bash
virtualmic up --channel obs
```

Or execute the next line to this add for you.

```bash
echo "virtualmic up --channel obs" >> ~/.bashrc
```

Remember change the channel name if you need it.

The next time you start your session, the channel will be created automatically.

## Code of conduct

`/CODE_OF_CONDUCT.md`

This code is based on the covenant code. He is only required to specify an email address to the community to send his messages. Now, this email is alderete.mauro@gmail.com.
