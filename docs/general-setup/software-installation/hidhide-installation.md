# HIDHide Installation

HIDHide prevents games from seeing your physical controllers directly. This avoids double input when Star Citizen is supposed to read only vJoy output from Joystick Gremlin.

!!! note
    This page only covers installation. For exact allow-list, hidden device rules, and Star Citizen-specific safety settings, use [Software Configuration](../software-configuration.md){ data-preview }.

## Install Steps

1. Download and install HIDHide from the official Nefarius source.
2. Reboot Windows after install.
3. Open `HIDHide Configuration Client` as Administrator.

!!! warning "Already have HIDHide? Make sure it's current"
    Old HIDHide versions can silently fail to cloak devices on current Windows builds — everything looks configured correctly, but `joy.cpl` keeps showing your physical sticks. If you installed HIDHide a while ago, grab the latest release before troubleshooting anything else.

## Verify Installation

- Launch `HIDHide Configuration Client`
- Confirm the application opens without driver/service errors
- Keep default behavior until you reach [Software Configuration](../software-configuration.md){ data-preview }

## Video Guide (Optional)

If you would like to know more about HIDHide and how you can use it to hide your sticks and vjoy devices from FPS games check out this video,

[![HIDHide Install Video](https://img.youtube.com/vi/PyL156AywYQ/maxresdefault.jpg)](https://www.youtube.com/watch?v=PyL156AywYQ)

!!! warning
    This video covers broader HIDHide usage. Follow the written steps on this page for the exact settings used with these curated binds.
