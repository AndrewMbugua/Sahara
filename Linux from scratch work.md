
## Day 1 - Install a virtual machine

I got the deb file for Oracle virtual box:
 
**$ wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -**

**$ wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -**

**$ sudo apt install software-properties-common**

**$ sudo add-apt-repository "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib**

**$ sudo apt-get install virtualbox-6.1**

 **#virtualbox**














NOTE:My current linux distro is Parrot OS which is debian based
