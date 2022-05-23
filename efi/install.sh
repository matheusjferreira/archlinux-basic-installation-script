#!/bin/bash

###################################
#                                 #
# Arch Linux install script       #
# Author: Matheus Jediel Ferreira #
# 2020                            #
#                                 #
###################################

#download boost
echo "ParallelDownloads = 5" >> /etc/pacman.conf;

boot_hd="/dev/sda1";
home_hd="/dev/sda2";

#create GPT table, and formate partitions (boot and home)
echo -e "g\nn\np\n1\n\n+512M\nt\n1\nw" | fdisk /dev/sda;
echo -e "n\np\n2\n\n\nw" | fdisk /dev/sda;

root_passwd="123456";


#formatted partitions
mkfs.fat -F32 $boot_hd;
mkfs.ext4 $home_hd;

#mounted partitions
mount $home_hd /mnt;
mkdir /mnt/boot;
mount $boot_hd /mnt/boot;

#base package download complete
pacstrap /mnt base base-devel linux linux-firmware git nano grub-efi-x86_64 efibootmgr networkmanager;

#fstab generated
genfstab -p /mnt >> /mnt/etc/fstab;
cat /mnt/etc/fstab;

#root password created
arch-chroot /mnt /bin/bash -c "passwd << EOF
$root_passwd
$root_passwd
EOF";

arch-chroot /mnt /bin/bash -c "grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=arch_grub --recheck";
arch-chroot /mnt /bin/bash -c "grub-mkconfig -o /boot/grub/grub.cfg";

#networkmanager active at startup
arch-chroot /mnt /bin/bash -c "systemctl enable NetworkManager";

echo "";
echo "#############################################";
echo "# Arch Linux install successfully concluded #";
echo "#############################################";
echo "";

exit;