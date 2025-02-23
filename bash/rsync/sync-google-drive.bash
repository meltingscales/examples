rclone lsd meltingscales-google-drive:/

rclone sync meltingscales-google-drive:/Web/        /media/melty/goodrabackup/google-drive-exports/Web/         --progress --checksum --drive-acknowledge-abuse
rclone sync meltingscales-google-drive:/School/     /media/melty/goodrabackup/google-drive-exports/School/      --progress --checksum --drive-acknowledge-abuse
rclone sync meltingscales-google-drive:/Media/      /media/melty/goodrabackup/google-drive-exports/Media/       --progress --checksum --drive-acknowledge-abuse
rclone sync meltingscales-google-drive:/old-2022/   /media/melty/goodrabackup/google-drive-exports/old-2022/    --progress --checksum --drive-acknowledge-abuse
