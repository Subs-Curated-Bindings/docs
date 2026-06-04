# Known Issues

## MFD Binds

!!! bug "SC `vehicle_mfd` wipe — worked around by the shipped fix script"
    Star Citizen has a long-standing bug where the `vehicle_mfd` actionmap gets stripped every time you load a control profile over an existing one:

    * 7 MFD actions get reset to unbound (`<rebind input="js2_ "/>`).
    * 2 actions (`v_mfd_soft_select_cast_left/right_short`) get **deleted** from `actionmaps.xml` outright.

    The bug is silent — the keybind menu shows the actions normally, just unbound or missing. Most users only find out when an MFD action stops working in-game.

Every Enhanced package ships a fix script in its `Tools/` folder (named `Fix MFD Binds [ENH]…` or, on newer sets, the `Bindings Toolkit [ENH]…` menu). Load your layout, fully close Star Citizen and the RSI Launcher, run the script and pick your SC channel, then relaunch — MFDs work. The script backs up `actionmaps.xml` first, refuses to run while SC is open, and is safe to run twice.

For the exact script name, step-by-step workflow, and a manual rebind fallback table, see the **MFD bind fix** section on your joystick's [README page](joysticks/index.md).

## Failed to Execute Script Joystick Gremlin

!!! bug
    When you enable the setting in JG to start Joystick Gremlin with Windows, you may get this error: `Failed to execute script joystick_gremlin`. This usually happens because Windows starts Joystick Gremlin before essential services/programs are ready.

??? tip "Possible Workaround"
    You can disable that startup setting to avoid the error. I have heard of a fix, but I haven't tested it yet: add a Joystick Gremlin shortcut to your startup folder, and possibly remove it from Windows Startup Apps.

