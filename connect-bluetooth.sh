#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 [--pair] <MAC address>"
    exit 1
fi

# Get the Bluetooth device MAC address from the last argument
DEVICE_MAC_ADDRESS="${@: -1}"

# Check if the device is already paired
if ! bluetoothctl paired-devices | grep -q "$DEVICE_MAC_ADDRESS"; then
    if [ "$1" = "--pair" ]; then
        echo "Pairing with the device with MAC address $DEVICE_MAC_ADDRESS..."
        echo -e "pair $DEVICE_MAC_ADDRESS\nquit" | bluetoothctl
    else
        echo "The device with MAC address $DEVICE_MAC_ADDRESS is not paired yet. Please pair it first and try again."
        exit 1
    fi
fi

# Connect to the device using bluetoothctl
echo "Connecting to the device with MAC address $DEVICE_MAC_ADDRESS..."
echo -e "connect $DEVICE_MAC_ADDRESS\nquit" | bluetoothctl
