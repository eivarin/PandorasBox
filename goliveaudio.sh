#!/bin/bash
pactl load-module module-null-sink sink_name=Virtual1
pactl load-module module-null-sink sink_name=Virtual2
pactl load-module module-loopback sink=Virtual1
pactl load-module module-loopback source=Virtual2.monitor sink=Virtual1
pactl load-module module-loopback source=Virtual2.monitor sink=alsa_output.usb-Corsair_Corsair_HS60_PRO_Surround_USB_Sound_Adapter_00000000-00.analog-stereo
pavucontrol



