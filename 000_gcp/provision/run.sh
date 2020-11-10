uname=$(uname -a)
ver=$(cat /etc/debian_version)
echo "== BEGIN: vagrant provisioning on '${uname}'"
echo "== DEBIAN VERSION: ${ver}"
echo "== UPDATING repositories and packages"
/usr/bin/apt-get update -y -qq > /dev/null 2>&1
/usr/bin/apt-get upgrade -y -qq > /dev/null 2>&1
extip=$(curl -s http://metadata/computeMetadata/v1/instance/network-interfaces/0/access-configs/0/external-ip -H "Metadata-Flavor: Google")
echo "== EXTERNAL IP: ${extip}"
echo "== APPENDING /etc/motd"
d=$(date +%r)
echo "# ${d}" >> /etc/motd
echo "== cat /etc/motd"
cat /etc/motd
