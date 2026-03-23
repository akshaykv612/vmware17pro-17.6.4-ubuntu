systemctl stop vmware.service
sudo /etc/init.d/vmware stop
service-control --stop --all

sudo vmware-installer -u vmware-workstation || sudo vmware-installer -u vmware-player

sudo rm -rf /etc/vmware/
sudo rm -rf /usr/lib/vmware/
sudo rm -rf /usr/bin/vmware-*
sudo rm -rf /usr/share/doc/vmware-*

sudo rm /etc/init.d/vmware
sudo rm -rf /etc/rc*.d/*vmware*

rm -rf /usr/share/applications/vmware-netcfg.desktop
rm -rf /usr/share/applications/vmware-player.desktop
rm -rf /usr/share/applications/vmware-workstation.desktop

sudo /usr/bin/vmware-uninstall-tools.pl


sudo vmware-installer --uninstall-product vmware-workstation || sudo vmware-installer --uninstall-product vmware-player
sudo rm -rf /usr/lib/vmware/
 echo "......vmware uninstallation completed......"
 timeout 10s
 exit

