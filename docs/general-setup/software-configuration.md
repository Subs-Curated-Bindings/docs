# Software Configuration

If your software is already installed, start here. This page provides the exact settings for each program used with curated binds.

!!! note
	You should also consult the README for your specific joystick setup, since some combinations require slight changes.

## vJoy Configuration

- Open `vJoy Configuration`
- First vJoy Device: check all axes, set `128` buttons, `Continuous` POV mode, and `4` POV hats.
- Second vJoy Device: check all axes, set `127` buttons, `Continuous` POV mode, and `4` POV hats.
- Apply changes and close the tool before loading Joystick Gremlin.

*Screenshot coming soon.*

!!! warning
    - You will almost certainly need to restart windows after making changes here.
	- Two vJoy devices are needed for most joystick profiles due to the 8-axis-per-device limitation.
	- Because Joystick Gremlin handles output mapping, you usually should not need to run `pp_resortdevices joystick 1 2` repeatedly.
    - If Star Citizen detects more than two vJoy devices, users commonly run into sorting headaches. If you are adding rudder pedals on top of the config there should be enough axis between the two vjoys.

## HIDHide Configuration

### Applications (Allow-List)

This list controls which programs are allowed to see physical devices.

- Confirm `HIDHide Configuration Client` is present (normally default)
- Add `joystick_gremlin.exe`
- Add manufacturer software that needs direct hardware visibility (for example: VKBDevCfg, Virpil software, Thrustmaster TARGET, MOZA tools)

!!! warning
    Do **not** add Star Citizen to this allow-list.
    Star Citizen must not see physical sticks directly when using curated vJoy-based binds.

*Screenshot coming soon.*

### Devices

This is where we blacklist all physical devices that might interfere with SC.

- Hide physical joystick and throttle devices
- Hide non-joystick HID devices that may inject game input (for example: gamepads, Razer Tartarus, keyboards with optical/analog switches)
- Do **not** hide vJoy devices
- Enable Device Hiding only after the allow-list is complete

!!! warning
    Common breakpoints:
    - Enabling HIDHide before adding required applications
    - Leaving gamepads/keypads/analog keyboards unhidden
    - Adding Star Citizen to the allow-list

## Joystick Gremlin Configuration

1. Open Joystick Gremlin (R14, 14.2 or later — R13 is no longer supported).
2. Load the Joystick Gremlin profile from your stick's folder. The filename starts with `Joystick Gremlin Profile` and ends in `[R14].xml`. (The other `.xml` files in the folder — the `layout_*_exported.xml` ones — are for Star Citizen's keybind menu, not JG; don't pick them here.)
3. Run **Tools → Swap Devices** to pair your physical hardware IDs with the profile's virtual slots. You'll see physical devices on the left and profile slots on the right. Press the white box next to your first physical stick, move an axis on that stick, then repeat for the second stick. **Save the profile** afterwards (Ctrl+S) — without the save you'll redo this every time JG starts.
4. Verify each physical input resolves to the expected virtual output in JG's `Input Viewer`.
5. Activate the profile (Green Controller Icon).

!!! note
    Run Joystick Gremlin with the same privilege level each launch to avoid inconsistent behavior.

## Quick Validation Before Launching Star Citizen

1. `joy.cpl` (USB Game Controllers) shows the expected vJoy devices and no physical devices
2. Open Joystick Gremlin `Input Viewer`, check `buttons` and `axis` for both vJoy devices, then move physical controls while the profile is active to verify output.

## Next Step

Only after those checks pass, Continue with [Star Citizen Setup](star-citizen-setup.md).