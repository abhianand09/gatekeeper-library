#!/bin/bash
input=$1
while IFS= read -r line
do
  echo  "$line"
  cd "$line"
  ls
  cd samples/*
  ls -lrt
  kubectl apply -f example_disallowed.yaml -n dev
  cd ../../../
  pwd
done < "$input"
