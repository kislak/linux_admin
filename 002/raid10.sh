mdadm --zero-superblock --force /dev/sd{b,c,d,e,f,g}
mdadm --create --verbose /dev/md0 -l 10 -n 6 /dev/sd{b,c,d,e,f,g}
mdadm -D /dev/md0
mkdir /etc/mdadm
echo "DEVICE partitions" > /etc/mdadm/mdadm.conf
mdadm --detail --scan --verbose | awk '/ARRAY/ {print}' >> /etc/mdadm/mdadm.conf

parted -s /dev/md0 mklabel gpt
parted /dev/md0 mkpart primary ext4 0% 40%
parted /dev/md0 mkpart primary ext4 40% 80%
parted /dev/md0 mkpart primary ext4 80% 100%

for i in $(seq 1 3); do sudo mkfs.ext4 /dev/md0p$i; done
mkdir -p /raid/part{1,2,3}
for i in $(seq 1 3); do mount /dev/md0p$i /raid/part$i; done
