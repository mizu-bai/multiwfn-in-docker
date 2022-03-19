# Multifwn-in-Docker

Package Multifwn in docker

## Usage

First, open `multiwfn-launcher.pl` with editor.

Then you will see such code:

```perl
# constants
$host         = "localhost";
$img_n        = "multiwfn";
$cntr_n       = "multiwfn";
$multiwfn_dir = "path/to/multiwfn/dir";
$ws           = "path/to/shared/dir";
```

Change the `$multiwfn_dir` to where your multiwfn is located, and `$ws` to which directory you want to share.

Now you can run it like

```sh
$ ./multiwfn-launcher.pl [option]
```

Avaliable Options:

| Short  |    Long     |    Introduction    |
|:------:|:-----------:|:------------------:|
| `-st`  |  `--start`  |       Start        |
| `-sp`  |  `--stop`   |        Stop        |
|  `-r`  | `--restart` |      Restart       |
| `-cli` |             | Enter command line |

## Reference

[Multiwfn Official Site](http://sobereva.com/multiwfn/)
