#!/bin/sh
install_plexmediaserver () {
	echo ""
	echo " "$step". Installing Plex Media Server..."
	echo ""

	cd /tmp/
 
	wget https://downloads.plex.tv/plex-media-server-new/1.18.6.2368-97add474d/debian/plexmediaserver_1.18.6.2368-97add474d_i386.deb --quiet
	
	# Little fix for containers/LXC running on Ubuntu Server
	mv /sbin/udevadm /sbin/udevadm.bak
	
	touch /sbin/udevadm
	
	chmod +x /sbin/udevadm
	# Little fix for containers/LXC running on Ubuntu Server
	
	dpkg -i plexmediaserver_1.18.6.2368-97add474d_i386.deb
	
	# Little fix for containers/LXC running on Ubuntu Server
	rm /sbin/udevadm
	
	mv /sbin/udevadm.bak /sbin/udevadm
	# Little fix for containers/LXC running on Ubuntu Server
	
	step=$((step+1))
}
