# Importing Binds into Star Citizen

This step imports the Star Citizen XML files and validates your profile in game.

## Files You Need

- `layout_SUB_Clear_Bindings_4xx_exported.xml` — **required**, must be imported first (`4xx` matches the current SC patch — e.g. `480` for 4.8.0)
- The joystick-specific `layout_*_exported.xml`

## Import Process

**Step 1. Drop the XML files where SC can see them.** Both files go in your Star Citizen controls mapping directory. Typical default path:

```
C:\Program Files\Roberts Space Industries\StarCitizen\LIVE\USER\Client\0\Controls\Mappings
```

**`LIVE` here is a wildcard** — replace it with whichever channel you're setting up (`LIVE`, `PTU`, `EPTU`, `TECH-PREVIEW`, etc.). If you play on more than one channel (e.g. LIVE *and* PTU during a test cycle), drop the files into each channel's `Mappings` folder — files don't carry between channels.

**Step 2. Launch Star Citizen.**

**Step 3.** Open **Options → Keybindings → Control Profiles**. You should see both of your newly-dropped layouts listed there alongside SC's default profiles.

**Step 4. Load `SUB_Clear_Bindings_4xx` first.** Click it in the Control Profiles list. SC pops up a dialog asking which devices to apply the profile to — **check all four (Mouse, Keyboard, Joystick 1, Joystick 2)** and confirm.

This file is empty by design — it wipes SC's binds so the joystick layout can land on a clean slate. Loading it first is not optional; any leftover bind from a previous setup will cause conflicts, doubled inputs, or actions that silently fight each other in flight.

!!! warning "Loading the Clear file to Mouse + Keyboard overwrites your existing binds"
    If you've customized your SC keyboard or mouse profile and want to keep those binds, **un-check Mouse and Keyboard in this dialog** — load to Joystick 1 + Joystick 2 only. See [Keep my keyboard / mouse binds](#keep-my-keyboard--mouse-binds) below for the trade-off (a couple of macros expect specific keyboard keys to remain bound to their SC defaults).

**Step 5. Manually verify the wipe took.** Open **Options → Keybindings → Advanced Controls Customization** and scroll through the categories. Quickest way: scroll to the bottom, click each category header upward to expand them all, then scan back through. The clear file gets the vast majority, but SC occasionally leaves a stray entry — remove anything you find before continuing.

**Step 6. Load the joystick layout the same way.** Back on **Control Profiles**, click your stick's layout file (e.g. `ENH_NXT_480_LIVE`, `ENH_SOL-R2_480_LIVE`, etc.). Same dialog as Step 4 — **load to all four (Mouse, Keyboard, Joystick 1, Joystick 2)** unless you're keeping your kb/mouse profiles, in which case load to Joystick 1 + 2 only.

**Step 7. Quick sanity check before you fly out.** Launch Arena Commander → Free Flight. Move your stick — pitch, roll, and yaw should respond. Push your throttle — forward thrust should register. Press a button you know is bound (e.g. landing gear). If anything's wrong here, fix it now rather than discovering it in the PU — head to [troubleshooting](../troubleshooting.md).

### Keep my keyboard / mouse binds

If you skipped Mouse + Keyboard in the load dialogs at steps 4 and 6, your existing keyboard / mouse profile stays intact. **What you lose** by not loading to those slots:

* **Four alternate keyboard binds** the shipped layout carries. These are convenience extras — the same actions are already bound to joystick buttons, so functionally nothing is missing:
    * `kb_up` → Enter remote turret 1
    * `kb_right` → Enter remote turret 2
    * `kb_left` → Enter remote turret 3
    * `kb_h` → Toggle helmet attach

* **A couple of macros press keyboard keys** that need real SC actions bound for the macro to do anything. These keys aren't in the shipped layout — they assume SC's defaults are in place:
    * **F4** (all sticks) — pressed by the *Recenter freelook* macro. SC's default keyboard bind for F4 is **Toggle Free Look** — keep that intact (or manually re-add it) or the macro's keyboard side does nothing.
    * **Numpad ★** (SOL-R only) — pressed in chord with F4 for an SC action that doesn't allow a joystick bind. SC's default for Numpad ★ needs to stay in place too.

If a macro stops doing what it says, the fastest check is **Options → Keybindings → Keyboard / Mouse → search "Free Look"** and confirm F4 is still bound. Re-bind manually if needed.

## Every-time-you-play startup order

This is the order you'll follow **every session**, not just during first-time setup — Joystick Gremlin doesn't auto-start with Star Citizen, so you have to bring it up and activate your profile before the game launches.

1. Start Joystick Gremlin
2. Activate your Gremlin profile (click the blue Activate icon)
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