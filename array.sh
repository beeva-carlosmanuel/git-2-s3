#!/bin/bash

OIFS=$IFS;
IFS="|";

animals="dog|cat|fish|squirrel|bird|shark";
animalArray=($animals);

for ((i=0; i<${#animalArray[@]}; ++i)); do     echo "animal $i: ${animalArray[$i]}"; done

IFS=$OIFS;
