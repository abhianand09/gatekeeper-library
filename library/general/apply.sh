#!/bin/bash
input=$1
while IFS= read -r line
do
  echo  "$line"
  cd "$line"
  ls
  kubectl apply -f kustomization.yaml 
  cd samples/*
  ls -lrt
  kubectl apply -f constraint.yaml
  cd ../../../
  pwd
done < "$input"
