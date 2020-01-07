sudo pacman -S --noconfirm xf86-video-{vesa,ati,intel,amdgpu,nouveau}
sudo pacman -S --noconfirm xf86-input-synaptics

sudo pacman -S --noconfirm xorg-server xorg-apps xorg-xinit mesa
sudo pacman -S --noconfirm xorg-twm xorg-xclock xterm


# Yaourt
cat <<EOF | sudo tee -a /etc/pacman.conf
#yaourt
[archlinuxfr]
SigLevel = Never
Server = http://repo.archlinux.fr/\$arch

[archzfs]
SigLevel = Never
Server = http://archzfs.com/\$repo/x86_64

[herecura]
Server = https://repo.herecura.be/\$repo/\$arch

[ec2]
SigLevel = PackageRequired
Server = https://arch-linux-ami.s3.amazonaws.com/repo/\$arch

[xyne-any]
# A repo for Xyne's own projects: https://xyne.archlinux.ca/projects/
# Packages for "any" architecture.
# Use this repo only if there is no matching [xyne-*] repo for your architecture.
SigLevel = Required
Server = https://xyne.archlinux.ca/repos/xyne


[xyne-x86_64]
# A repo for Xyne's own projects: https://xyne.archlinux.ca/projects/
# Packages for the "x86_64" architecture.
# Note that this includes all packages in [xyne-any].
SigLevel = Required
Server = https://xyne.archlinux.ca/repos/xyne
EOF
sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm yaourt
sudo sed -i '/EXPORT=0/s/#EXPORT=0/EXPORT=2/' /etc/yaourtrc
sudo sed -i '/MAKEFLAGS=/s/#MAKEFLAGS="-j2"/MAKEFLAGS="-j8"/p' /etc/makepkg.conf
yaourt -Syu

# i3
sudo pacman -S --noconfirm --needed i3-gaps sakura firefox firefox-i18n-ja 

# Japanize
cat <<EOF | sudo tee -a /etc/locale.gen
en_US.UTF-8 UTF-8  
ja_JP.UTF-8 UTF-8  
EOF
sudo locale-gen

yaourt -S --noconfirm otf-ipaexfont


yaourt -S --noconfirm git tmux 

cat <<EOF | sudo tee ~/.xinitrc
export TERMINAL=sakura

export GTK_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
export QT_IM_MODULE=fcitx
export DefaultIMModule=fcitx

#dbus-update-activation-environment --systemd DISPLAY
#eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
#export SSH_AUTH_SOCK
#export GNOME_KEYRING_CONTROL

# i3 kidou
exec i3
EOF

yaourt -S --noconfirm --needed \
	adobe-source-code-pro-fonts adobe-source-han-sans-jp-fonts \
	ttf-ms-fonts  \
	ttf-arphic-uming \
	otf-source-han-code-jp \
	powerline-fonts \
	ttf-symbola \
	unicode-emoji

# for s3
yaourt -S --noconfirm --needed aws-cli goofys-bin fuse3

### Utils
yaourt -S --needed --noconfirm \
  git \
  wget \
  curl \
  tmux \
  zsh \
  zsh-completions \
  pv \
  encfs \
  pkgfile \
  neovim \
  python-pip \
  ctags

### 監視系
yaourt -S --needed --noconfirm htop iotop iftop lsof strace bind-tools gnu-netcat

### ディスク操作系 
yaourt -S --needed --noconfirm arch-install-scripts gdisk exfat-utils ntfs-3g 

### メルトダウン対策
yaourt -S --noconfirm intel-ucode

### Xに必要なもの
yaourt -S --noconfirm --needed \
  xf86-video-vesa \
  xf86-video-ati \
  xf86-video-nouveau \
  xf86-video-intel \
  libva-intel-driver \
  xorg-server \
  xorg-xinit \
  xorg-server \
  xorg-xinit \
  xorg-xclock \
  xorg-xwininfo \
  xorg-xprop \
  xorg-twm \
  xdotool \
  xsel \
  xterm \
  arandr \
  xorg-server-xephyr 

### 日本語入力
yaourt -S --noconfirm --needed \
  fcitx \
  fcitx-configtool \
  fcitx-gtk2 \
  fcitx-gtk3 \
  fcitx-qt4 \
  fcitx-qt5 \
  fcitx-mozc

### ファイラ
yaourt -S --noconfirm --needed nautilus

### アプレット
yaourt -S --noconfirm --needed \
  network-manager-applet \
  volumeicon \
  cbatticon

### オーディオ
yaourt -S --noconfirm --needed \
  pulseaudio{,-alsa} \
  pavucontrol \
  gst-{libav,plugins-{bad,good,ugly}}

### パスワード
yaourt -S --noconfirm --needed keepassxc

### 壁紙
yaourt -S --noconfirm --needed nitrogen feh


### クリップボード管理
yaourt -S --noconfirm --needed parcellite

### compton
yaourt -S --noconfirm --needed compton

### ブラウザ
yaourt -S --noconfirm --needed firefox{,-i18n-ja} flashplugin

### メーラ
yaourt -S --noconfirm --needed thunderbird{,-i18n-ja}

### リモート接続
#yaourt -S --noconfirm --needed freerdp

### PDFビューワ
yaourt -S --noconfirm --needed evince poppler-data

### 画像編集
yaourt -S --noconfirm --needed imagemagick
### 動画編集
yaourt -S --noconfirm --needed ffmpeg ffmpegthumbnailer gst-libav gst-plugins-ugly
### 動画再生
yaourt -S --noconfirm --needed vlc
### トレント
yaourt -S --noconfirm --needed transmission-gtk

### Latex
yaourt -S --noconfirm --needed texlive-{langjapanese,most} ghostscript

### openvpn
yaourt -S --noconfirm --needed openvpn

### webdav
yaourt -S --noconfirm --needed davfs2

### docker
yaourt -S --noconfirm --needed docker docker-compose

### Terminal
yaourt -S --noconfirm --needed sakura

### virtualbox
#yaourt -S --noconfirm --needed virtualbox virtualbox-host-modules-arch virtualbox-guest-iso

### i3wm
yaourt -S --noconfirm --needed \
  rofi \
  lm_sensors

### gnomeから導入
#yaourt -S --noconfirm --needed \
#gnome-settings-daemon \
#gnome-keyring \
#seahorse \
#gnome-tweak-tool

### xfce4から導入
#yaourt -S --noconfirm --needed \
#  xfce4-{panel,power-manager,notifyd} \
#  xfce4-{settings,artwork,battery-plugin,clipman-plugin,taskmanager,whiskermenu-plugin} \
#  xfce4-i3-workspaces-plugin-git

### Google Chrome
yaourt -S --noconfirm --needed google-chrome

### Slack
#yaourt -S --noconfirm --needed slack-desktop

### クラウド
yaourt -S --noconfirm --needed dropbox

### フォント一式
yaourt -S --noconfirm --needed \
  ttf-ms-fonts \
  ttf-arphic-uming \
  otf-source-han-code-jp \
  powerline-fonts \
  ttf-symbola \
  unicode-emoji

### タッチスクリーン
yaourt -S --noconfirm --needed xf86-input-libinput

### ローカライズ
sudo timedatectl set-timezone Asia/Tokyo
sudo hwclock --systohc --utc


## plexに対応:
yaourt -S --noconfirm --needed plex-media-server-plexpass
#sudo systemctl start plexmediaserver
#sudo zpool import zpool


## 追加インストール
yaourt -S --noconfirm --needed zoom rsync exfat-utils

# LDAP操作用
yaourt -S --noconfirm --needed apachedirectorystudio

# ZFS
yaourt -S --noconfirm --needed  zfs-linux

# セキュアブート
yaourt -S --noconfirm --needed  sbsigntools

# Makemkv
yaourt -S --noconfirm --needed  makemkv
#echo sg /etc/modules-load.d/sg.conf

yaourt -S --noconfirm --needed sssd

cat <<EOF | sudo tee /etc/sssd/sssd.conf
[sssd]
config_file_version = 2
services = nss, pam, ssh, sudo
domains = default

[domain/default]
cache_credentials = true

id_provider = ldap
auth_provider = ldap
chpass_provider = ldap
sudo_provider = ldap

ldap_uri = ldap://ldap.connectors-devel.hajime.work
ldap_search_base = dc=hajime,dc=work
ldap_tls_request = never
ldap_id_use_start_tls = false

ldap_default_bind_dn = cn=Manager,dc=hajime,dc=work
ldap_default_authtok = deganjue222
ldap_sudo_search_base = ou=SUDOers,dc=hajime,dc=work
ldap_group_object_class = posixGroup
ldap_group_name = cn
ldap_group_member = memberUid


#ldap_tls_reqcert = demand
#ldap_tls_cacert = /etc/openldap/certs/cacerts.pem
#entry_cache_timeout = 600
#ldap_network_timeout = 2

#ldap_search_base = dc=hajime,dc=work
EOF

cat <<EOF | sudo tee /etc/pam.d/system-auth
#%PAM-1.0

auth      sufficient pam_sss.so forward_pass
auth      required  pam_unix.so     try_first_pass nullok
auth      optional  pam_permit.so
auth      required  pam_env.so

account   [default=bad success=ok user_unknown=ignore authinfo_unavail=ignore] pam_sss.so
account   required  pam_unix.so
account   optional  pam_permit.so
account   required  pam_time.so

password  sufficient pam_sss.so use_authtok    
password  required  pam_unix.so     try_first_pass nullok sha512 shadow
password  optional  pam_permit.so

session   required  pam_limits.so
session   required  pam_unix.so
session   optional  pam_permit.so
EOF


cat <<EOF | sudo tee /etc/pam.d/sudo
#%PAM-1.0
auth        sufficient    pam_sss.so
auth        include        system-auth
account        include        system-auth
session        include        system-auth
EOF

cat <<EOF | sudo tee /etc/pam.d/passwd
#%PAM-1.0
password    sufficient    pam_sss.so
#password    required    pam_cracklib.so difok=2 minlen=8 dcredit=2 ocredit=2 retry=3
#password    required    pam_unix.so sha512 shadow use_authtok
password    required    pam_unix.so sha512 shadow nullok
EOF

cat <<EOF | sudo tee /etc/nsswitch.conf
# Name Service Switch configuration file.
# See nsswitch.conf(5) for details.

passwd: files sss
group: files sss
shadow: files sss
sudoers: files sss

publickey: files

hosts: files mymachines myhostname resolve [!UNAVAIL=return] dns
networks: files

protocols: files
services: files
ethers: files
rpc: files

netgroup: files
EOF

cat <<EOF | sudo tee /etc/pam.d/system-login
#%PAM-1.0

auth       required   pam_tally.so         onerr=succeed file=/var/log/faillog
auth       required   pam_shells.so
auth       requisite  pam_nologin.so
auth       include    system-auth

account    required   pam_access.so
account    required   pam_nologin.so
account    include    system-auth

password   include    system-auth

session    optional   pam_loginuid.so
session    optional   pam_keyinit.so       force revoke
session    include    system-auth
session    optional   pam_motd.so          motd=/etc/motd
session    optional   pam_mail.so          dir=/var/spool/mail standard quiet
-session   optional   pam_systemd.so
session    required   pam_env.so
session    required   pam_mkhomedir.so skel=/etc/skel umask=0022
EOF


sudo chmod 600 /etc/sssd/sssd.conf
systemctl start sssd
systemctl status sssd

cat <<EOF | sudo tee /etc/ssh/sshd_config
#    $OpenBSD: sshd_config,v 1.102 2018/02/16 02:32:40 djm Exp $

# This is the sshd server system-wide configuration file.  See
# sshd_config(5) for more information.

# This sshd was compiled with PATH=/usr/local/sbin:/usr/local/bin:/usr/bin

# The strategy used for options in the default sshd_config shipped with
# OpenSSH is to specify options with their default value where
# possible, but leave them commented.  Uncommented options override the
# default value.

Port 22
#AddressFamily any
#ListenAddress 0.0.0.0
#ListenAddress ::

#HostKey /etc/ssh/ssh_host_rsa_key
#HostKey /etc/ssh/ssh_host_ecdsa_key
#HostKey /etc/ssh/ssh_host_ed25519_key

# Ciphers and keying
#RekeyLimit default none

# Logging
#SyslogFacility AUTH
#LogLevel INFO

# Authentication:

#LoginGraceTime 2m
#PermitRootLogin prohibit-password
#StrictModes yes
#MaxAuthTries 6
#MaxSessions 10

#PubkeyAuthentication yes

# The default is to check both .ssh/authorized_keys and .ssh/authorized_keys2
# but this is overridden so installations will only check .ssh/authorized_keys
AuthorizedKeysFile .ssh/authorized_keys

#AuthorizedPrincipalsFile none

AuthorizedKeysCommand /usr/bin/sss_ssh_authorizedkeys
AuthorizedKeysCommandUser root

# For this to work you will also need host keys in /etc/ssh/ssh_known_hosts
#HostbasedAuthentication no
# Change to yes if you don't trust ~/.ssh/known_hosts for
# HostbasedAuthentication
#IgnoreUserKnownHosts no
# Don't read the user's ~/.rhosts and ~/.shosts files
#IgnoreRhosts yes

# To disable tunneled clear text passwords, change to no here!
PasswordAuthentication no
#PermitEmptyPasswords no

# Change to no to disable s/key passwords
ChallengeResponseAuthentication no

# Kerberos options
#KerberosAuthentication no
#KerberosOrLocalPasswd yes
#KerberosTicketCleanup yes
#KerberosGetAFSToken no

# GSSAPI options
#GSSAPIAuthentication no
#GSSAPICleanupCredentials yes

# Set this to 'yes' to enable PAM authentication, account processing,
# and session processing. If this is enabled, PAM authentication will
# be allowed through the ChallengeResponseAuthentication and
# PasswordAuthentication.  Depending on your PAM configuration,
# PAM authentication via ChallengeResponseAuthentication may bypass
# the setting of "PermitRootLogin without-password".
# If you just want the PAM account and session checks to run without
# PAM authentication, then enable this but set PasswordAuthentication
# and ChallengeResponseAuthentication to 'no'.
UsePAM yes

#AllowAgentForwarding yes
#AllowTcpForwarding yes
#GatewayPorts no
#X11Forwarding no
#X11DisplayOffset 10
#X11UseLocalhost yes
#PermitTTY yes
PrintMotd no # pam does that
#PrintLastLog yes
#TCPKeepAlive yes
#UseLogin no
#PermitUserEnvironment no
#Compression delayed
#ClientAliveInterval 0
#ClientAliveCountMax 3
#UseDNS no
#PidFile /run/sshd.pid
#MaxStartups 10:30:100
#PermitTunnel no
#ChrootDirectory none
#VersionAddendum none

# no default banner path
#Banner none

# override default of no subsystems
Subsystem sftp /usr/lib/ssh/sftp-server

# Example of overriding settings on a per-user basis
#Match User anoncvs
#    X11Forwarding no
#    AllowTcpForwarding no
#    PermitTTY no
#    forcecommand cvs server
EOF
sudo systemctl restart sshd
sudo systemctl status sshd

pacma -S zsh zsh-completions --noconfirm
yaourt -S --noconfirm --needed polybar
yaourt -S --noconfirm --needed vivaldi
yaourt -S --noconfirm --needed python-neovim
