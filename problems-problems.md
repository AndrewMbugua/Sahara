## Problems faced
- Keyboard and mouse were captured by the V.B and rendered unusable outside it.Fixed by rectifying some settings

- After typing away and executing multiple cmds using an in built while loop,I got close to 100 "cannot create directory": read only file system...what a waste

--I tried to retrace my steps and discovered that:

**$mkdir bin etc include lib sbin share src tmp var**

was the cause of the issue

Solution:Remounted the partition

**$mount -o remount,rw /dev/sda1 /mnt/lfs**
 
