# Bluetooth Device Connection Script

This script uses the `bluetoothctl` to connect to a Bluetooth device using its MAC address.

## Usage

To use the script, save the script to a file, make it executable using `chmod +x <filename>`, and then run the script with the MAC address of the device you want to connect to as an argument.

`Usage: bluetooth-connect.sh [--pair] <MAC address>`

- `--pair`: Automatically pair with the device if it's not already paired.
- `<MAC address>`: The MAC address of the Bluetooth device to connect to.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
