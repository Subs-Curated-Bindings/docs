# vJoy Installation

vJoy creates virtual controllers that Joystick Gremlin outputs to. Star Citizen should read those virtual devices instead of your raw hardware.

!!! note
    This page only covers installation. For exact vJoy settings used with curated binds, use [Software Configuration](../software-configuration.md).

## Install Steps

1. Download vJoy from the official source linked in the project resources.
2. Run the installer as Administrator.
3. Reboot Windows after installation (recommended).
4. Open `Configure vJoy` and confirm at least one vJoy device exists.

## Verify vJoy Is Working

- Open Windows Game Controllers (Run:`joy.cpl` or click :windows: and search for 'USB Game Controllers')
- Confirm `vJoy Device` appears


## Common Problems

- vJoy missing in `joy.cpl`: reinstall and reboot
- Installer blocked by security software: allow or whitelist installer, then retry
- vJoy appears but inputs are incorrect: continue to [Software Configuration](../software-configuration.md)

## Video Guide (Optional)

If you prefer a walkthrough format, you can follow the vJoy setup video:

[![vJoy Install Video](https://img.youtube.com/vi/ugjgKPf1-rk/maxresdefault.jpg)](https://www.youtube.com/watch?v=ugjgKPf1-rk)

!!! warning
    This video explains general vJoy setup. For curated binds, follow the written guidance in this docs site if anything differs.