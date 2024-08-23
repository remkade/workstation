function wordpress_server
	set -l ips (aws ec2 describe-instances \
		--filter 'Name=instance-state-name,Values=running' \
		--fitler 'Name=tag:Application,Value=Wordpress' \
		--output text \
		--color=off \
		--query 'ReservationsInstances[*].Instances[0].{IP:PublicIpAddress}')

	random choice $ips	
end
