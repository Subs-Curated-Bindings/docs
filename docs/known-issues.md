# Known Issues

## MFD Binds

!!! bug
    MFD Binds do not import properly into Star Citizen, this is a bug. 4.5 seems to have an issue with the `Stop Watch` binds not importing as well (but those binds are don't work in-game anymore lol). Any binds that dont load also have to be cleared manually to remove them. So you will need to add them manually, but then they should stick after that. You can find the binds in the advanced keybind settings under `Vehicles - Multi Function Displays (MFDs)`.

    To find out what minds to add consult your joysticks binds read me.

## The Joystick Gremlin profile turns itself off randomly

!!! warning
	There is a known issue with JG where the profile can stop when a HID device disconnects or reconnects.

- If you have any device that randomly disconnects/reconnects, or a flaky USB hub, that is likely the cause.
- Joystick Gremlin R14 is expected to have a codebase that handles this better. The developer works on it in spare time, so there is no short-term ETA, but at least we know why it happens and how to reduce it.

## Failed to Execute Script Joystick Gremlin

!!! bug
    When you enable the setting in JG to start Joystick Gremlin with Windows, you may get this error: `Failed to execute script joystick_gremlin`. This usually happens because Windows starts Joystick Gremlin before essential services/programs are ready.

??? tip "Possible Workaround"
    You can disable that startup setting to avoid the error. I have heard of a fix, but I haven't tested it yet: add a Joystick Gremlin shortcut to your startup folder, and possibly remove it from Windows Startup Apps.

