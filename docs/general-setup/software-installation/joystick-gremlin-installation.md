# Joystick Gremlin Installation

Joystick Gremlin maps your physical devices to virtual vJoy outputs for Star Citizen.

!!! note
    This page only covers installation. For profile loading, activation order, and exact configuration rules, use [Software Configuration](../software-configuration.md){ data-preview }.

## Prerequisites

- [vJoy Installation](vjoy-installation.md){ data-preview }
- [HIDHide Installation](hidhide-installation.md){ data-preview }

## Install Steps

1. **Uninstall or delete any older Joystick Gremlin first** (R13.x or earlier, and any stray extracted copies in your Downloads folder). These binds require R14.x, and a leftover install *will* bite you later — see the warning below.
2. Download Joystick Gremlin from the official release source.
3. Install and launch Joystick Gremlin.
4. Allow any Windows security prompts if shown.
5. Run with the same privilege level each time (recommended).

!!! warning "Two JG installs = invisible sticks later"
    HIDHide's allow-list points at a specific `joystick_gremlin.exe` path. If an old install is still around, it's easy to end up with HIDHide allowing the *old* exe while you run the *new* one — then the moment Device Hiding turns on, your sticks vanish from Joystick Gremlin itself. If you ever upgrade or move JG, re-add the new `.exe` in HIDHide's Applications tab. (Not sure which one is running? Right-click JG's taskbar icon — it shows the `.exe` location.)

## Verify Installation

- Launch Joystick Gremlin and confirm it opens successfully
- Confirm no immediate startup errors
- Continue to [Software Configuration](../software-configuration.md){ data-preview } before attempting final in-game validation

## Video Guide (Optional)

If you prefer a walkthrough format, you can follow the Joystick Gremlin setup video:

[![Joystick Gremlin Install Video](https://img.youtube.com/vi/mc-ozIogrpI/maxresdefault.jpg)](https://www.youtube.com/watch?v=mc-ozIogrpI)

!!! warning
    This video demonstrates the process on VKB NXT EVO hardware, but the installation flow is similar for other supported devices.