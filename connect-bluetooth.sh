#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 <MAC address>"
    exit 1
fi

# Get the Bluetooth device MAC address from the first argument
DEVICE_MAC_ADDRESS="$1"

# Check if the device is already paired
if ! bluetoothctl paired-devices | grep -q "$DEVICE_MAC_ADDRESS"; then
    echo "The device with MAC address $DEVICE_MAC_ADDRESS is not paired yet. Please pair it first and try again."
    exit 1
fi

# Connect to the device using bluetoothctl
echo -e "connect $DEVICE_MAC_ADDRESS\nquit" | bluetoothctl
