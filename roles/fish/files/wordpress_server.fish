function wordpress_server
	random choice (aws ec2 describe-instances \
		--filter 'Name=instance-state-name,Values=running' \
		--filter 'Name=tag:Application,Values=Wordpress' \
		--output text \
		--color=off \
		--query 'Reservations[*].Instances[*].PublicIpAddress')
end
