#!/bin/bash
# Fedora Image Burner

# Portions of this program is adopted from https://github.com/RMerl/asuswrt-merlin.ng/blob/master/release/src/router/others/entware-setup.sh
# (c) RMerl, license: GPLv2

#RED='\033[0;41;30m'
#GREEN='\033[0;32m'
#GREEN1='\033[42m'
#STD='\033[0;0;39m'
BOLD="\033[1m"
NORM="\033[0m"
INFO="$BOLD Info: $NORM"
ERROR="$BOLD *** Error: $NORM"
WARNING="$BOLD * Warning: $NORM"
INPUT="$BOLD => $NORM"

UEFI=false
workstation_iso="https://download.fedoraproject.org/pub/fedora/linux/releases/31/Workstation/x86_64/iso/Fedora-Workstation-Live-x86_64-31-1.9.iso"
workstation_checksum="https://getfedora.org/static/checksums/Fedora-Workstation-31-1.9-x86_64-CHECKSUM"
spins_checksum="https://spins.fedoraproject.org/static/checksums/Fedora-Spins-31-1.9-x86_64-CHECKSUM"
kde_iso="https://download.fedoraproject.org/pub/fedora/linux/releases/31/Spins/x86_64/iso/Fedora-KDE-Live-x86_64-31-1.9.iso"
xfce_iso="https://download.fedoraproject.org/pub/fedora/linux/releases/31/Spins/x86_64/iso/Fedora-Xfce-Live-x86_64-31-1.9.iso"
lxqt_iso="https://download.fedoraproject.org/pub/fedora/linux/releases/31/Spins/x86_64/iso/Fedora-LXQt-Live-x86_64-31-1.9.iso"
mate_iso="https://download.fedoraproject.org/pub/fedora/linux/releases/31/Spins/x86_64/iso/Fedora-MATE_Compiz-Live-x86_64-31-1.9.iso"
cinnamon_iso="https://download.fedoraproject.org/pub/fedora/linux/releases/31/Spins/x86_64/iso/Fedora-Cinnamon-Live-x86_64-31-1.9.iso"
lxde_iso="https://download.fedoraproject.org/pub/fedora/linux/releases/31/Spins/x86_64/iso/Fedora-LXDE-Live-x86_64-31-1.9.iso"
soas_iso="https://download.fedoraproject.org/pub/fedora/linux/releases/31/Spins/x86_64/iso/Fedora-SoaS-Live-x86_64-31-1.9.iso"

fedora_pubkey="https://getfedora.org/static/fedora.gpg"
prep_env(){
    mkdir -p .tmp_fedora
    cd .tmp_fedora
}
download_kde(){
    wget $kde_iso -O "Fedora-KDE-Live-x86_64-31-1.9.iso"
    if [ $? -eq 0 ]
    then
        echo -e "$INFO Successfully downloaded Fedora 31!"
    else
        echo -e "$ERROR Download error, please retry!"
        sleep 5
        exit 1
    fi
    wget $spins_checksum -O "Fedora-Spins-31-1.9-x86_64-CHECKSUM"
    if [ $? -eq 0 ]
    then
        echo -e "$INFO Successfully downloaded checksum file!"
    else
        echo -e "$ERROR Download error, please retry!"
        sleep 5
        exit 1
    fi
}
download_xfce(){
    wget $xfce_iso -O "Fedora-Xfce-Live-x86_64-31-1.9.iso"
    if [ $? -eq 0 ]
    then
        echo -e "$INFO Successfully downloaded Fedora 31!"
    else
        echo -e "$ERROR Download error, please retry!"
        sleep 5
        exit 1
    fi
    wget $spins_checksum -O "Fedora-Spins-31-1.9-x86_64-CHECKSUM"
    if [ $? -eq 0 ]
    then
        echo -e "$INFO Successfully downloaded checksum file!"
    else
        echo -e "$ERROR Download error, please retry!"
        sleep 5
        exit 1
    fi
}
download_lxqt(){
    wget $lxqt_iso -O "Fedora-LXQt-Live-x86_64-31-1.9.iso"
    if [ $? -eq 0 ]
    then
        echo -e "$INFO Successfully downloaded Fedora 31!"
    else
        echo -e "$ERROR Download error, please retry!"
        sleep 5
        exit 1
    fi
    wget $spins_checksum -O "Fedora-Spins-31-1.9-x86_64-CHECKSUM"
    if [ $? -eq 0 ]
    then
        echo -e "$INFO Successfully downloaded checksum file!"
    else
        echo -e "$ERROR Download error, please retry!"
        sleep 5
        exit 1
    fi
}
download_mate(){
    wget $mate_iso -O "Fedora-MATE_Compiz-Live-x86_64-31-1.9.iso"
    if [ $? -eq 0 ]
    then
        echo -e "$INFO Successfully downloaded Fedora 31!"
    else
        echo -e "$ERROR Download error, please retry!"
        sleep 5
        exit 1
    fi
    wget $spins_checksum -O "Fedora-Spins-31-1.9-x86_64-CHECKSUM"
    if [ $? -eq 0 ]
    then
        echo -e "$INFO Successfully downloaded checksum file!"
    else
        echo -e "$ERROR Download error, please retry!"
        sleep 5
        exit 1
    fi
}
download_cinnamon(){
    wget $cinnamon_iso -O "Fedora-Cinnamon-Live-x86_64-31-1.9.iso"
    if [ $? -eq 0 ]
    then
        echo -e "$INFO Successfully downloaded Fedora 31!"
    else
        echo -e "$ERROR Download error, please retry!"
        sleep 5
        exit 1
    fi
    wget $spins_checksum -O "Fedora-Spins-31-1.9-x86_64-CHECKSUM"
    if [ $? -eq 0 ]
    then
        echo -e "$INFO Successfully downloaded checksum file!"
    else
        echo -e "$ERROR Download error, please retry!"
        sleep 5
        exit 1
    fi
}
download_lxde(){
    wget $lxde_iso -O "Fedora-LXDE-Live-x86_64-31-1.9.iso"
    if [ $? -eq 0 ]
    then
        echo -e "$INFO Successfully downloaded Fedora 31!"
    else
        echo -e "$ERROR Download error, please retry!"
        sleep 5
        exit 1
    fi
    wget $spins_checksum -O "Fedora-Spins-31-1.9-x86_64-CHECKSUM"
    if [ $? -eq 0 ]
    then
        echo -e "$INFO Successfully downloaded checksum file!"
    else
        echo -e "$ERROR Download error, please retry!"
        sleep 5
        exit 1
    fi
}
download_soas(){
    wget $soas_iso -O "Fedora-SoaS-Live-x86_64-31-1.9.iso"
    if [ $? -eq 0 ]
    then
        echo -e "$INFO Successfully downloaded Fedora 31!"
    else
        echo -e "$ERROR Download error, please retry!"
        sleep 5
        exit 1
    fi
    wget $spins_checksum -O "Fedora-Spins-31-1.9-x86_64-CHECKSUM"
    if [ $? -eq 0 ]
    then
        echo -e "$INFO Successfully downloaded checksum file!"
    else
        echo -e "$ERROR Download error, please retry!"
        sleep 5
        exit 1
    fi
}
download_workstation(){
    wget $workstation_iso -O "Fedora-Workstation-Live-x86_64-31-1.9.iso"
    if [ $? -eq 0 ]
    then
        echo -e "$INFO Successfully downloaded Fedora 31!"
    else
        echo -e "$ERROR Download error, please retry!"
        sleep 5
        exit 1
    fi
    wget $workstation_checksum -O "Fedora-Workstation-31-1.9-x86_64-CHECKSUM"
    if [ $? -eq 0 ]
    then
        echo -e "$INFO Successfully downloaded checksum file!"
    else
        echo -e "$ERROR Download error, please retry!"
        sleep 5
        exit 1
    fi
}
verify_image(){
    curl $fedora_pubkey | gpg --no-default-keyring --keyring "./fedora.gpg" --import
    if [ $? -eq 0 ]
    then
        echo -e "$INFO Fedora Signing Key successfully imported!"
    else
        echo -e "$ERROR Fedora Signing Key failed to import."
        sleep 5
        exit 1
    fi
    gpg --verify-files *-CHECKSUM
    if [ $? -eq 0 ]
    then
        echo -e "$INFO Successfully verified the checksum file!"
    else
        echo -e "$ERROR Checksum GPG signature verification FAILED! The checksum file may be corrupted. Quitting..."
        sleep 5
        exit 2
    fi
    sha256sum --ignore-missing -c *-CHECKSUM
    if [ $? -eq 0 ]
    then
        echo -e "$INFO Successfully verified the Fedora image!"
    else
        echo -e "$ERROR ISO checksum verification FAILED! The ISO may be corrupted. Quitting..."
        sleep 5
        exit 3
    fi
}
show_devices() {
    local i=1
    local device
    echo -e "$WARNING Please select the device to burn the image to (use caution):"
    for device in /dev/sd* ; do
        size=`lsblk -rno SIZE $device | head -1`
        echo "[$i] --> $device ($size)"
        eval mounts$i="$device"
        i=$((i + 1))
    done
    echo -en "$INPUT Please enter device number or 0 to exit\n$BOLD[0-$((i - 1))]$NORM: "
    read -r deviceNumber
    if ! [[ "$deviceNumber" =~ ^[0-9]+$ ]]
    then
        echo -e "$ERROR Invalid input! Exiting..."
        exit 5
    fi
    if [ "$deviceNumber" = "0" ] ; then
        echo -e "$INFO" Exiting...
        exit 0
    fi

    if [ "$deviceNumber" -gt $((i - 1)) ] ; then
        echo -e "$ERROR Invalid device number! Exiting..."
        exit 5
    fi

    eval destDevice=\$mounts"$deviceNumber"
    echo -e "$INFO $destDevice selected. Please double check its size.\n"
    echo -e "$WARNING type \"YES\" to confirm selection. THIS STEP IS IRREVERSIBLE."
    local confirmation
    read -r confirmation
    if [ "$confirmation" = "YES" ] ; then
        echo -e "$WARNING Selection confirmed. Continuing in 5 seconds. Press Ctrl-C to cancel."
        sleep 5
    else
        echo -e "$WARNING Selection canceled. Exiting..."
        exit 6
    fi
}
burn_image() {
    #echo -e "$INFO Non-UEFI. Image will be directly written to the selected device ($destDevice)."
    echo -ne "$INFO Image being written: "
    ls -1 *.iso | head -1
    local image=`ls -1 *.iso | head -1`
    echo -e "$WARNING Please confirm. Press Ctrl-C to quit."
    sleep 5
    echo -e "$WARNING Writing image $image to $destDevice...\n$INFO Running sudo. You may be prompted for your password."
    sudo dd if=$image of=$destDevice bs=256K status=progress conv=fdatasync
    # caveat here, doesn't work on BSD dd
    # i.e. macOS and BSD distros
    sudo sleep 1
    sudo sync
    sudo sleep 1
    echo -e "$INFO Image is successfully written."
}
show_flavors() {
    clear
    echo "-----------------------------------"
    echo " Fedora Image Burner - Fedora 31"
    echo "-----------------------------------"
    echo "Please select your flavor:"
    echo "1. Workstation (GNOME)"
    echo "2. KDE Plasma Desktop"
    echo "3. Xfce Desktop"
    echo "4. LXQt Desktop"
    echo "5. MATE Compiz Desktop"
    echo "6. Cinnamon Desktop"
    echo "7. LXDE Desktop"
    echo "8. SoaS Desktop"
    echo "9. Exit"
}
set_uefi(){
    local choice
    echo -n "Enable UEFI booting? [y/N] "
    read choice
    if [ "$choice" = "y" ] || [ "$choice" = "Y" ]
    then
        echo "UEFI enabled"
        UEFI=true
    else
        echo "UEFI not enabled"
    fi        
}
workstation(){
    set_uefi
    prep_env
    download_workstation
    verify_image
    show_devices
    burn_image
    sleep 5
}
kde(){
    set_uefi
    prep_env
    download_kde
    verify_image
    show_devices
    burn_image
    sleep 5
}
xfce(){
    set_uefi
    prep_env
    download_xfce
    verify_image
    show_devices
    burn_image
    sleep 5
}
lxqt(){
    set_uefi
    prep_env
    download_lxqt
    verify_image
    show_devices
    burn_image
    sleep 5
}
mate(){
    set_uefi
    prep_env
    download_mate
    verify_image
    show_devices
    burn_image
    sleep 5
}
lxde(){
    set_uefi
    prep_env
    download_lxde
    verify_image
    show_devices
    burn_image
    sleep 5
}
cinnamon(){
    set_uefi
    prep_env
    download_cinnamon
    verify_image
    show_devices
    burn_image
    sleep 5
}
soas(){
    set_uefi
    prep_env
    download_soas
    verify_image
    show_devices
    burn_image
    sleep 5
}
cleanup(){
    cd ..
    rm -r .tmp_fedora
}
read_options(){
    local choice
    read -p "Enter your choice [1 - 8]: " choice
    case $choice in
        1) workstation ;;
        2) kde ;;
        3) xfce ;;
        4) lxqt ;;
        5) mate ;;
        6) cinnamon ;;
        7) lxde ;;
        8) soas ;;
        9) exit 0;;
        *) echo -e "$ERROR  [*] Wrong selection! " && sleep 2
    esac
}

show_flavors
read_options
cleanup
