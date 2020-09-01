mdadm --zero-superblock --force /dev/sd{by,c,d,e,f,g}
mdadm --create --verbose /dev/md0 -l 10 -n 6 /dev/sd{b,c,d,e,f,g}
mdadm -D /dev/md0
mkdir /etc/mdadm
echo "DEVICE partitions" > /etc/mdadm/mdadm.conf
mdadm --detail --scan --verbose | awk '/ARRAY/ {print}' >> /etc/mdadm/mdadm.conf

parted -s /dev/md0 mklabel gpt
parted /dev/md0 mkpart primary ext4 0% 20%
parted /dev/md0 mkpart primary ext4 20% 40%
parted /dev/md0 mkpart primary ext4 40% 60%
parted /dev/md0 mkpart primary ext4 60% 80%
parted /dev/md0 mkpart primary ext4 80% 100%

for i in $(seq 1 5); do sudo mkfs.ext4 /dev/md0p$i; done
mkdir -p /raid/part{1,2,3,4,5}

for i in $(seq 1 5); do sudo echo "/dev/md0p$i /raid/part$i ext4 defaults 0 1" >> /etc/fstab; done

sudo mount -a
