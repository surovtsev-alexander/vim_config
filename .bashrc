# To the extent possible under law, the author(s) have dedicated all 
# copyright and related and neighboring rights to this software to the 
# public domain worldwide. This software is distributed without any warranty. 
# You should have received a copy of the CC0 Public Domain Dedication along 
# with this software. 
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>. 

# base-files version 4.2-4

# ~/.bashrc: executed by bash(1) for interactive shells.

# The latest version as installed by the Cygwin Setup program can
# always be found at /etc/defaults/etc/skel/.bashrc

# Modifying /etc/skel/.bashrc directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bashrc) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benifitial to all, please feel free to send
# a patch to the cygwin mailing list.

# User dependent .bashrc file

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Shell Options
#
# See man bash for more options...
#
# Don't wait for job termination notification
# set -o notify
#
# Don't use ^D to exit
# set -o ignoreeof
#
# Use case-insensitive filename globbing
# shopt -s nocaseglob
#
# Make bash append rather than overwrite the history on disk
# shopt -s histappend
#
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
# shopt -s cdspell

# Completion options
#
# These completion tuning parameters change the default behavior of bash_completion:
#
# Define to access remotely checked-out files over passwordless ssh for CVS
# COMP_CVS_REMOTE=1
#
# Define to avoid stripping description in --option=description of './configure --help'
# COMP_CONFIGURE_HINTS=1
#
# Define to avoid flattening internal contents of tar files
# COMP_TAR_INTERNAL_PATHS=1
#
# Uncomment to turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
# [[ -f /etc/bash_completion ]] && . /etc/bash_completion

# History Options
#
# Don't put duplicate lines in the history.
# export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
#
# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
# export HISTIGNORE=$'[ t]*:&:[fb]g:exit'
# export HISTIGNORE=$'[ t]*:&:[fb]g:exit:ls' # Ignore the ls command as well
#
# Whenever displaying the prompt, write the previous line to disk
# export PROMPT_COMMAND="history -a"

# Aliases
#
# Some people use a different file for aliases
# if [ -f "${HOME}/.bash_aliases" ]; then
#   source "${HOME}/.bash_aliases"
# fi
#
# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a  before, ie
# rm will call the real rm not the alias.
#
# Interactive operation...
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'
#
# Default to human readable figures
# alias df='df -h'
# alias du='du -h'
#
# Misc :)
# alias less='less -r'                          # raw control characters
# alias whence='type -a'                        # where, of a sort
# alias grep='grep --color'                     # show differences in colour
# alias egrep='egrep --color=auto'              # show differences in colour
# alias fgrep='fgrep --color=auto'              # show differences in colour
#
# Some shortcuts for different directory listings
# alias ls='ls -hF --color=tty'                 # classify files in colour
# alias dir='ls --color=auto --format=vertical'
# alias vdir='ls --color=auto --format=long'
# alias ll='ls -l'                              # long list
# alias la='ls -A'                              # all but . and ..
# alias l='ls -CF'                              #

# Umask
#
# /etc/profile sets 022, removing write perms to group + others.
# Set a more restrictive umask: i.e. no exec perms for others:
# umask 027
# Paranoid: neither group nor others have any perms:
# umask 077

# Functions
#
# Some people use a different file for functions
# if [ -f "${HOME}/.bash_functions" ]; then
#   source "${HOME}/.bash_functions"
# fi
#
# Some example functions:
#
# a) function settitle
# settitle () 
# { 
#   echo -ne "e]2;$@ae]1;$@a"; 
# }
# 
# b) function cd_func
# This function defines a 'cd' replacement function capable of keeping, 
# displaying and accessing history of visited directories, up to 10 entries.
# To use it, uncomment it, source this file and try 'cd --'.
# acd_func 1.0.5, 10-nov-2004
# Petar Marinov, http:/geocities.com/h2428, this is public domain
# cd_func ()
# {
#   local x2 the_new_dir adir index
#   local -i cnt
# 
#   if [[ $1 ==  "--" ]]; then
#     dirs -v
#     return 0
#   fi
# 
#   the_new_dir=$1
#   [[ -z $1 ]] && the_new_dir=$HOME
# 
#   if [[ ${the_new_dir:0:1} == '-' ]]; then
#     #
#     # Extract dir N from dirs
#     index=${the_new_dir:1}
#     [[ -z $index ]] && index=1
#     adir=$(dirs +$index)
#     [[ -z $adir ]] && return 1
#     the_new_dir=$adir
#   fi
# 
#   #
#   # '~' has to be substituted by ${HOME}
#   [[ ${the_new_dir:0:1} == '~' ]] && the_new_dir="${HOME}${the_new_dir:1}"
# 
#   #
#   # Now change to the new dir and add to the top of the stack
#   pushd "${the_new_dir}" > /dev/null
#   [[ $? -ne 0 ]] && return 1
#   the_new_dir=$(pwd)
# 
#   #
#   # Trim down everything beyond 11th entry
#   popd -n +11 2>/dev/null 1>/dev/null
# 
#   #
#   # Remove any other occurence of this dir, skipping the top of the stack
#   for ((cnt=1; cnt <= 10; cnt++)); do
#     x2=$(dirs +${cnt} 2>/dev/null)
#     [[ $? -ne 0 ]] && return 0
#     [[ ${x2:0:1} == '~' ]] && x2="${HOME}${x2:1}"
#     if [[ "${x2}" == "${the_new_dir}" ]]; then
#       popd -n +$cnt 2>/dev/null 1>/dev/null
#       cnt=cnt-1
#     fi
#   done
# 
#   return 0
# }
# 
# alias cd=cd_func

shopt -s dotglob
export LANG="en_US.UTF-8"
export EDITOR="vim"
set -o igncr
export SHELLOPTS

function getsvnc ()
{
  if [[ -z $1 ]] ; then
    svn up
    svn diff -c `svn info | grep -a ^Rev | cut -c11-` | vim -
  else
    svn diff -c $1 | vim -
  fi
}

function getsvnlog ()
{
  if [[ -z $1 ]] ; then
    svn log -v -l 100 | vim -
  else
    svn log -v -l $1 | vim -
  fi
}

function lsvndiff ()
{
  svn diff | vim -
}

function lsvndiff_ignore_space_change ()
{
  svn diff -x --ignore-space-change | vim -
}

function maketagshere ()
{
  ctags -R -h "+.inl.INL" --langmap=C:+.inl.INL.c.C.h.H --c-kinds=+p --fields=+iaS --extra=+q --exclude="build" -I ZB_CALLBACK,ZB_SDCC_REENTRANT,ZB_SDCC_BANKED .
}

function store_tx_power ()
{
  cp "/cygdrive/d/development/store_tx_power.bat" "./store_tx_power/store_tx_power.bat"
  "./store_tx_power/store_tx_power.bat"
}

function delete_no_under ()
{
  echo "svn status | grep ^? | cut -c9- | xargs -d n rm -r"
}

function svnclearnotmodified ()
{
  svn st --no-ignore | grep ^[?I~] | cut -c 9- | xargs -0 -d"n" -Ix rm -fr x
}

function svnrmmissing ()
{
  svn st --no-ignore | grep ^! | cut -c 9- | xargs -0 -d"n" -Ix svn rm --force x
}

function svns ()
{
  svn st --no-ignore
}

function svnsall ()
{
#  cd /cygdrive/d/data/zigbee/trunk
#  svn status --no-ignore
echo
}

function svnsmod ()
{
  svn st --no-ignore | grep -v ^[?I]
}

function svnupdateall ()
{
#  cd /cygdrive/d/data/zigbee/trunk
#  svn up
echo
}

function wipegarbage ()
{
  rm ~/.viminfo
  rm ~/.bash_history
  rm -r ~/.cache
  rm -r ~/.config
  rm -r ~/.local
  rm ~/.lesshst
  rm -r ~/.wireshark
  rm -r ~/.vim
  mkdir -p ~/.vim/undodir
  history -c
}

function make_dfu_now ()
{
  CURRENT_DIRECTORY=`pwd`
  DD="/cygdrive/c/users/mikhail/downloads"
  WD="c:usersmikhaildownloads"
  rm -fr ${DD}/lcgw_firmware.hex
  cd "/cygdrive/c/program files/dfuse-tool-master"
  if [[ -f ${DD}/lcgw_application.hex && -f ${DD}/lcgw_boot_loader.hex && -f ${DD}/lcgw_config_data.hex ]];
  then
    /cygdrive/c/python27/python dfu-convert --ihex ${WD}lcgw_application.hex --ihex ${WD}lcgw_boot_loader.hex --ihex ${WD}lcgw_config_data.hex -D 0x0483:0xdf11 ${WD}lcgw_firmware.dfu
  fi
  cd ${CURRENT_DIRECTORY}
}

function make_fwupgr_image_now ()
{
  CURRENT_DIRECTORY=`pwd`
  H2B="/cygdrive/c/Program Files (x86)/IAR Systems/Embedded Workbench 6.4/arm/examples/Micronas/tools/hex2binConverter/hex2bin.exe"
  cd /cygdrive/c/users/mikhail/downloads
  rm -fr lcgw_application.bin lcgw_fwupgr_image.bin read.bin write.bin
  "${H2B}" -e bin -c lcgw_application.hex
  mv -f lcgw_application.bin read.bin
  cp -fr /cygdrive/d/data/zigbee/branches/lcgw/application/bootloader/gw_bootloader/create_fw_with_hash16/create_image/debug/create_image.exe .
  ./create_image.exe read.bin write.bin
  mv -f write.bin lcgw_fwupgr_image.bin
  rm -fr create_image.exe read.bin
  cd ${CURRENT_DIRECTORY}
}

function make_3_in_1_image_now ()
{
  CURRENT_DIRECTORY=`pwd`
  cd /cygdrive/c/users/mikhail/downloads
  rm -fr lcgw_firmware.hex
  cat lcgw_boot_loader_with_config_data.hex lcgw_application.hex > lcgw_firmware.hex
  cd ${CURRENT_DIRECTORY}
}


function copy_crash_trace_renamer_here()
{
  cp ~/tools/copy_trace_dump/crash_trace_renamer.sh .
  cp ~/tools/copy_trace_dump/extract_from_dirs.sh .
}

alias ls='ls --classify --color --human-readable --group-directories-first'
alias l='ls --classify --color --human-readable --group-directories-first'
alias ll='ls -l --classify --color --human-readable --group-directories-first'


function fix_file()
{
  f_n=$1
  f_n_a="${f_n}a"

  tr -d '\015' < ${f_n} > ${f_n_a}
  mv ${f_n_a} ${f_n}
}

function count_python()
{
  find . -name '*.py' | xargs wc -l
}

