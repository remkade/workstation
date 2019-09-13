function list_snapshots
	aws rds describe-db-snapshots --query 'DBSnapshots[*].{id:DBSnapshotIdentifier,created:SnapshotCreateTime}' --output table
end
