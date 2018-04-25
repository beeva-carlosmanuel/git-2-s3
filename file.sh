#!/bin/bash
# **********************************************************
# LEER CONFIGURACIÓN DE S3
# Establecemos el nombre del bucket en el fichero .s3config y leemos su configuración
clear
OIFS=$IFS;
IFS="=";

RED='\e[31m'
BLUE='\e[34m'
NC='\e[39m' # No Color
s3configFile=./.s3config
if [ -f $s3configFile ]; then
  while read -r line
  do
		if [ "$line" ]; then
      if [[ $line = *"="* ]]; then
        lineArray=($line);

        if [[ ${lineArray[0]} = "bucket" ]]; then
          bucket=${lineArray[1]}
        fi

        if [[ ${lineArray[0]} = "branch" ]]; then
          branch=${lineArray[1]}
        fi

        # for ((i=0; i<${#lineArray[@]}; ++i)); do
        #   echo "valor $i: ${lineArray[$i]}"; 
        # done

      fi
		fi    
  done < "$s3configFile"

  echo -e "bucket: ${BLUE} $bucket ${NC}"
  echo -e "branch: ${BLUE} $branch ${NC}"
else
  echo >&2 "File .s3config does not exist in you repository and is necesary to push to your s3 repo."
fi
