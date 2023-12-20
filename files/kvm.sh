#!/bin/bash

dialog --title "Starmoe QEMU Script" --msgbox " Welcome to Starmoe KVM installer! Choose Ok to continue." 10 60

{
    for ((i = 0 ; i <= 100 ; i+=20)); do
        sleep 1
        echo $i

    done
} | dialog --gauge "Please wait while installing" 6 60 0

 sudo apt install wget qemu-system-x86-64 qemu-utils -qq -y

 if (dialog --title "EFI Need" --yesno "Do you need EFI?" 10 60) then
    wget https://eastcation.github.io/OVMF.fd
else
    echo "You chose No. Exit status was $?."
fi

OPTION=$(dialog --title "OS Choice" --menu "Choose your download system." 15 60 4 \
"1" "Windows Server 2016" \
"2" "Windows Server 2012 R2" \
"3" "Ubuntu 20.04 LTS" \
"4" "Debian mini"  3>&1 1>&2 2>&3)
 
exitstatus=$?
if [ $OPTION = 1 ]; then
    wget https://download.microsoft.com/download/B/5/F/B5F1A996-B590-45FD-BA99-DE7E745A0882/14393.0.161119-1705.RS1_REFRESH_SERVER_EVAL_X64FRE_ZH-CN.ISO
    mv "14393.0.161119-1705.RS1_REFRESH_SERVER_EVAL_X64FRE_ZH-CN.ISO" install.iso
elif [ $OPTION = 2 ]; then
    wget https://download.microsoft.com/download/D/6/7/D675380B-0028-46B3-B47F-A0646E859F76/
    mv "9600.17050.WINBLUE_REFRESH.140317-1640_X64FRE_SERVER_EVAL_ZH-CN-IR3_SSS_X64FREE_ZH-CN_DV9.ISO" install.iso
elif [ $OPTION = 3 ]; then
    wget https://mirrors.tuna.tsinghua.edu.cn/ubuntu-releases/focal/ubuntu-20.04.6-desktop-amd64.iso
    mv ubuntu-20.04.6-desktop-amd64.iso install.iso
else
    wget https://mirrors.tuna.tsinghua.edu.cn/debian-cd/current/amd64/iso-cd/debian-12.2.0-amd64-netinst.iso
    mv debian-12.2.0-amd64-netinst.iso install.iso
fi

{
    for ((i = 0 ; i <= 100 ; i+=20)); do
        sleep 1
        echo $i
    done
} | dialog --gauge "Downloading virtio-win Driver" 6 60 0

wget https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/latest-virtio/virtio-win.iso

{
    for ((i = 0 ; i <= 100 ; i+=20)); do
        sleep 1
        echo $i
        qemu-img create hdd.vhd -f vpc 128G
    done
} | dialog --gauge "Creating start script" 6 60 0
echo "qemu-system-x86_64 -m 2G -M q35 -drive file=hdd.vhd,if=virtio -vga virtio -soundhw hda -device qemu-xhci -device usb-kbd -device usb-tablet -drive file=virtio-win.iso,media=cdrom,if=none,id=cdrom -device usb-storage,drive=cdrom -cdrom install.iso -pflash OVMF.fd -nic user,model=virtio --enable-kvm" >> start.sh
dialog --title "Starmoe QEMU Script" --msgbox " All done! You should type “sudo bash start.sh” to run VM. Choose Ok to close." 10 60
