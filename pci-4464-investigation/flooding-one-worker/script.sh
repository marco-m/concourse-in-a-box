#!/bin/bash -ex

for i in `seq 1 60`; do fly -t ci sp -p parallel${i}-second-linux -c pipeline.yml -n && fly -t ci up -p parallel${i}-second-linux; done

task(){
   fly -t ci tj -j parallel${i}-second-linux/loop;
}

for i in `seq 1 60`; do
  task "$i" &
done
