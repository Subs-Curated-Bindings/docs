# Importing Binds into Star Citizen

This step imports the Star Citizen XML files and validates your profile in game.

## Files You Need

- `layout_SUB_Clear_Bindings_4xx_exported.xml` — **required**, must be imported first (`4xx` matches the current SC patch — e.g. `480` for 4.8.0)
- The joystick-specific `layout_*_exported.xml`

## Import Process

1. Place both XML files in your Star Citizen controls import directory. Typical default path — **`LIVE` here is a wildcard**; replace it with whichever channel you're setting up (`LIVE`, `PTU`, `EPTU`, `TECH-PREVIEW`, etc.):
    `C:\Program Files\Roberts Space Industries\StarCitizen\LIVE\USER\Client\0\Controls\Mappings`

    If you play on more than one channel (e.g. LIVE *and* PTU during a test cycle), repeat this step for each — files dropped into `LIVE\...\Mappings` are not visible to `PTU` and vice versa.
2. Launch Star Citizen.
3. Open **Options → Keybindings → Advanced Controls Customization**.
4. **Import `layout_SUB_Clear_Bindings_4xx_exported.xml` first.** This is not optional — these profiles assume a fully empty starting state, and any leftover bind from a previous setup will cause conflicts, doubled inputs, or actions that silently fight each other in flight.
5. **Manually verify the wipe took.** Scroll to the **bottom** of the keybindings list, then work your way upward and click each category header to expand it. You can rip through every category in seconds this way. Once they're all open, scroll back through and visually scan for anything still bound — the clear file gets the vast majority, but SC occasionally leaves stragglers. Remove anything you find before continuing.
6. Import your joystick-specific `layout_*_exported.xml` last.
7. **Quick sanity check before you fly out.** Launch Arena Commander → Free Flight. Move your stick — pitch, roll, and yaw should respond. Push your throttle — forward thrust should register. Press a button you know is bound (e.g. landing gear). If anything's wrong here, fix it now rather than discovering it in the PU — head to [troubleshooting](../troubleshooting.md).

!!! warning "Skipping the clear file will break things"
    Don't try to import the joystick layout on top of your existing binds. Even one leftover bind on the same action can cause SC to either reject the import partially or run two conflicting actions on the same input. Always clear first, verify, then import the stick.

## Every-time-you-play startup order

This is the order you'll follow **every session**, not just during first-time setup — Joystick Gremlin doesn't auto-start with Star Citizen, so you have to bring it up and activate your profile before the game launches.

1. Start Joystick Gremlin
2. Activate your Gremlin profile (click the green Activate icon)
3. Launch Star Citizen

!!! tip "Pro Tip"
    Once this is working, if you accidentally start Star Citizen before activating your profile or connecting sticks, you usually do not need to restart the game — activate the profile, then alt-tab back into SC.

!!! notice
    Any changes to Joystick Gremlin require profile deactivation and reactivation to take effect.

## Axis Mapping and Inversion Settings

- Verify axis are properly inverted.
    - There is a good chance one or more axes will be inverted. This is usually a Star Citizen/hardware quirk, not a bind file issue. Axis inversion is stored in your local Star Citizen settings and depends on hardware and preference.
    - You can swap the inversion settings by going into **Settings → Options → Inversion Settings.**.
    - Select which joystick to edit from the bottom-right device selector. Joystick 1 is usually left stick (or throttle on some setups); Joystick 2 is usually right stick.
- Change axis to your preference.
    - Axis choices for yaw, roll, and strafe are very subjective. This setup is optimized for dual-stick 6DOF spaceship control and may feel different if you come from traditional flight sim layouts.
    - If you prefer a different setup it only takes a few seconds to change it. You can change what axis are bound to what in **Advanced Controls Customization → Flight Movement → Pitch, Yaw, Roll, etc.**.

If controls look doubled, incorrect, or missing, return to [Software Configuration](software-configuration.md) and re-check HIDHide plus vJoy visibility.

## Next: read your stick's README

You're set up. Head to the [joystick overview](../joysticks/index.md), open the page for your stick, and read it through. That's the canonical source for what each input does, the Swap Devices flow, your vendor software's required defaults, the MFD fix script, and anything specific to your hardware. The general setup walkthrough gets you working; the stick page is where you actually learn the binds.