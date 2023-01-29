# Multiwfn in Docker

## Introduction

Running Linux version Multiwfn in Docker.

## Usage

### Without GUI

```sh
$ docker pull mizubai/multiwfn:nogui # optional
$ docker run -it --rm -v $(pwd):/source -v /path/to/Multiwfn_noGUI:/opt/Multiwfn_bin mizubai/multiwfn:gui Multiwfn
```

### With GUI

1. Install XQuartz
2. Add `xhost + localhost` to shell profile
3. Run

```sh
$ docker pull mizubai/multiwfn:gui # optional
$ docker run -it --rm -v $(pwd):/source -v /path/to/Multiwfn:/opt/Multiwfn_bin -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=host.docker.internal:0 mizubai/multiwfn:gui Multiwfn
```

### Tips

An alias may helps.

```sh
alias Multiwfn='docker run -it --rm -v $(pwd):/source -v /path/to/Multiwfn:/opt/Multiwfn_bin -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=host.docker.internal:0 mizubai/multiwfn:gui Multiwfn'
```

## Simplified Chinese Version

[Multiwfn 3.8 (dev) on macOS](http://bbs.keinsci.com/thread-29399-1-1.html)
