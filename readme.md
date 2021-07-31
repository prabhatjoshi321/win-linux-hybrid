# Windows-Linux Poweruser Scripts

**This is how I combined my Linux and Windows work environment. I am a Linux/Windows power user and for me, working with both OSes simultaneously is a must. With the help of powershell/bash scripts, Vmware Workstation, Vcsxrv, Knowledge of Networking, Virtualization and a Little bit of time. This was the solution I came up with.**

## Tools used

* Vmware Workstation
* Vcxsrv
* Ssh
* Powershell
* Bash
* Any version of linux.(I used Kali in this case)
* Patience and time

## Steps to follow before using this

-----------------

* Make sure **powershell** is set to execute remotely signed scripts. I strongly recommend not to set **PowerShell's execution policy** to **unrestricted** as it is very insecure. Rather set it to **remote signed**
* In your VM, set network adapter to **NAT**. Now boot up the **VM** and set static ip for the interface shown up by **ifconfig**.(I have used **10.10.10.3**)
* Install and enable sshd inside VM and generate auth keys. Put **id_rsa** key in windows **.ssh** folder inside the user profile folder. For additional reference on how to setup ssh, refer [this](https://www.cyberciti.biz/faq/how-to-set-up-ssh-keys-on-linux-unix/)
* Ping that **static ip** from **host** pc so that connection is verified and then proceed.
* Share your all SSD/HDD partitions with **VM** and install **VMWARE TOOLS** in your virtual machine. This is required for path translation scripts to work.
* Install **vcsxrv** as a **X11** server on windows so that you will be able to use **GUI**
apps directly from host.
* Refer to google if any of the above seems confusing.

## Description of Script Files

-----------------

* **Konsole.ps1** -  It utilises ssh and X11 forwarding to spawn a GUI shell
in C Drive. This helps open the GUI terminal from inside the *VM* and use it directly in host just like a regular terminal.
* **Open.ps1** -  It utilises ssh and X11 forwarding as a medium to open GUI linux applications into windows.(You need Vcsxrv to run in order for this to work).
* **shell_spawn.sh** - It uses nohup to deploy a detached terminal and works as a handler to **konsole.ps1** requests.
* **start.ps1** - It gives out a beautiful dialog box for the entry for linux programs to opoen on the hosts screen.
* **xserver.ps1** - It uses **config.xlaunch** and starts X server on windows
* **Microsoft.PowerShell_profile.ps1** - This file contains four functions. It doesnot work out of the box and requires it to be put inside **C:\Users\USERNAME\Documents\WindowsPowerShell** folder. It contains the script that translares present working directory of windows into linux pwd and creates an alias to spawn a linux shell with one command in that
directory. This gives seamless experience across OSes

## How to Setup and Use Scripts

-----------------

* Read the scripts carefully and make the required edits.
* Place the scripts anywhere in your pc and create shortcuts for desktop. Replace the icons with the cool ones present [here](icons/)
* The above step consisted for users comfortable with the **GUI** interface.
* For **CLI** goodness, put **Microsoft.PowerShell_profile.ps1** in **C:\Users\USERNAME\Documents\WindowsPowerShell** folder
* following the third step will give you extra powershell commands
  * **sh** leads to spawn shell inside **powershells** present working directory
  * **st firefox** leads to openup of GUI apps directly in windows.
  * **start-sh** starts the VM.
  * **reset-sh** resets the VM.
  * **hashcat** Not for this project

### This project was inspired by Gynvael Coldwind. The major thing that this project lacks is a network proxy across VM network, Will work on it in upcoming months


#### ps. I don't like WSL due to its limited hardware access and proprietary kernel. And for the linux fanboys, NVIDIA sucks. This setup makes me feel comfortable. Its a **be all end all** solution to my usecase
