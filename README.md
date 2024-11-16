usage: 

awk -F: -v recertification="KK" -f p_passwd.awk /etc/shadow /etc/passwd

This will generate an extraction of the Linux users like this one:

KK,root,0,0,/bin/bash,1697846400000,/root,!,0
KK,backup,34,34,/usr/sbin/nologin,1697846400000,/var/backups,*,0
KK,list,38,38,/usr/sbin/nologin,1697846400000,/var/list,*,0
KK,irc,39,39,/usr/sbin/nologin,1697846400000,/run/ircd,*,0
KK,_apt,42,65534,/usr/sbin/nologin,1697846400000,/nonexistent,*,0
KK,sshd,103,65534,/usr/sbin/nologin,1697846400000,/run/sshd,!,0
KK,dnsmasq,104,65534,/usr/sbin/nologin,1697846400000,/var/lib/misc,!,0
KK,avahi,105,112,/usr/sbin/nologin,1697846400000,/run/avahi-daemon,!,0
KK,colord,111,120,/usr/sbin/nologin,1697846400000,/var/lib/colord,!,0
KK,gnome-initial-setup,112,65534,/bin/false,1697846400000,/run/gnome-initial-setup/,!,0
KK,Debian-gdm,113,121,/bin/false,1697846400000,/var/lib/gdm3,!,0
KK,debian,1000,1000,/usr/bin/zsh,1697846400000,/var/,$y$j,1

Meaning:

KK [f1] - recertification exercise
root [f2] - username
0 [f3] - uid
0 [f4] -gid
/bin/bash [f5] - shell. nologin means no interactive shell, so no remote/local access granted
1697846400000 [f6] - last change password
/root [f7] - home directory
!|$y$j [f8] - != locked| $xxx = encryption or hashing method 
1|0 [f9] - ssh public key exist 
