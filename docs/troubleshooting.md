# Troubleshooting

If your binds are not working as expected, use this page before opening a support post. Find your symptom below — these are the problems that actually come through support, and almost all of them have a one-step fix.

## Start Here

1. Re-check [Software Configuration](general-setup/software-configuration.md){ data-preview }
2. Re-check [Star Citizen Setup](general-setup/star-citizen-setup.md){ data-preview }
3. Confirm you imported `layout_SUB_Clear_Bindings_4xx_exported.xml` first, then your joystick-specific layout file
4. Confirm Joystick Gremlin profile is active before launching Star Citizen

## Common Symptoms

### Left and right sticks are swapped in game

Your binds are fine — Star Citizen has the two vJoy devices in the wrong order. Open the in-game console with `` ` `` (backtick) and run:

```
pp_resortdevices joystick 1 2
```

You only need to do this once; it sticks until you reset your SC settings.

!!! danger "Do not edit the exported XML to fix this"
    Swapping `js1`/`js2` inside the `layout_*_exported.xml` file looks like it works, but it leaves you with a layout that no longer matches the charts or future updates. Fix the device order in SC with the console command instead.

### Ship spins or drifts with no input

Star Citizen is seeing your **physical** sticks *and* the vJoy devices at the same time — double input. HIDHide isn't actually hiding your hardware:

1. Open HIDHide and re-check both tabs against the [HIDHide Configuration](general-setup/software-configuration.md#hidhide-configuration){ data-preview } screenshots — physical sticks ticked (hidden), **Enable Device Hiding** on.
2. **Unplug your sticks and plug them back in** (or reboot). HIDHide only starts cloaking a device the next time Windows enumerates it.
3. Restart Star Citizen — it picks up device changes at launch.

Quick check: `joy.cpl` should list **only** the two vJoy devices. If a physical stick still shows there, the cloak isn't active yet.

### An axis (or everything) is inverted

Fix inversion **in Joystick Gremlin, not in Star Citizen's settings** — SC-side inversions get wiped by patches and settings resets. The full procedure is in [Axis Mapping and Inversion Settings](general-setup/star-citizen-setup.md#axis-mapping-and-inversion-settings){ data-preview }. The short version:

1. Turn the JG profile **off**.
2. Click the device tab for the stick, then move the axis — JG jumps to its mapping.
3. Click **Invert Curve**.
4. Turn the profile back on, and **save with the toolbar Save icon**.

If the flip doesn't seem to take, check the **Configuring mode** dropdown (top-right) — you may be editing a mode you don't fly in.

### Inputs register in Joystick Gremlin but nothing happens in game

Nine times out of ten the profile simply isn't **active**. Click the joystick icon in JG's toolbar — it turns **blue** when the profile is live. Test in **Tools → Input Viewer**: if the *vJoy* devices don't respond when you move your sticks, the profile is off.

If the profile is on and vJoy responds in Input Viewer but SC still ignores you, re-run the [Star Citizen Setup](general-setup/star-citizen-setup.md){ data-preview } import steps — most often the Clear Bindings file wasn't loaded first.

### JG turns my profile off when I alt-tab (or randomly)

Joystick Gremlin deactivates the profile when Windows reports a device change — USB power saving and some hubs fire these events constantly. In JG go to **Settings → Device change behavior** and set it to **Ignore**.

### My sticks disappear from JG when I enable HIDHide

HIDHide is hiding your sticks from Joystick Gremlin itself, which means the `joystick_gremlin.exe` in HIDHide's **Applications** allow-list isn't the one you're actually running. The usual cause is **two JG installs** — an old R13 plus the current R14.

1. Right-click the running JG's taskbar icon to see where its `.exe` actually lives.
2. **Uninstall/delete any other Joystick Gremlin installs** (anything older than R14.x).
3. In HIDHide → Applications, remove the stale entry and add the `.exe` you found in step 1.

### HIDHide refuses to cloak — joy.cpl still shows physical sticks

If your allow-list and device list match the screenshots, you've re-plugged the sticks, and `joy.cpl` *still* shows physical hardware:

- **Update HIDHide.** Old HIDHide versions fail to cloak on current Windows builds — this exact case has come through support.
- Toggle **Enable Device Hiding** off, pause a few seconds, and back on.

### Star Citizen shows my vJoy devices as joystick 3+ (or 5 and 6)

Something else is occupying the first joystick slots. The usual culprit: **analog keyboards (Wooting and similar) enumerate as four game controllers**, pushing vJoy down the order. Hide the keyboard in HIDHide's Devices tab — **it will still type normally**; you only lose its analog-gamepad emulation. Then fix the order with `pp_resortdevices` if needed (see the swapped-sticks entry above).

### Fatal error when loading the JG profile (mentions a script or a drive you don't have)

If the error references a `.py` file or a path like `E:\...` that doesn't exist on your machine, the profile contains a `<scripts>` block pointing at files that aren't on your system. **Re-download the profile from the release** — current releases ship without it. If you need a manual fix: open the profile XML in a text editor and replace the whole `<scripts>…</scripts>` block with `<scripts/>`.

### I want to add pedals, a button box, or an SEM

That's not a problem, it's a feature — see [Adding extra devices](faq/enhanced-bindings-faq.md#can-i-add-rudder-pedals-a-button-box-or-an-sem-to-the-enhanced-binds){ data-preview } in the FAQ.

## Discord FAQ Channels

Common Enhanced bind issues are documented here:

- [Enhanced Binds FAQ](https://discord.com/channels/303670222097874945/1297919077062279209)

Common joystick and Star Citizen issues are documented here:

- [Peripheral FAQ](https://discord.com/channels/303670222097874945/1154143410215731201)

## Need Help From Support?

If your issue is not covered above or in those FAQ channels, follow the pinned instructions and open a post in:

- [Enhanced Bindings Support Forum](https://discord.com/channels/303670222097874945/1006954369800998992)

## What to Include in Your Post

- Joystick hardware and firmware version
- Star Citizen patch/build
- Which profile and XML files you loaded
- What you expected vs what happened
- Screenshots of Joystick Gremlin, HIDHide, vJoy, and USB Game Controllers (`joy.cpl`)

Using that format gets faster, more accurate help.
