# Importing Binds into Star Citizen

This step imports the Star Citizen XML files and validates your profile in game.

## Files You Need

- `layout_SUB_Clear_Bindings_480_exported.xml`
- The joystick-specific `layout_*_exported.xml`

## Import Process

1. Place both XML files in your Star Citizen controls import directory. Typical default path:
    `C:\Program Files\Roberts Space Industries\StarCitizen\LIVE\USER\Client\0\Controls\Mappings`
2. Launch Star Citizen.
3. Open **Options → Keybindings → Advanced Controls Customization**.
4. Import `layout_SUB_Clear_Bindings_480_exported.xml` first. This should clear existing binds. It's still good practice to manually confirm everything is empty by expanding each binding category and removing any stragglers.
5. Import your joystick-specific `layout_*_exported.xml` second.

## Activation Order (Important)

1. Start Joystick Gremlin
2. Activate your Gremlin profile (Green Controller Icon)
3. Launch Star Citizen

!!! tip "Pro Tip"
    Once this is working, if you accidentally start Star Citizen before activating your profile or connecting sticks, you usually do not need to restart the game.

!!! notice
    Any changes to Joystick Gremlin require profile deactivation and reactivation to take effect.

## Axis Mapping and Inversion Settings

- Verify axis are properly inverted.
    - There is a good chance one or more axes will be inverted. This is usually a Star Citizen/hardware quirk, not a bind file issue. Axis inversion is stored in your local Star Citizen settings and depends on hardware and preference.
    - You can swap the inversion settings by going into **Settings → Options → Inversion Settings.**.
    - Select which joystick to edit from the bottom-right device selector. Joystick 1 is usually left stick (or throttle on some setups); Joystick 2 is usually right stick.
- Change axis to your perference.
    - Axis choices for yaw, roll, and strafe are very subjective. This setup is optimized for dual-stick 6DOF spaceship control and may feel different if you come from traditional flight sim layouts.
    - If you prefer a different setup it only takes a few seconds to change it. You can change what axis are bound to what in **Advanced Controls Customization → Flight Movement → Pitch, Yaw, Roll, etc.**.

If controls look doubled, incorrect, or missing, return to [Software Configuration](software-configuration.md) and re-check HIDHide plus vJoy visibility.