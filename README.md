NOTE:My current linux distro is Parrot OS which is debian based.
What you will see is a simple documentation of the steps I took,my thoughts,the problems I faced and additional resources like link to articles and scripts
Rectifications and additions are welcomed.

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


# DAY 3 - Creating password and group files & install basic system software

Create a new file $LFS/etc/passwd by running the following command:
**echo "root:x:0:0:root:/root:/bin/bash" > $LFS/etc/passwd**

creating a new $LFS/etc/group

echo "root:x:0:" > $LFS/etc/group

echo "bin:x:1:" >> $LFS/etc/group

echo "sys:x:2:" >> $LFS/etc/group

echo "kmem:x:3:" >> $LFS/etc/group

echo "tty:x:4:" >> $LFS/etc/group

echo "uucp:x:5:" >> $LFS/etc/group

echo "daemon:x:6:" >> $LFS/etc/group

echo "floppy:x:7:" >> $LFS/etc/group

echo "disk:x:8:" >> $LFS/etc/group

**N/B the red x that you see up there are colons(:) therefore replace it with a :**


Copy proc devices **N/B:** $LFS/proc/devices won't update when the kernel updates the /proc/devices

The /dev and proc file systems are confusing to new linux users so I chose to throw in an article about it:
 ![Using the /dev and /proc file systems](https://www.linux.com/news/using-dev-and-proc-file-systems/)
 
Ive also added another one on optimisation flags ![Compiler optimisation](https://elinux.org/Compiler_Optimization)
and ![Optimisation in GCC](https://www.linuxjournal.com/article/7269)

**Now to install basic system software** 

Advice from author:

"Please keep in mind that if you find that a package doesn't compile and gives errors like "segmentation fault,
core dumped" it's most likely got to do with these compiler optimizations. Try lowering the optimizing level
by changing −O3 to −O2. If that doesn't work try −O or leave it out all together. Also try changing the −mcpu
and −march variables. Compilers are very sensitive to certain hardware too. Bad memory can cause
compilation problems when a high level of optimization is used, like the −O3 setting. The fact that I don't
have any problems compiling everything with −O3 doesn't mean you won't have any problems either.
Another problem can be the Binutils version that's installed on your system which often causes compilation
problems in Glibc (most noticable in RedHat because RedHat often uses beta software which aren't always
very stable."


I plan to install the most common & some addition system software

(a). GNU compiler collection(GCC)-includes front-ends for C,C++,Objective-c,Fortran,Ada,Go & D.

(b). Babel-Javascript compiler.

(c). Rust compiler.


perform $ls $LFS/root/.bash_profile to know whether bash profile exists


# Day 4 - Creating system boot scripts,Install kernel,test system
Create new directiories that will be used by the boot scripts

**$ cd /etc**

**etc$ mkdir sysconfig rc0.d rc1.d rc2.d rc3.d**

**etc$ mkdir rc4.d rc5.d rc6.d init.d rcS.d**

The next steps are well outlined in the attached LFS guide:
- Create the rc script
- Create the rcS script
- Create the funtions script
- Create the checkfs script
- Create the halt script
- Create the loadkeys script
- Create the mountfs script
- Create the reboot script
- Create the sendsignals script
- Create the setclock script
- Create the /etc/sysconfig/clock file
- Create the sysklogd script
- Create the umountfs script
- Set up symlinks and permissions
- Create the /etc/fstab file

Setting up basic networking

Install netkit-base tools

**$ ./configure −−prefix=/usr**

**$ make**

**$ make install**

**$ cd etc.sample**

**$ cp services protocols /etc**

Install Net tools

**$ make**

**$ make install**

The next steps are well outlined in the attached LFS guide:
- Create network boot scripts
- Set up permissions and symlink
- Create the /etc/sysconfig/network file
- Create the /etc/hosts file
- Create the /etc/init.d/ethnet script
- Editing the /etc/sysconfig/network file
- Setting up permissions and symlink

And now for what I think is the whale in all of this

**Making the LFS system bootable**

I have chosen to attach an article that explains what a kernel is [Kernel in operating systems](https://www.geeksforgeeks.org/kernel-in-operating-system/)


This last bit draws instructions outlined in the guide,as the aithor says,"If you dont like the way the kernel is configured,read the README file and find out what other options there are"

**$ Installing a kernel**

**$ make mrproper**

**$ make menuconfig**

**$ make dep**

**$ make bzImage**

**$ make modules**

**$ make modules_install**

**$ cp arch/i386/boot/bzImage /boot/lfskernel**

**$ cp System.map /boo**


**Adding an entry to LILO**
Not that i know what this is as of this writing LOL but lets continue


Add the following
lines to lilo.conf:
image=/boot/lfskernel
label=lfs
root=<sda1>
read−only

Now update the boot loader

**$ lilo**


## End remarks

This is a hands-on LFS project that I attempted inorder to gain a deeper understanding of Linux,I used the instructions detailed in the **linux from scratch** book that I have also added to this repository.

Enjoy building your own LFS,IT WAS FUN!,challenging but FUN! 
cheerio (:wave:)


**Author:Andrew Precious Mbugua**


