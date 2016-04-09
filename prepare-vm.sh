if [ -z "$1" ]
  then
    printf "\nERROR: VM name or ID required. Your VMs:\n\n`VBoxManage list vms`\n\n"
    exit 1
fi

VBoxManage setextradata "$1" "VBoxInternal/Devices/pcbios/0/Config/DmiSystemUuid" `sudo dmidecode -t1 | grep -i uuid | grep -o '[^ ]*$'`
VBoxManage modifyvm "$1" --hardwareuuid `uuidgen -r`