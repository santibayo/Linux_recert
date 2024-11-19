
# Accounts 
usage: 
awk -F: -v recertification="KK" -f p_passwd.awk /etc/shadow /etc/passwd

This will generate an extraction of the Linux users like this one:

2024-06-16,colord,111,120,/usr/sbin/nologin,1697846400000,/var/lib/colord,!,0,MBP-2.local

2024-06-16,gnome-initial-setup,112,65534,/bin/false,1697846400000,/run/gnome-initial-setup/,!,0,MBP-2.local

2024-06-16,Debian-gdm,113,121,/bin/false,1697846400000,/var/lib/gdm3,!,0,MBP-2.local

2024-06-16,debian,1000,1000,/usr/bin/zsh,1697846400000,/var/,$y$j,1,MBP-2.local


Meaning:

KK [f1] - recertification exercise

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
usage:
awk -F: -f groups.awk passwd 
