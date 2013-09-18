#!/bin/bash

# Pfad für symbolischen Link zu rumex-vim.sh bauen
VIM=`readlink -f $0| perl  -ne 'chop; $_ =~ m/(.*)rumex-tilda.sh/; print $1. "rumex-vim.sh";'`
/usr/bin/tilda -c  $VIM
