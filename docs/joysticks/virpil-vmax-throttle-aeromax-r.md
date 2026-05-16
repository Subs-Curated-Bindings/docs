# Enhanced — Virpil VMAX Throttle + Aeromax-R

A tuned throttle + flight-stick keybind setup for Star Citizen built around the Virpil VMAX throttle and Aeromax-R grip. Same Enhanced philosophy as the rest of the pack — modifier layers, mode switching (SCM / Aux / Nav), tempo-driven tap-vs-hold binds, JG-owned inversion that survives SC's wipes and reinstalls.

These binds use Joystick Gremlin to layer modifiers, mode switching, response curves, and macros on top of SC's bind system. Ship combat, mining, salvage, ground vehicles, and turrets all run off the same physical inputs — once you learn the chart, the same hand positions carry across every gameplay loop.

!!! warning "Requires Joystick Gremlin R14"
    These binds run on Joystick Gremlin R14 (14.2 or later). R13 is no longer supported — if you're still on R13, update before loading this profile.

!!! note "First load: binds will look blank — that's intended"
    When you first load this profile in JG R14, all the binds will look blank. That's intended, not broken. The profile ships against the device GUIDs of the sticks we exported on, so your hardware needs to be matched in.

    Run **Tools → Swap Devices** in JG, point each profile slot at your physical sticks. **Save the profile** afterwards by clicking the Save icon in the toolbar — the page with a down arrow on it. Ctrl+S doesn't work in JG; the toolbar icon is the only save. Without the save, you'll be redoing this every time JG starts.

    JG also opens the profile to **Aux Mode** by default (the "Configuring mode" dropdown in the upper right of the JG window), which is intentionally blank. Switch the dropdown to **SCM Mode** to see the main binds.

???+ abstract "Change Log"

    **4.8.0 LIVE — May 2026**

    * **Light amplification toggle paired with scan ping** on VMAX throttle btn 2. Tempo + macro pattern (threshold 0.5s):
        * **Tap (< 0.5s)** — `v_invoke_ping` (scan ping, unchanged).
        * **Hold (≥ 0.5s)** — `v_light_amplification_toggle` via a 100ms macro tap on vJoy 1 button 23.
    * **vJoy slot for light amp moved from 2/btn 46 → 1/btn 23.** Previous slot was a leftover from when light-amp lived on the Aeromax (right side). With the throttle-side placement, keeping ping and light-amp both on vJoy 1 is cleaner. If you'd customized your own profile pointing at the old slot, repoint after import.
    * New `Fix MFD Binds [ENH][VMAX+AERO][4.8.0][LIVE].bat` script ships in the folder. Works around SC's long-standing `vehicle_mfd` wipe bug. See [MFD bind fix](#mfd-bind-fix-workaround-for-sc-bug).
    * **Axis inversion is now fully handled inside Joystick Gremlin.** The layout XML no longer ships SC-side `<options type="joystick">` invert overrides — SC's keybind-menu Invert toggles can stay at game defaults. If you do want to flip an axis, you can do it in SC's keybind menu or in JG by flipping the response curve. JG is the one that sticks — patches, wipes, and fresh installs all reset SC's setting; the JG flip travels with the profile.
    * **Heads up — JG R14 macro editor visual bug.** Opening a macro action in JG R14's editor can show "X Axis" on `<vjoy>` rows where the XML correctly says Button. Visual only, ignore it. See [Known Issues](#jg-r14-macro-editor-x-axis-rendering-bug).

## Hardware required

* **Virpil VMAX throttle** + **Virpil Aeromax-R grip** mounted on a Virpil base.

If you don't have Joystick Gremlin and vJoy installed yet, walk through the [general setup guide](../general-setup/software-installation/vjoy-installation.md) first.

## What makes these binds different

If you'd never opened Joystick Gremlin and bound your sticks directly through SC's keybind menu, you'd hit four walls fast:

* **No modifier layer.** SC has no real concept of "this button does X normally and Y while holding modifier." You'd be stuck with one function per physical button.
* **No custom hold timing.** SC's bind system supports multi-tap, but hold behavior is baked into each action — if CIG shipped a "Long Press" variant you can bind that, otherwise you can't add one. JG sidesteps this by synthesizing the gesture: a 0.5-second hold on VMAX throttle btn 2 fires the light amplification toggle (a quick tap fires scan ping), even though SC has no "hold to toggle" option for that action.
* **No clean macros for SC's toggle actions.** SC has actions like `v_light_amplification_toggle` that only fire on a complete press+release cycle. A sustained vJoy press doesn't trigger them. JG lets you synthesize a clean tap shape from any input gesture.
* **Inversion is fragile.** Inversion lives in SC's keybind menu by default. It gets reset by reinstalls, patch wipes, fresh installs on a new machine. If you want it to survive any of those, it needs to live somewhere SC doesn't manage.

This profile addresses all four. The next section walks through how.

## Included functions

### Modifier mode — doubles your usable binds

Hold the modifier button and every other button on the VMAX + Aeromax fires a *different* SC action. The extra layer is where most of the niche binds live — engineering controls, advanced view options, vehicle-specific stuff. The chart shows the un-modified action in one color and the modified action in a contrasting color so you can read both layers at a glance.

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

The light-amp / scan-ping pairing on VMAX throttle btn 2 is the canonical tempo bind on this profile. Tap < 0.5s = scan ping. Hold ≥ 0.5s = light amplification toggle. Threshold is 500ms by default.

Tempo binds that wrap a SC toggle action use a 100ms macro tap on the long-action side, because SC's toggles only fire on a complete press+release cycle and a sustained vJoy hold won't trigger them.

### Macros — clean tap shapes for stubborn SC actions

Whenever a bind needs to produce a "clean tap" for SC regardless of how long the user physically holds the input, it goes through a JG macro: vJoy press → 100ms pause → vJoy release. SC sees a complete cycle and the action fires once. The light-amp hold route on btn 2 runs this pattern through vJoy 1 button 23.

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
    Star Citizen has a long-standing bug where the `vehicle_mfd` actionmap gets stripped every time you load a control profile over an existing one. The bug is silent — the keybind menu shows the actions normally, just unbound or missing. Most users find out when an MFD action stops working in-game.

The shipped `Fix MFD Binds [ENH][VMAX+AERO][4.8.0][LIVE].bat` script puts them all back. Workflow:

1. Load the VMAX+AERO layout in-game (Customization → Control Profiles → Use this profile).
2. Fully close Star Citizen and the RSI Launcher.
3. Double-click the `.bat`. Pick your SC channel at the prompt (LIVE / PTU / EPTU / HOTFIX / TECH-PREVIEW).
4. Launch SC. MFDs work.

!!! tip "Star Citizen installed on a different drive?"
    If your install isn't at the default `C:\Program Files\Roberts Space Industries\StarCitizen\` location, the script prompts you for the path to your install folder (the one that contains `LIVE` / `PTU` / `EPTU` subfolders) before the channel prompt. Paste the path and continue as normal.

The script:

* Makes a timestamped backup of `actionmaps.xml` before any change.
* Refuses to run if SC or RSI Launcher is alive.
* Is **idempotent** — running it twice gives identical results, no double-bindings.
* Self-heals if SC ever nukes the entire `vehicle_mfd` actionmap by rebuilding the block from scratch.

If you'd rather rebind manually via SC's keybind UI instead of running the script, here's the table:

### Manual fallback — re-bind via SC's keybind menu

| SC action (Customization → Keybindings → MFD) | vJoy mapping |
| --- | --- |
| MFD - Cycle Page - Backwards (Short Press) | `button30 (Input2)` |
| MFD - Cycle Page - Forwards (Short Press) | `button28 (Input2)` |
| MFD - Movement - Up (Long Press) | `button27 (Input2)` |
| MFD - Movement - Down (Long Press) | `button29 (Input2)` |
| MFD - Movement - Left (Long Press) | `button30 (Input2)` |
| MFD - Movement - Right (Long Press) | `button28 (Input2)` |
| MFD - Quick Action - Self Repair All | `button13 (Input2)` |

Physical input labels for these are on the binding chart.

## Features and Functions

### Eye Tracker Targeting

My main way to target in Star Citizen is via an eye tracker. Adds to immersion and is way easier than the native binds — look at the target, press a button, locked. For SC, the Tobii Eye Tracker is the one to get:

* **Tobii Eye Tracker** is the next-generation head + eye tracking option. Unlocks unique features that deepen immersion in Star Citizen, MSFS, DCS, and more. For 5% off, visit <https://tobii.subliminal.gg> and use code `subliminal` at checkout. *Purchases through that link support the curation of these binds.*

## Customizing

* **Different inversion preferences.** Every axis on this profile ships with a flat **Response Curve** action, so flipping one is the same flow everywhere. Open the JG profile, click the device tab for the stick with the axis you want to flip, then click that axis in the input list on the left. The right pane shows the axis's actions — find the Response Curve and click the **Invert Curve** button in its header (sitting next to the curve-type dropdown). For the change to take effect, **deactivate the profile** by clicking the blue Activate icon in the toolbar (turns it off), then **reactivate it** (click it again), then **save the profile** by clicking the Save icon in the toolbar (the page with a down arrow on it — Ctrl+S doesn't work in JG). Don't touch SC's keybind menu Invert toggles; they're meant to stay at defaults for this profile.

* **Tweak tempo timing.** A "tempo" is a JG action that fires one thing on a quick tap and a different thing on a held press of the same physical input — a duration threshold (in seconds) is what decides which side runs. Several binds in this profile use tempos. To adjust one, find the tempo action in the JG library and update its duration value. Lower means a briefer hold counts as a hold; higher means you have to commit longer before the hold-side fires.

## Known Issues

### JG R14 macro-editor "X Axis" rendering bug

Project-wide — affects every stick in this pack. When you open a macro action in Joystick Gremlin R14's editor, the input-type dropdown on `<vjoy>` rows can render as **"X Axis"** even when the underlying XML correctly says **Button**. Visual-only — confirmed by saving from this state and byte-comparing the resulting XML, identical to before. The macro fires real button presses in-game regardless of what the dropdown shows.

If you see it: **ignore it.** Don't try to "fix" the dropdown unless you know what you're doing — saving from a misclick *might* commit the wrong type. Trust the in-game behavior. Reported upstream to WhiteMagic.

### Right-stick btn 3 macro chain (pre-existing)

The right-stick btn 3 macro chain is buggy — pre-existing from the R13 source. Per the chart's "Flip Trigger Up = Exit Missile Mode" note, the intent was clear, but the implementation has two issues: the macro's `activation-mode=both` fires it on physical press AND release of btn 3 (doubling the toggle so the net effect is no change), and the toggle-based actions (`v_toggle_missile_mode` + `v_toggle_guns_mode`) are state-sensitive — they only do "exit missile mode" if you're already in missile mode. On the to-do list for a cleanup pass.

## Troubleshooting

Common Enhanced bind issues and their fixes live in the [Enhanced Binds FAQ](https://discord.com/channels/303670222097874945/1297919077062279209) in the Discord.

Common joystick / Star Citizen issues and their fixes live in the [Peripheral FAQ](https://discord.com/channels/303670222097874945/1154143410215731201) in the Discord.

!!! note
    If you have an issue not found in either FAQ, please read and follow the simple instructions in the pinned post in the [Enhanced Bindings Support Forum](https://discord.com/channels/303670222097874945/1006954369800998992) before posting.

## Binding Charts

### Online chart viewer

The [VMAX + AERO chart viewer](https://subliminal.gg/bindings/virpil-vmax-aeromax-r/chart) on subliminal.gg lets you browse the chart in a browser — handy when you're learning the binds and don't want to keep flipping back to a PDF.

### Printer-friendly binding chart

The chart labeled `[Print]` has a white background to conserve ink for people who'd like to print it.

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
