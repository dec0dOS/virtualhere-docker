#!/bin/bash

ARCH=`uname -m`
# TODO: detect RPI model and use special binary
# RPI=`cat /proc/cpuinfo | grep Model`

echo "Your system architecture was identified as $ARCH."

if [ "$ARCH" = "x86_64" ]
then
    echo "The x86_64 version of the virtualhere-client will be used."
    ARCH_VR=vhusbdx86_64
else 
    echo "The ARM version of the virtualhere-client will be used."
    ARCH_VR=vhusbdarm
fi

echo 'Listing all usb-devices'
lsusb || echo 'Execution of command lsusb failed. Make sure you have access to USB-Devices on the host.'

cd data

echo 'Deleting previous bus_usb_*-files from data directory ...'
find . -name '*bus_usb_*' -delete
echo 'Checking for new version of VirtualHere ...'
wget -N https://www.virtualhere.com/sites/default/files/usbserver/$ARCH_VR || echo 'Checking for remote copy of VirtualHere failed'

chmod +x ./$ARCH_VR
./$ARCH_VR

exit 0
