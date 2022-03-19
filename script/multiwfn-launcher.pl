#!/usr/local/bin/perl

use Switch;

# constants
$host         = "localhost";
$img_n        = "multiwfn";
$cntr_n       = "multiwfn";
$multiwfn_dir = "path/to/multiwfn/dir";
$ws           = "path/to/shared/dir";

# usage info
$ui = <<EOF;
Usage:

    \$ ./multiwfn-launcher.pl [option]

Avaliable Options:

    -st     --start      Start
    -sp     --stop       Stop
    -r      --restart    Restart
    -cli                 Enter command line
EOF

# options
%opt_hash = (
    st  => ["--start", "-st"],
    sp  => ["--stop", "-sp"],
    r   => ["--restart", "-r"],
    cli => "-cli"
);

# subroutines 
sub chk_sts {
     `docker ps` =~ $cntr_n ? 1 : 0;
}

sub gl_st {
    $st_cmd = <<EOF;
docker run -dt --rm \\
    -v $multiwfn_dir:/opt/Multiwfn_bin \\
    -v $ws:/opt/MultiwfnWorkspace \\
    -v /tmp/.X11-unix:/tmp/.X11-unix \\
    --name $cntr_n \\
    -e DISPLAY=host.docker.internal:0 \\
    $img_n
EOF
    if (chk_sts == 1) {
        warn "There is already a Multiwfn container running!\n";
    } else {
        print "Starting Multiwfn container: $cntr_n, id: " . `$st_cmd`;
    }
}

sub gl_sp {
    $sp_cmd = "docker stop $cntr_n";
    if (chk_sts == 0) {
        warn "No Multifwn container is running!\n";
    } else {
        print "Stopping Multiwfn container: " . `$sp_cmd`;
    }
}

sub gl_cli {
    die "Before entering command line, start a Multiwfn container first.\n" if chk_sts == 0;
    $cli_cmd = "docker exec -it $cntr_n /bin/bash -c 'source /root/.bash_profile && cd /opt/MultiwfnWorkspace && bash'";
    exec $cli_cmd;
}

# execute options
sub gl_exec {
    `xhost + $host` if `xhost` !~ $host;
    die $ui if ($#_ != 0);
    $opt = shift;
    switch ($opt) {
        case ($opt_hash{st})  { gl_st; }
        case ($opt_hash{sp})  { gl_sp; }
        case ($opt_hash{r})   { gl_sp; gl_st; }
        case ($opt_hash{cli}) { gl_cli; }
        else { die "No such option \"$opt\"!\n" }
    }
}

gl_exec @ARGV;
