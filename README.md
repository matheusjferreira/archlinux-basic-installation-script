> # Arch Linux Basic Installation Script:

> ## The Project:
Simple script and easy to change to facilitate the installation of arch linux.

> :warning: I used the device "sda" in this script, you can change it as per your need. Example: "sdx", "nvme0n1".

> ### How to use:

Download the git package and update pacman at the same time:

	pacman -Sy git

Clone this repository:

	git clone https://github.com/matheusjferreira/script-arch-install-base

Enter the "script-arch-install-base" folder:

	cd script-arch-install-base

Enter your installation type folder, (bios or efi):

	cd bios

Or:

	cd efi

Grant permission to run the script:

	chmod +x install.sh

Run the script:

	./install.sh


> ### For dual boot:

Comment out the following lines in the script:

	BIOS

	echo -e "n\np\n1\n\n+512M\nt\n1\nw" | fdisk /dev/sda;
	echo -e "n\np\n2\n\n\nw" | fdisk /dev/sda;

	EFI

	echo -e "g\nn\np\n1\n\n+512M\nt\n1\nw" | fdisk /dev/sda;
	echo -e "n\np\n2\n\n\nw" | fdisk /dev/sda;

And do your manual partitioning using "cfdisk".

Don't forget to change the value of the variables in the "install.sh" file:

	boot_hd="/dev/sda1" for boot_hd="/dev/sda5"
	home_hd="/dev/sda2" for home_hd="/dev/sda6"

Add "os-prober ntfs-3g" to the pacstrap command.

Also feel free to change the device (/dev/sda) used in this script to your liking to install on another device (/dev/sdb).

> ## License:

	MIT License

	Copyright (c) 2022 Matheus Ferreira

	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in all
	copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
	SOFTWARE.
