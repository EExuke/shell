Shell config example reference from Rain

functions-simple
    1.mkdir ~/bin
    2.download functions-simple to your ~/bin
    3.change ~/.bashrc to add

        if [ -f ~/bin/functions-simple ]; then
        . ~/bin/functions-simple
        dir 1
        dir <project>
        fi

CC
    if compile for broadcom, add the following to ~/.bashrc,

        export ENV_PROJ_TYPE=EPT_SWITCH_RTK_MIPS

    else add following to ~/.bashrc

        export ENV_PROJ_TYPE=EPT_SWITCH_iProcLDK

commands in functions-simple
    1.Sync - create ctags and cscope file
    2.dir - choose project root dir
    3.sw - switch dir command
    4.config - make menuconfig
    5.p - ping
    6.p6 - ping6
    7.f - find a file
    8.g - grep keywork
    9.gi - grep keywork ignore case
   10.clone - clone switch project easily

