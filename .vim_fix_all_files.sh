#!/bin/bash

function iterate_array()
{
  arr=("$@")
  for item in "${arr[@]}"
  do
    #echo "item: ${item}"
    ./.vim_fix_script.sh ${item}
  done
}

function main()
{
  files=( $(find .vim -type f -name "*.vim") )

  #echo "${files[*]}"

  iterate_array "${files[@]}"
}

main
