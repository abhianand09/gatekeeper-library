#!/bin/bash
input=$1
while IFS= read -r line
do
  echo  "$line"
  kubectl --context=$2  kustomize $line | kubectl --context=$2 apply -f - --validate=false
  cd "$line"
  ls
  cd samples/*
  ls -lrt
  kubectl --context=$2 apply -f constraint.yaml
  cd ../../../
  pwd
done < "$input"
