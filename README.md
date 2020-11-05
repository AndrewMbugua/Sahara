NOTE:My current linux distro is Parrot OS which is debian based.


# Day 1 - Install Oracle virtual box & Gentoo ISO

command line instructions for installing Oracle virtual box:
 
**$ wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -**

**$ wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -**

**$ sudo apt install software-properties-common**

**$ sudo add-apt-repository "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib**

**$ sudo apt-get install virtualbox-6.1**

 **# virtualbox**

# DAY 2 - Virtual box configurations

Package unpacking will take place in /usr/src DIR
using Gentoo x86 linux files as basis for practise

## Virtual box settings:
For the settings not mentioned here,default values were used.

 (a). **General**

Name:Sahara

Description:Linux from scratch system

(b). **System**

Boot order:hdd(1st)

Chipset:ICH9

Pointing device:PS/2 Mouse

(c). **Storage**

Removed contoller IDE & added Gentoo ISO image

(d). **Network**

Attached to:Bridged Adapter(to use the hosts IP range)

Refresh to generate new MAC Address
