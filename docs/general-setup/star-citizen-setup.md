# Importing Binds into Star Citizen

This step imports the Star Citizen XML files and validates your profile in game.

## Files You Need

- `layout_SUB_Clear_Bindings_4xx_exported.xml` — **required**, must be imported first (`4xx` matches the current SC patch — e.g. `480` for 4.8.0)
- The joystick-specific layout: `layout_ENH_*_4xx_<channel>_exported.xml` (`*` = your stick's code, `4xx` = SC patch, `<channel>` = `LIVE` / `PTU` / etc. — e.g. `layout_ENH_*_480_LIVE_exported.xml`)

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

**Step 7. Quick sanity check before you fly out.** Launch Arena Commander → Free Flight. Move your stick — pitch, roll, and yaw should respond. Push your throttle — forward thrust should register. Press a button you know is bound (e.g. landing gear). If anything's wrong here, fix it now rather than discovering it in the PU — head to [troubleshooting](../troubleshooting.md){ data-preview }.

### Keep my keyboard / mouse binds

If you skipped Mouse + Keyboard in the load dialogs at steps 4 and 6, your existing keyboard / mouse profile stays intact. The trade-off: some layouts lean on a few keyboard keys staying bound to their Star Citizen defaults — mostly macros that press a key SC won't let you bind to a joystick. If you keep your own keyboard / mouse profile, you may need to re-add those keys by hand.

**Which keys matter is specific to your stick.** Open your stick's page from the [joystick overview](../joysticks/index.md){ data-preview } and check its **Keyboard Binds Used** section for the list.

If a macro stops doing what it says, the fastest check is **Options → Keybindings → Keyboard / Mouse**, search for the action, and confirm it's still bound to its default.

## Joystick order — left/right sticks act swapped

If your sticks pass the sanity check but the **wrong stick** is doing each job — throttle on the right, aiming on the left — Star Citizen has the two vJoy devices in the wrong order. The binds are fine; the device slots are flipped.

Open the in-game console with `` ` `` (backtick) and run:

```
pp_resortdevices joystick 1 2
```

You only need to do this once — it persists until you reset your SC settings.

!!! danger "Do not edit the exported XML to fix this"
    Swapping `js1`/`js2` inside the `layout_*_exported.xml` looks like a fix, but it leaves your layout out of sync with the charts and every future update. Always fix device order in SC with the console command.

## Every-time-you-play startup order

This is the order you'll follow **every session**. By default Joystick Gremlin doesn't start with Windows or with Star Citizen, so you bring it up and activate your profile yourself:

1. Start Joystick Gremlin
2. Activate your Gremlin profile — click the **joystick icon** ( <svg width="14" height="14" viewBox="0 0 16 16" fill="currentColor" style="vertical-align:text-bottom"><path d="M10 2a2 2 0 0 1-1.5 1.937v5.087c.863.083 1.5.377 1.5.726 0 .414-.895.75-2 .75s-2-.336-2-.75c0-.35.637-.643 1.5-.726V3.937A2 2 0 1 1 10 2"/><path d="M0 9.665v1.717a1 1 0 0 0 .553.894l6.553 3.277a2 2 0 0 0 1.788 0l6.553-3.277a1 1 0 0 0 .553-.894V9.665c0-.1-.06-.19-.152-.23L9.5 6.715v.993l5.227 2.178a.125.125 0 0 1 .001.23l-5.94 2.546a2 2 0 0 1-1.576 0l-5.94-2.546a.125.125 0 0 1 .001-.23L6.5 7.708l-.013-.988L.152 9.435a.25.25 0 0 0-.152.23"/></svg> ) in the toolbar. It turns **blue** when active.
3. Launch Star Citizen

!!! tip "Order isn't strict"
    Even if Star Citizen is already running, you can start Joystick Gremlin and activate the profile at any point — your sticks will start working without restarting the game.

!!! note "Keep Joystick Gremlin running"
    Joystick Gremlin has to stay running the whole time you play — close it and the profile stops, so your sticks go dead in-game. vJoy and HIDHide don't need to be open; they work passively once configured.

!!! tip "Want it automatic?"
    Joystick Gremlin can be set to launch when Windows starts, and to auto-activate the profile when a game launches — neither is on by default. If you'd rather skip the two manual steps each session, turn those on in JG's options.

!!! notice
    Any changes to Joystick Gremlin require profile deactivation and reactivation to take effect.

## Axis Mapping and Inversion Settings

**Invert your axes in Joystick Gremlin — not in Star Citizen.** Every axis on the profile already ships with a flat response curve, so flipping one is a single click, and once you **Save** the profile it *persists* — through patches, reinstalls, and bind wipes. Inversions set inside SC get wiped whenever CIG resets controls, which is exactly why we keep all inversion in one place.

First, though, start from a clean baseline — **Star Citizen axes at default and your stick at its vendor defaults.** If an old setup left inverts stacked in either spot, they'll fight Joystick Gremlin and you'll chase your tail.

- **Reset Star Citizen to default** — untick any inverts under **Options → Inversion Settings**, or run the **Reset Axis Inversions** option in your stick's `Tools` Bindings Toolkit (it strips every invert flag out of `actionmaps.xml`, and backs the file up first). The tool is the faster, no-guessing route.
- **Vendor software** — don't overthink this one. Axis inversion lives deep in VKBDevCfg / Virpil / MOZA / TARGET, and you don't stumble into it by accident. If you don't remember ever flipping an axis in there, you didn't — skip it. Only go look if an axis is *still* backwards after JG and SC are both squared away.

### Flip an axis in Joystick Gremlin

1. Open Joystick Gremlin and select your stick from the device tabs.
2. Click the axis you want to invert.
3. Click the **Invert Curve** button on that axis's response curve.
4. **Save** the profile (toolbar Save icon — the page-with-a-down-arrow; Ctrl+S does nothing in R14.x), then deactivate and reactivate so it takes effect.

If you've never touched inversion in your vendor software, you'll usually only flip one or two axes to match personal preference. Keep **all** inversion in JG — don't stack in-game or vendor-software inversion on top, or they'll fight each other.

!!! notice "Flip didn't take? Check the mode."
    Look at the **Configuring mode** dropdown in the top-right of the JG editor. It doesn't default to the mode you actually fly in — it lands on the first mode alphabetically — so it's easy to edit an axis in a mode you never use and swear nothing changed. Set it to the mode you fly in (**SCM Mode** for most people).

!!! tip "Save a clean personal copy"
    Once everything's set the way you like, use **File → Save As** to save your tweaked profile under a new name. That keeps the shipped profile pristine as a fallback so you never accidentally overwrite it.

### Inverting in Star Citizen (the backup)

You *can* flip axes in-game instead — the steps are in the FAQ: [My Throttle/Roll/Any Axis is inverted?](../faq/general-joystick-star-citizen-faq.md#my-throttlerollany-axis-is-inverted){ data-preview }. Just know the trade-off: **SC-side inversions don't persist.** A reinstall, a wipe, or sometimes just a patch wipes them out and you're redoing it. Use it as a quick fix, not the permanent home.

The specific axes that need flipping depend on your stick and base revision — for example, the non-EVO Gladiator NXT base reports a few axes inverted that the EVO doesn't. Your stick's own page lists the inversions recommended for that setup.

### Change axis to your preference

Axis *choices* (which physical axis drives yaw vs roll vs strafe) are subjective. This setup is optimized for dual-stick 6DOF spaceship control and may feel different if you come from traditional flight sims. To remap, head to **Advanced Controls Customization → Flight Movement → Pitch, Yaw, Roll, etc.** — it only takes a few seconds.

If controls look doubled, incorrect, or missing, return to [Software Configuration](software-configuration.md){ data-preview } and re-check HIDHide plus vJoy visibility.

## Next: read your stick's README

You're set up. Head to the [joystick overview](../joysticks/index.md){ data-preview }, open the page for your stick, and read it through. That's the canonical source for what each input does, the Swap Devices flow, your vendor software's required defaults, the MFD fix script, and anything specific to your hardware. The general setup walkthrough gets you working; the stick page is where you actually learn the binds.