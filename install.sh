user=amir

AddSudoer=T
InstallVim=T
InstallGedit=T
InstallEvince=T
InstallManPages=T
InstallGeany=F
InstallStardict=F
InstallEmulators=T
InstallPidgin=F
InstallSeamoneky=T
InstallGwibber=F
InstallPino=F
InstallCommandLineHelpers=T
InstallDocTools=T
InstallSystools=T
InstallLibreoffice=T
InstallLatex=F
InstallStellarium=F
InstallCupsPdf=T
InstallGit=T
InstallMultimedia=T
InstallNvidia=F
InstallAMD=F
InstallFlash=T
InstallSkype=T
InstallGoogleVoice=T
InstallDevel=T
RemoveExtra=T
Tuneup=F
InstallGnome3Addons=T
InstallTransmission=T

#Add Sudoer
function addSudoer
{
	#Add me as sudoer
	if [ "X$AddSudoer" = "XT" ]; then
		echo -e "$user\tALL=(ALL)\tALL" > /etc/sudoers.d/$user
		chmod 0440 /etc/sudoers.d/$user
	fi
}

# Install some tools
function installTools
{
	if [ "X$InstallStardict" = "XT" ]; then
		yum -y install stardict stardict-dic-en
	fi
	if [ "X$InstallVim" = "XT" ]; then
		yum -y install vim-enhanced
	fi
	if [ "X$InstallGeany" = "XT" ]; then
		yum -y install geany geany-plugins-addons geany-plugins-geanyextrasel geany-plugins-codenav geany-plugins-spellcheck geany-plugins-geanyvc geany-plugins-common
	fi
	if [ "X$InstallGedit" = "XT" ]; then
		yum -y install gedit-plugins
	fi
	if [ "X$InstallEvince" = "XT" ]; then
		yum -y install evince-djvu
	fi
	if [ "X$InstallManPages" = "XT" ]; then
		yum -y install man-pages
	fi
	if [ "X$InstallStellarium" = "XT" ]; then
		yum -y install stellarium
	fi
	if [ "X$InstallCupsPdf" = "XT" ]; then
		yum -y install cups-pdf 
	fi
  if [ "X$InstallTransmission" = "XT" ]; then
		yum -y install transmission-gtk
	fi
}

# Install Emulators
function installEmulators
{
	if [ "X$InstallEmulators" = "XT" ]; then
		yum -y install wine dosbox
	fi
}

# Install internet Friendly Stuff
function installInternet()
{
	if [ "X$InstallPidgin" = "XT" ]; then
		yum -y install pidgin pidgin-libnotify
	fi
	if [ "X$InstallSeamoneky" = "XT" ]; then
		yum -y install seamonkey
	fi
	if [ "X$InstallGwibber" = "XT" ]; then
		yum -y install gwibber
	fi
	if [ "X$InstallPino" = "XT" ]; then
		yum -y install pino
	fi
}

# Install Command Line Helpers
function installCommandLineHelpers
{
	if [ "X$InstallCommandLineHelpers" = "XT" ]; then
		yum -y install nautilus-open-terminal  bash-completion
		yum -y install mc links lynx wget gpm nmap bti
	fi
}

# Install Documentation Tools
function installDocTools
{
	if [ "X$InstallDocTools" = "XT" ]; then
		yum -y install xfig xournal inkscape graphviz 
	fi
}

# Install some system tools
function installSystools
{
	if [ "X$InstallSystools" = "XT" ]; then
		yum -y install nethogs alacarte accountsdialog gparted strace
	fi
}

# Instal LibreOffice
function installLO
{
	if [ "X$InstallLibreoffice" = "XT" ]; then
	yum -y install libreoffice libreoffice-calc libreoffice-impress libreoffice-calc libreoffice-langpack-fa libreoffice-pdfimport libreoffice-math libreoffice-writer 
	fi
}

# Install Latex and related plugins
function installLatex
{
	if [ "X$InstallLatex" = "XT" ]; then
		yum -y install texlive-scheme-tetex
		if [ "X$InstallGedit" = "XT" ]; then	
			yum -y install gedit-latex-plugin
		fi
		if [ "X$InstallVim" = "XT" ]; then
			yum -y install vim-latex
		fi
		if [ "X$InstallPidgin" = "XT" ]; then
			yum -y install pidgin-latex
		fi
		if [ "X$InstallGeany" = "XT" ]; then
			yum -y install geany-plugins-geanylatex
		fi
		if [ "X$InstallEvince" = "XT" ]; then
			yum -y install evince-dvi
		fi
	fi
}


# Install Git
function installGit
{
	VC=git
	if [ "X$InstallGit" = "XT" ]; then
		yum -y install git
	fi
}

# Add some multimedia Application
function installMultimedia
{
	if [ "X$InstallMultimedia" = "XT" ]; then
		yum -y install http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-stable.noarch.rpm
		yum -y install gnome-mplayer ffmpeg
		yum -y install  gstreamer-plugins-fc  gstreamer-plugins-espeak gstreamer-plugins-ugly gstreamer-plugins-bad gstreamer-ffmpeg
		yum -y install audacious audacious-plugins*
	fi
}

# Install Nvidia Driver
function installNvidia
{
	if [ "X$InstallNvidia" = "XT" ]; then
		yum -y install http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-stable.noarch.rpm
		yum -y install akmod-nvidia xorg-x11-drv-nvidia  xorg-x11-drv-nvidia-libs.i686 xorg-x11-drv-nvidia-libs.x86_64
		dracut -f /boot/initramfs-$(uname -r).img $(uname -r)
		nvidia-xconfig
	fi
}

# AMD Drivers
function installAMD
{
	if [ "X$InstallAMD" = "XT" ]; then
		yum -y install http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-stable.noarch.rpm
		yum -y install akmod-catalyst xorg-x11-drv-catalyst xorg-x11-catalyst-libs xorg-x11-drv-catalyst-libs.i686
		aticonfig --initial
	fi
}

# Install Flash Plugin
function installFlash
{
	if [ "X$InstallFlash" = "XT" ]; then
		yum -y install http://linuxdownload.adobe.com/adobe-release/adobe-release-x86_64-1.0-1.noarch.rpm
		yum -y install flash-plugin
	fi
}

# Install Skype
function installSkype
{
	if [ "X$InstallSkype" ]; then
		yum -y install alsa-lib.i686 libXv.i686 libXScrnSaver.i686 openssl.i686 qt.i686 qt-x11.i686
		yum -y install http://download.skype.com/linux/skype-4.2.0.11-fedora.i586.rpm
	fi
}

# Install GoogleVoice
function installGoogleVoice
{
	if [ "X$InstallGoogleVoice" = "XT" ]; then
		yum -y install http://dl.google.com/linux/direct/google-talkplugin_current_x86_64.rpm
		tempfile=`mktemp`
		awk '/IGNORE_WRAP/{if ($0~"googletalk") print $0; else print gensub("\"", ":*libnpgoogletalk64*:*libnpgtpo3dautoplugin*\"","2") }  ! /IGNORE_WRAP/ {print }' /etc/sysconfig/nspluginwrapper > $tempfile
		cp -f $tempfile /etc/sysconfig/nspluginwrapper
		rm tempfile
	fi
}

# And remove some extra packages
function removeExtra
{
	if [ "X$RemoveExtra" = "XT" ]; then
		yum -y remove sendmail gnome-games
	fi
}

# Do Some optimizations
function tuneup
{
	if [ "X$Tuneup" = "XT" ]; then
	cat <<END > /etc/sysctl.d/amir-tunnings.conf
 ## increase TCP max buffer size setable using setsockopt()
net.core.rmem_max = 16777216
net.core.wmem_max = 16777216
 ## increase Linux autotuning TCP buffer limits
 ## min, default, and max number of bytes to use
 ## set max to at least 4MB, or higher if you use very high BDP paths
net.ipv4.tcp_rmem = 4096 87380 16777216
net.ipv4.tcp_wmem = 4096 65536 16777216
 ## don't cache ssthresh from previous connection
net.ipv4.tcp_no_metrics_save = 1
net.ipv4.tcp_moderate_rcvbuf = 1
 ## recommended to increase this for 1000 BT or higher
net.core.netdev_max_backlog = 2500
 ## for 10 GigE, use this, uncomment below
 ## net.core.netdev_max_backlog = 30000
 ## Turn off timestamps if you're on a gigabit or very busy network
 ## Having it off is one less thing the IP stack needs to work on
 ## net.ipv4.tcp_timestamps = 0
 ## disable tcp selective acknowledgements.
net.ipv4.tcp_sack = 0
 ##enable window scaling
net.ipv4.tcp_window_scaling = 1
vm.swappiness=30
END

		sysctl -p
	fi
}

function installGnome3Addons
{
	if [ "X$InstallGnome3Addons" = "XT" ]; then
		yum -y install gnome-tweak-tool 
#gnome-shell-extensions-drive-menu gnome-shell-extensions-alternative-status-menu
	fi
}

function installDevel
{
	if [ "X$InstallDevel" = "XT" ]; then
		yum install -y gcc make
	fi
}

user=amir
addSudoer amir
installTools
installEmulators
installInternet
installCommandLineHelpers
installDocTools
installSystools
installLO
installLatex
installGit
installMultimedia
installNvidia
installAMD
installFlash
installSkype
installGoogleVoice
removeExtra
tuneup
installGnome3Addons
installDevel

# vim: ts=2 sw=2
