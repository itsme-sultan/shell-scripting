#!/bin/bash

MNT_log="/var/log/maintenance.log"

echo " $(date +%y-%m-%d-%H-%M-%S) - Running maintenance script"  |tee -a "$MNT_log"

log_rot() {

	echo "Log rotation started..."

	sudo bash ./log_rotate.sh /var/log/myapp |tee -a "$MNT_log"
}

backup_rot() {

	echo "Backup started..."
	bash ./backup.sh /home/sultan/data /home/sultan/backups |tee -a "$MNT_log"

}

log_rot

backup_rot
