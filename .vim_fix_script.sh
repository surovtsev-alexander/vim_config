#!/bin/bash

#tr -d '\015' <./pathogen.vim > ./pathogen.vim1

#install vundle
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ets-labs/python-vimrc/master/setup.sh)"
#function main
#{
#
#}

#main
#sed -i 's/\r$//' $1

function fix_file()
{
  echo "fixing file: ${1}"
  sed -i 's/\r$//' $1
}

fix_file $1

