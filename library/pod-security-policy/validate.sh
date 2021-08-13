#!/bin/bash
input=$1
while IFS= read -r line
do
  echo  "$line"
  kubectl kustomize $line | kubectl apply -f - --validate=false
  cd "$line"
  ls
  cd samples/*
  ls -lrt
  kubectl apply -f example_disallowed.yaml
  cd ../../../
  pwd
done < "$input"
