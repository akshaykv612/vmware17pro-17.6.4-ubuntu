echo "installing vmware on ubuntu"

sudo apt update -y && sudo apt upgrade -y

sudo apt install build-essential

sudo apt install gcc-12 -y

sudo apt install -y build-essential linux-headers-$(uname -r) gcc make perl dkms net-tools openssl -y

cd Downloads/ || cd /Downloads && cd vmware_install

chmod +x VMware-Workstation-Full-*.bundle

sudo ./VMware-Workstation-Full-*.bundle

timeout 5s

cd vmware-host-modules

git checkout workstation-17.6.4

make

sudo make install

sudo systemctl restart vmware

rm -rf /usr/lib/vmware/modules/source/*

tar -cvf vmmon.tar vmmon-only && tar -cvf vmnet.tar vmnet-only

sudo apt install open-vm-tools-desktop -y || sudo dnf install open-vm-tools -y

cp vmmon.tar vmnet.tar /usr/lib/vmware/modules/source/

sudo vmware-modconfig --console --install-all -y

sudo dnf install xorg-x11-drv-vmware

sudo /etc/init.d/vmware restart

echo "......vmware installation completed......."
timeout 10s

vmware


