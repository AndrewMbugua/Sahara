## Problems faced

1. Keyboard and mouse were captured by the V.B and rendered unusable outside it.Fixed by rectifying some settings

2. After typing away and executing multiple cmds using an in built while loop,I got close to 100 "cannot create directory": read only file system...what a waste

--I tried to retrace my steps and discovered that:

**$mkdir bin etc include lib sbin share src tmp var**

was the cause of the issue

Solution:Remounted the partition

**$mount -o remount,rw /dev/sda1 /mnt/lfs**
 
3. writing  $cp /proc/devices $LFS/proc spewed an output:

   "cp /proc/devices and /proc/devices are the same file" though I now choose to overlook it. 
