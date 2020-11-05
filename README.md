NOTE:My current linux distro is Parrot OS which is debian based.


# Day 1 - Install Oracle virtual box & Gentoo ISO

command line instructions for installing Oracle virtual box:
 
**$ wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -**

**$ wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -**

**$ sudo apt install software-properties-common**

**$ sudo add-apt-repository "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib**

**$ sudo apt-get install virtualbox-6.1**

 **# virtualbox**

# DAY 2 - Virtual box & Partition preparation

Package unpacking will take place in /usr/src DIR
using Gentoo x86 linux files as basis for practise

## Virtual box settings:
For the settings not mentioned here,default values were used.

 (a). **General**

- Name:Sahara

- Description:Linux from scratch system

(b). **System**

- Boot order:hdd(1st)

- Chipset:ICH9

- Pointing device:PS/2 Mouse and dont forget to remove auto keyboard capture once installation has been completed

(c). **Storage**

- Removed contoller IDE & added Gentoo ISO image

(d). **Network**

- Attached to:Bridged Adapter(to use the hosts IP range)

- Refresh to generate new MAC Address

NEXT STEPS:
- The new LFS partition is called /dev/sda (9gig) partition n.o 1
- 1st sectore 2048 & last sector 3,000,000
- new partition 1 of type linux and is of size 1.4 GiB

----Format partion & create an ext2 file system

**$mke2fs /dev/sda1**

------Mount partition

**$mkdir -p /mnt/lfs**

**$mount /dev/sda1 /mnt/lfs**

NOTE:The directory $LFS is an environment variable

Next step is to create the directories,I  put all the necessary steps in shell script,just execute it or copy paste it in your terminal:

![directory_creation](https://github.com/AndrewMbugua/Linux-from-scratch-Sahara/blob/main/directory_creation.sh)



