function list_instances
  aws ec2 describe-instances \
    --query 'Reservations[*].Instances[0].{ID:InstanceId,Name:Tags[?Key==`Name`].Value | [0],IP:PublicIpAddress,AMI:ImageId,Type:InstanceType,Status:State.Name}' \
    --output table \
    --color=off
end
