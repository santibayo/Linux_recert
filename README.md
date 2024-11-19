# Installation
Copy all awk scripts to the target machine in the same directory.

# Requirements
- GNU AWK installed in the target machine.
- Administration account capable of reading /etc/shadow, /etc/passwd and /etc/group or sudo capabilities.
- Invoke the scripts with the administration account.

# Accounts 
Usage:

`awk -F: -v recertification="Q4-2024" -f p_passwd.awk /etc/shadow /etc/passwd`


This will generate an extraction of the Linux users like this one:

Q4-2024,colord,111,120,/usr/sbin/nologin,1697846400000,/var/lib/colord,!,0,MBP-2.local

Q4-2024,gnome-initial-setup,112,65534,/bin/false,1697846400000,/run/gnome-initial-setup/,!,0,MBP-2.local

Q4-2024,Debian-gdm,113,121,/bin/false,1697846400000,/var/lib/gdm3,!,0,MBP-2.local

Q4-2024,debian,1000,1000,/usr/bin/zsh,1697846400000,/var/,$y$j,1,MBP-2.local


Meaning:

Q4-2024 [f1] - recertification exercise

root [f2] - username

0 [f3] - uid

0 [f4] -gid

/bin/bash [f5] - shell. nologin means no interactive shell, so no remote/local access granted

1697846400000 [f6] - last change password

/root [f7] - home directory

!|$y$j [f8] - != locked| $xxx = encryption or hashing method. For more information, please check => https://www.baeldung.com/linux/etc-shadow-star-exclamation-mark and https://www.cyberciti.biz/faq/understanding-etcpasswd-
file-format/

1|0 [f9] - ssh public key exist 

MBP-2,local [f10] - hostname

# Authorization (group membership)
Usage:

`awk -F: -v recertification="Q4-2024" -f groups.awk passwd `
this will output the relation between users and groups in an output like this one:

Q4-2024,MBP-2.local,root,root-group

Q4-2024,MBP-2.local,www-data,www-data-group

Q4-2024,MBP-2.local,polkitd,_

Q4-2024,MBP-2.local,rtkit,_

Q4-2024,MBP-2.local,colord,_

Q4-2024,MBP-2.local,gnome-initial-setup,_

Q4-2024,MBP-2.local,Debian-gdm,_

Q4-2024,MBP-2.local,debian,www-data-group|os_test1|os_test2

Meaning:
Q4-2024 [f1] - recertification step

MBP-2.local[f2] - system hostname

debian [f3] - username

www-data-group|os_test1|os_test2 [f4] - list of groups user belongs to or "_" if none.

