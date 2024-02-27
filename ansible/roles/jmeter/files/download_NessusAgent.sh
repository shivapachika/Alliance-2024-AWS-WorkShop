#!/bin/sh

auth_file='/c/apps/jmeter/workerdata/aws-jmeter-worker.pem'
dest_path='/opt/userdata'
src_path=' /c/Users/yvonne.fang/Downloads/'
rpm_file="NessusAgent-10.4.2-amzn2.x86_64.rpm"

declare -A workernode_files
# workernode_files['10.49.24.25']=${node1_files}
workernode_files['10.49.24.26']=${node2_files}
workernode_files['10.49.24.27']=${node3_files}

for node in ${!workernode_files[@]}; do
  echo "Copy rpm to " $node
  scp -i ${auth_file} ${src_path}/${rpm_file} ec2-user@${node}:${dest_path}/${rpm_file}
  echo "Done"
done

