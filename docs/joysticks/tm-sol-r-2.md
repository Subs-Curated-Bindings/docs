# Enhanced — Dual Thrustmaster SOL-R 2

!!! warning "Requires Joystick Gremlin R14"
    These binds run on Joystick Gremlin R14 (14.2 or later). R13 is no longer supported — if you're still on R13, update before loading this profile.

!!! note "First load: binds will look blank — that's intended"
    When you first load this profile in JG R14, all the binds will look blank. That's intended, not broken. The profile ships against the device GUIDs of the sticks we exported on, so your hardware needs to be matched in.

    Run **Tools → Swap Devices** in JG, point each profile slot at your physical sticks. **Save the profile** afterwards (Ctrl+S) — without the save, you'll be redoing this every time JG starts.

A tuned dual-stick keybind setup for Star Citizen built around the Thrustmaster SOL-R 2. Same philosophy as the rest of the Enhanced binds — modifier layers, mode switching (SCM / Aux / Nav), tempo-driven tap-vs-hold binds, JG-owned inversion that survives SC's wipes and reinstalls.

These binds use Joystick Gremlin to layer modifiers, mode switching, response curves, and macros on top of SC's bind system. Ship combat, mining, salvage, ground vehicles, and turrets all run off the same physical inputs — once you learn the chart, the same hand positions carry across every gameplay loop.

???+ abstract "Change Log"

    **4.8.0 PTU — May 2026**

    * **Light amplification toggle** bound on two left-stick inputs:
        * **Left rapid-fire trigger** — tap < 0.5s fires `v_invoke_ping` (unchanged); hold ≥ 0.5s fires light amp toggle.
        * **Left button 19** — tap < 0.5s fires the existing ship-lights / flashlight chain (unchanged); hold ≥ 0.5s fires the same toggle.
    * New `Fix MFD Binds [ENH][SOL-R 2][4.8.0][PTU].bat` script works around SC's long-standing `vehicle_mfd` wipe bug. See [MFD bind fix](#mfd-bind-fix-workaround-for-sc-bug).
    * **Axis inversion is now fully handled inside Joystick Gremlin.** The layout XML no longer ships SC-side `<options type="joystick">` invert overrides — SC's keybind-menu Invert toggles can stay at game defaults. If you do want to flip an axis, you can do it in SC's keybind menu or in JG by flipping the response curve. JG is the one that sticks — patches, wipes, and fresh installs all reset SC's setting; the JG flip travels with the profile.
    * Various spelling errors across audio file paths fixed. If you had a custom profile referencing the old paths, repoint after import.
    * **Heads up — JG R14 macro editor visual bug.** Opening a macro action in JG R14's editor can show "X Axis" on `<vjoy>` rows where the XML correctly says Button. Visual only, ignore it. See [Known Issues](#jg-r14-macro-editor-x-axis-rendering-bug).

## Hardware required

* **Thrustmaster SOL-R 2 dual stick setup.** Other Thrustmaster hardware won't load the profile cleanly without remapping in JG's Tools → Swap Devices. Doable, but not the supported configuration.

If you don't have Joystick Gremlin and vJoy installed yet, walk through the [general setup guide](../general-setup/software-installation/vjoy-installation.md) first.

## What makes these binds different

If you'd never opened Joystick Gremlin and bound your sticks directly through SC's keybind menu, you'd hit four walls fast:

* **No modifier layer.** SC has no real concept of "this button does X normally and Y while holding modifier." You'd be stuck with one function per physical button.
* **No custom hold timing.** SC's bind system supports multi-tap, but hold behavior is baked into each action — if CIG shipped a "Long Press" variant you can bind that, otherwise you can't add one. JG sidesteps this by synthesizing the gesture: a 0.5-second hold on the left rapid trigger fires the light amplification toggle, even though SC has no "hold to toggle" option for that action.
* **No clean macros for SC's toggle actions.** SC has actions like `v_light_amplification_toggle` that only fire on a complete press+release cycle. A sustained vJoy press doesn't trigger them. JG lets you synthesize a clean tap shape from any input gesture.
* **Inversion is fragile.** Inversion lives in SC's keybind menu by default. It gets reset by reinstalls, patch wipes, fresh installs on a new machine. If you want it to survive any of those, it needs to live somewhere SC doesn't manage.

This profile addresses all four. The next section walks through how.

## The patterns explained

Most physical buttons just feed a single virtual button straight through to SC. Where things get more interesting is the categories below — these are the techniques that make this setup work the way it does.

### Modifier mode — doubles your usable binds

Hold the modifier button and every other button on both sticks fires a *different* SC action. The extra layer is where most of the niche binds live — engineering controls, advanced view options, vehicle-specific stuff. The chart shows the un-modified action in one color and the modified action in a contrasting color so you can read both layers at a glance.

### Mode switching — SCM / Aux / Nav

The same physical buttons behave differently depending on which mode you're in. Three core modes:

=== "SCM Mode"
    Combat / general flight. The default mode.

=== "Aux Mode"
    Auxiliary roles — mining, salvage, scanning. Trigger-stage and gimbal binds reroute to mining lasers, salvage beams, scan triggers.

=== "Nav Mode"
    Quantum / NAV travel posture. View binds shift, weapon binds quiet down.

You switch modes from a dedicated physical button (see the chart). The current mode survives until you switch again — JG holds the mode state, not SC.

### Tempo binds — tap vs hold

A small number of binds fire one action on a quick tap and a different action on a longer hold of the same physical button. On the SOL-R 2 setup, **both light-amp routes** (left rapid trigger + left button 19) use this pattern: short tap = the original action, hold past 0.5s = light amplification toggle.

The threshold is 500ms by default. Tempo binds that wrap a SC toggle action use a 100ms macro tap on the long-action side, because SC's toggles only fire on a complete press+release cycle and a sustained vJoy hold won't trigger them.

### Macros — clean tap shapes for stubborn SC actions

Whenever a bind needs to produce a "clean tap" for SC regardless of how long the user physically holds the input, it goes through a JG macro: vJoy press → 100ms pause → vJoy release. SC sees a complete cycle and the action fires once. This is how the held-trigger and held-button-19 light-amp toggles work — both routes share the same 100ms-tap macro under the hood, mapped to vJoy 1 button 95.

You'll never see this from the user side — it's behind the curtain. But if you ever go editing the JG profile, knowing why these macros exist will save you from "fixing" something that wasn't broken.

### Flat response curves on every map-to-vJoy axis

Every axis-to-vJoy mapping in the profile uses a baseline linear response curve. There's no curve-shaping going on for control feel — SC handles per-axis sensitivity in its own UI, that's the right place for it.

The reason for the explicit curve isn't sensitivity. It's **inversion durability**. JG's response curve carries the inversion flag. By living in JG instead of SC's keybind menu, inversion survives:

* SC reinstalls
* Patch resets
* Fresh installs on a new machine
* The wipe (when CIG nukes character data and bindings on a major release)

If your inversion is in SC, you reset it every time. If it's in JG, you set it once and it travels with the profile.

The 4.8.0 release strips out the SC-side `<options type="joystick">` invert overrides earlier versions of these binds shipped. Inversion is now exclusively a JG concern. SC's keybind menu Invert toggles can stay at game defaults — JG handles the rest.

## MFD bind fix (workaround for SC bug)

!!! bug "SC `vehicle_mfd` wipe — worked around by the shipped fix script"
    Star Citizen has a long-standing bug where the `vehicle_mfd` actionmap gets stripped every time you load a control profile over an existing one. Specifically:

    * 7 MFD actions get reset to unbound (`<rebind input="js2_ "/>`).
    * 2 actions (`v_mfd_soft_select_cast_left/right_short`) get **deleted** from `actionmaps.xml` outright.

    The bug is silent — the keybind menu shows the actions normally, just unbound or missing. Most users find out when an MFD action stops working in-game.

The shipped `Fix MFD Binds [ENH][SOL-R 2][4.8.0][PTU].bat` script puts them all back. Workflow:

1. Load the SOL-R 2 layout in-game (Customization → Control Profiles → Use this profile).
2. Fully close Star Citizen and the RSI Launcher.
3. Double-click the `.bat`. Pick your SC channel at the prompt (LIVE / PTU / EPTU / HOTFIX / TECH-PREVIEW).
4. Launch SC. MFDs work.

!!! tip "Star Citizen installed on a different drive?"
    If your install isn't at the default `C:\Program Files\Roberts Space Industries\StarCitizen\` location, the script prompts you for the path to your install folder (the one that contains `LIVE` / `PTU` / `EPTU` subfolders) before the channel prompt. Paste the path and continue as normal.

The script:

* Makes a timestamped backup of `actionmaps.xml` before any change.
* Refuses to run if SC or RSI Launcher is alive (would lose the fix to SC's auto-write on close).
* Is **idempotent** — running it twice gives identical results, no double-bindings.
* Self-heals if SC ever nukes the entire `vehicle_mfd` actionmap (rare but possible) by rebuilding the block from scratch.

If you'd rather rebind manually via SC's keybind UI instead of running the script, here's the table:

### Manual fallback — re-bind via SC's keybind menu

| SC action (Customization → Keybindings → MFD) | vJoy mapping |
| --- | --- |
| MFD - Cycle Page - Backwards (Short Press) | `button19 (Input2)` |
| MFD - Cycle Page - Forwards (Short Press) | `button18 (Input2)` |
| MFD - Movement - Up (Long Press) | `button17 (Input2)` |
| MFD - Movement - Down (Long Press) | `button16 (Input2)` |
| MFD - Movement - Left (Long Press) | `button19 (Input2)` |
| MFD - Movement - Right (Long Press) | `button18 (Input2)` |
| MFD - Select - Left Cast (Short Press) | `button69 (Input2)` |
| MFD - Select - Right Cast (Short Press) | `button68 (Input2)` |

Physical input labels for these are on the binding chart — see the MFD section. Unlike the NXT setup, the SOL-R 2's soft-select-cast actions live on their own dedicated buttons (no multi-tap needed).

## Features and Functions

### Free-look

Free-look is bound on the SOL-R 2 — see the binding chart for the exact location. Same gesture pattern as the rest of the Enhanced binds: enter 3rd-person, toggle to analog look mode, look around independently of flight controls.

### Eye Tracker Targeting

My main way to target in Star Citizen is via an eye tracker. Adds to immersion and is way easier than the native binds — look at the target, press a button, locked. Two eye trackers worth considering:

* **Tobii Eye Tracker** is the next-generation head + eye tracking option. Unlocks unique features that deepen immersion in Star Citizen, MSFS, DCS, and more. For 5% off, visit <https://tobii.subliminal.gg> and use code `subliminal` at checkout. *Purchases through that link support the curation of these binds.*

* **Beam Eye Tracker** is a more budget-friendly alternative — software-only, runs off your existing webcam. Limitations around dark rooms and seeing through glasses, but if you've got a webcam and want to try eye tracking, it's a must-have IMO. Free trial on Steam, or buy direct. For more info: <https://beam.subliminal.gg>. *Direct purchases through that link support the curation of these binds; Steam purchases do not.*

## Customizing

* **Different inversion preferences.** Open the JG profile, find the axis you want to flip, edit the response-curve action — there's an Invert toggle on the curve itself. Save. Don't touch SC's keybind menu Invert toggles; they're meant to stay at defaults for this profile.

* **Different modifier button.** The modifier button is a single physical input mapped as the modifier "shift" in JG. Find the input that drives Modifier mode, swap it for whichever physical button you'd rather use. JG's UI is safer for this than editing the XML directly.

* **Tweak tempo timing.** The light-amp tempos default to a 500ms threshold. To change them, find the tempo actions in the JG library and update the `threshold` value. 250ms is more sensitive (briefer holds count); 750ms is more deliberate. Both routes share the same threshold by default.

## Known Issues

### JG R14 macro-editor "X Axis" rendering bug

Project-wide — affects every stick in this pack. When you open a macro action in Joystick Gremlin R14's editor, the input-type dropdown on `<vjoy>` rows can render as **"X Axis"** even when the underlying XML correctly says **Button**. Visual-only — confirmed by saving from this state and byte-comparing the resulting XML, identical to before. The macro fires real button presses in-game regardless of what the dropdown shows.

If you see it: **ignore it.** Don't try to "fix" the dropdown unless you know what you're doing — saving from a misclick *might* commit the wrong type. Trust the in-game behavior. Reported upstream to WhiteMagic.

## Troubleshooting

Common Enhanced bind issues and their fixes live in the [Enhanced Binds FAQ](https://discord.com/channels/303670222097874945/1297919077062279209) in the Discord.

Common joystick / Star Citizen issues and their fixes live in the [Peripheral FAQ](https://discord.com/channels/303670222097874945/1154143410215731201) in the Discord.

!!! note
    If you have an issue not found in either FAQ, please read and follow the simple instructions in the pinned post in the [Enhanced Bindings Support Forum](https://discord.com/channels/303670222097874945/1006954369800998992) before posting.

## Binding Charts

### Online chart viewer

The [SOL-R 2 chart viewer](https://subliminal.gg/bindings/tm-sol-r-2-dual/chart) on subliminal.gg lets you browse the chart in a browser — handy when you're learning the binds and don't want to keep flipping back to a PDF.

### Printer-friendly binding chart

The chart labeled `[Print]` has a white background to conserve ink for people who'd like to print it.

!!! tip
    If you have the paid version of Adobe Acrobat you can open the PNG inside it and select the **Poster** option in the print settings, then change the scale from 100% to 30%. The chart splits into two pages, one stick per page. For other programs, scaled to 30% the chart fits each stick on its own page.

!!! quote "Support this project"
    These binds take a really long time to make and keep updated. Here are a few ways to make sure I can keep doing it, ordered roughly from most impactful to still awesome.
    ??? example "Twitch"
        * Sub on [Twitch](https://subs.twitch.tv/subliminalstv). Even if you don't watch live, this is the biggest single help while we work toward the first goal of 100 (currently 20/100).
        * FREE: Got Amazon Prime? You get one [free Twitch Prime sub](https://subs.twitch.tv/subliminalstv) per month.
        * FREE: Come hang out while I'm live. Sometimes I'm playing, sometimes I'm updating these binds or covering SC news. YouTube simulcast coming soon.
    ??? note "Store"
        * Pick up something direct from [my store](https://store.subliminal.gg/l/supporters) — great if you don't have a Twitch or Amazon account.
        * You can also tip at checkout. The button's small but it's there.

## Open Source Notice

!!! note
    These binds are open source. I need contributors to assist with small updates when a patch drops. DM me on Discord if you're interested. <https://github.com/SubliminalsTV/Subs-Curated-Bindings>
