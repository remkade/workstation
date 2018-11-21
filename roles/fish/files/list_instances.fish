function list_instances
	aws ec2 describe-instances | \
		jq '[.Reservations[] | .Instances[] |
			{
				id: .InstanceId,
				ip: .PublicIpAddress,
				image: .ImageId,
				tags: .Tags | from_entries
			}
		]'
end
