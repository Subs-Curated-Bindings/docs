# Enhanced — Dual VKB Gladiator NXT EVO L+R

A dual-stick keybind setup for Star Citizen built around the VKB Gladiator NXT EVO L+R. These binds are well thought out and designed with intuitiveness in mind — every input lives where it does on purpose, so the layout makes sense as you learn it.

These binds use Joystick Gremlin to layer modifiers, mode switching, response curves, and macros on top of SC's bind system. The result: ship combat, mining, salvage, ground vehicles, and turrets all running off the same physical inputs — once you learn the chart, the same hand positions carry across every gameplay loop.

!!! warning "Requires Joystick Gremlin R14"
    These binds run on Joystick Gremlin R14 (14.2 or later). R13 is no longer supported — if you're still on R13, update before loading this profile.

!!! note "First load: binds will look blank — that's intended"
    When you first load this profile in JG R14, all the binds will look blank. That's intended, not broken. The profile ships against the device GUIDs of the sticks we exported on, so your hardware needs to be matched in.

    Run **Tools → Swap Devices** in JG, point each profile slot at your physical sticks. **Save the profile** afterwards by clicking the Save icon in the toolbar — the page with a down arrow on it. Ctrl+S doesn't work in JG; the toolbar icon is the only save. Without the save, you'll be redoing this every time JG starts.

    JG also opens the profile to **Auxiliary Mode** by default (the "Configuring mode" dropdown in the upper right of the JG window), which is intentionally blank. Switch the dropdown to **SCM Mode** to see the main binds.

!!! note "VKB Configurator: leave axis inversions at defaults"
    These binds own axis inversion inside Joystick Gremlin so you don't have to fight SC's keybind menu (which gets wiped by patches, reinstalls, and character wipes) or VKB Configurator (which works but is fiddly). One toggle per axis in JG, one save, and it carries with the profile across Star Citizen patches and other games.

    For that one-click model to hold up, your VKB Configurator (Devcfg) needs to be at defaults — no axis inversions set there. Same for SC's keybind-menu Invert toggles. Let JG be the only place inversion lives.

???+ abstract "Change Log"

    **4.8.0 LIVE — May 2026**

    * Light amplification toggle bound on two inputs: **right stick F1 + modifier** (instant), and **left stick rapid trigger held past 0.5s**. A quick tap of the rapid trigger still fires radar ping, unchanged from before.
    * New `Bindings Toolkit [ENH][NXT][4.8.0][LIVE].bat` script ships in the `Tools/` folder. Menu-driven utility — the first option works around SC's long-standing `vehicle_mfd` wipe bug; others handle axis-inversion reset, backup/restore, diagnostics, and old-backup pruning. See [MFD bind fix](#mfd-bind-fix-workaround-for-sc-bug).
    * **Axis inversion is now fully handled inside Joystick Gremlin.** The layout XML no longer ships SC-side `<options type="joystick">` invert overrides — SC's keybind-menu Invert toggles can stay at game defaults. If you do want to flip an axis, you can do it in SC's keybind menu or in JG by flipping the response curve. JG is the one that sticks — patches, wipes, and fresh installs all reset SC's setting; the JG flip travels with the profile.
    * Various spelling errors across filenames and audio paths fixed. If you had a custom profile referencing those old paths, repoint after import.
    * **Heads up — JG R14 macro editor visual bug.** Opening a macro action in JG R14's editor can show "X Axis" on `<vjoy>` rows where the XML correctly says Button. Visual only, ignore it. See [Known Issues](#jg-r14-macro-editor-x-axis-rendering-bug).

## Hardware required

* **VKB Gladiator NXT EVO left + right** (the asymmetric pair). Single-stick or other VKB models won't load the profile cleanly without remapping in JG's Tools → Swap Devices. Doable, but not the supported configuration.

If you don't have Joystick Gremlin and vJoy installed yet, walk through the [general setup guide](../general-setup/software-installation/vjoy-installation.md) first.

## What makes these binds different

If you'd never opened Joystick Gremlin and bound your sticks directly through SC's keybind menu, you'd hit four walls fast:

* **No modifier layer.** SC has no real concept of "this button does X normally and Y while holding modifier." You'd be stuck with one function per physical button.
* **No custom hold timing.** SC's bind system supports multi-tap (the MFD soft-select binds below use it), but hold behavior is baked into each action — if CIG shipped a "Long Press" variant you can bind that, otherwise you can't add one. JG sidesteps this by synthesizing the gesture: a 0.5-second hold on the left rapid trigger fires the light amplification toggle, even though SC has no "hold to toggle" option for that action.
* **No clean macros for SC's toggle actions.** SC has actions like `v_light_amplification_toggle` that only fire on a complete press+release cycle. A sustained vJoy press doesn't trigger them. JG lets you synthesize a clean tap shape from any input gesture.
* **Inversion is fragile.** Inversion lives in SC's keybind menu by default. It gets reset by reinstalls, patch wipes, fresh installs on a new machine. If you want it to survive any of those, it needs to live somewhere SC doesn't manage.

This profile addresses all four. The next section walks through how.

## Included functions

Most physical buttons just feed a single virtual button straight through to SC. Where things get more interesting is the categories below — these are the techniques that make this setup work the way it does.

### Modifier mode — doubles your usable binds

Hold the modifier button (right stick base) and every other button on both sticks fires a *different* SC action. Without modifier you have around 50 useful buttons across the dual NXTs. With it, you effectively have around 100. The extra layer is where most of the niche binds live — engineering controls, advanced view options, vehicle-specific stuff.

The chart shows the un-modified action in one color and the modified action in a contrasting color so you can read both layers at a glance.

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

A small number of binds fire one action on a quick tap and a different action on a longer hold of the same physical button. The light-amp toggle on the left rapid trigger is the canonical example: short tap = radar ping, hold past 0.5s = light amplification toggle.

The threshold is 500ms by default. Tempo binds that wrap a SC toggle action use a 100ms macro tap on the long-action side, because SC's toggles only fire on a complete press+release cycle and a sustained vJoy hold won't trigger them.

### Macros — clean tap shapes for stubborn SC actions

Whenever a bind needs to produce a "clean tap" for SC regardless of how long the user physically holds the input, it goes through a JG macro: vJoy press → 100ms pause → vJoy release. SC sees a complete cycle and the action fires once. This is how the held-trigger light-amp toggle works without tying up the trigger button.

You'll never see this from the user side — it's behind the curtain. But if you ever go editing the JG profile, knowing why these macros exist will save you from "fixing" something that wasn't broken.

### Mouse axes — 3rd-person camera pan during flight

In 3rd-person view, two of the right-stick's secondary axes are bound as **mouse movement** instead of as joystick axes. That gives you camera pan independent of your flight controls — keep flying with the main stick axes while looking around with the secondary axes. SC's 3rd-person camera doesn't natively know about joystick axes for view; mouse is the only language it understands.

This is the kind of thing JG enables that's effectively impossible without it.

### Flat response curves on every map-to-vJoy axis

Every axis-to-vJoy mapping in the profile uses a baseline linear response curve. There's no curve-shaping going on for control feel — SC handles per-axis sensitivity in its own UI, that's the right place for it.

The reason for the explicit curve isn't sensitivity. It's **inversion durability**. JG's response curve carries the inversion flag. By living in JG instead of SC's keybind menu, inversion survives:

* SC reinstalls
* Patch resets
* Fresh installs on a new machine
* The wipe (when CIG nukes character data and bindings on a major release)

If your inversion is in SC, you reset it every time. If it's in JG, you set it once and it travels with the profile.

The 4.8.0 release strips out the SC-side `<options type="joystick">` invert overrides earlier versions of these binds shipped. Inversion is now exclusively a JG concern. SC's keybind menu Invert toggles can stay at game defaults — JG handles the rest.

### Multi-tap activation on MFD soft-select

Two MFD bindings (`v_mfd_soft_select_cast_left/right_short`) require a double-tap of the same physical input that does standard MFD navigation on a single tap. You'll see this called out in the binding chart and in the MFD fix script — it's the only place multi-tap activation is used.

## MFD bind fix (workaround for SC bug)

!!! bug "SC `vehicle_mfd` wipe — worked around by the shipped fix script"
    Star Citizen has a long-standing bug where the `vehicle_mfd` actionmap gets stripped every time you load a control profile over an existing one. Specifically:

    * 7 MFD actions get reset to unbound (`<rebind input="js2_ "/>`).
    * 2 actions (`v_mfd_soft_select_cast_left/right_short`) get **deleted** from `actionmaps.xml` outright.

    The bug is silent — the keybind menu shows the actions normally, just unbound or missing. Most users find out when an MFD action stops working in-game.

The shipped `Bindings Toolkit [ENH][NXT][4.8.0][LIVE].bat` script (in the `Tools/` folder) puts them all back. Pick option 1 (Fix MFD binds) from the menu. Workflow:

1. Load the NXT layout in-game (Customization → Control Profiles → Use this profile).
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

| SC action (Customization → Keybindings → MFD) | Physical input | vJoy mapping |
| --- | --- | --- |
| MFD - Cycle Page - Backwards (Short Press) | `[M] R-C1 Left` | `button54 (Input2)` |
| MFD - Cycle Page - Forwards (Short Press) | `[M] R-C1 Right` | `button52 (Input2)` |
| MFD - Movement - Up (Long Press) | `[M] R-C1 Up` | `button51 (Input2)` |
| MFD - Movement - Down (Long Press) | `[M] R-C1 Down` | `button53 (Input2)` |
| MFD - Movement - Left (Long Press) | `[M] R-C1 Left` | `button54 (Input2)` |
| MFD - Movement - Right (Long Press) | `[M] R-C1 Right` | `button52 (Input2)` |
| MFD - Select - Left Cast (Short Press) | `[M][DT] R-C1 Left` | `button54 (Input2)` ×2 |
| MFD - Select - Right Cast (Short Press) | `[M][DT] R-C1 Right` | `button52 (Input2)` ×2 |
| MFD - Quick Action - Self Repair All | `R-A2` | `button3 (Input2)` |

!!! tip "Multi-tap (double-tap) binds in SC's keybind UI"
    For the two `Select - * Cast (Short Press)` rows above, SC's bind UI needs the multi-tap activation set explicitly. The pattern: first map any button on stick 1, *then* add the multi-tap with `y`, *then* rebind to the actual physical input.

    Please contribute to the [issue council report](https://issue-council.robertsspaceindustries.com/projects/STAR-CITIZEN/issues/STARC-133477) so CIG can fix this by Nevuary 32nd, 2955.

## Features and Functions

### Free-look

To use free-look, go into 3rd-person (up on `L-A4 Hat`). Press the `R-A1 Mini-stick` in to change the mode to analog (red light should turn on). You're now free to look around. Click and **hold** in on `L-A4 Hat` to reset view.

### Head Tracking

Head tracking has dedicated binds on the **L-A4 4-Way Hat — left direction**: tap toggles head tracking on/off. Reset Head Tracking lives on the same hat (see the binding chart for the exact slot). The bind talks to whatever head-tracker software you're running (Tobii / Beam Eye Tracker / TrackIR) — it's a hotkey for that app, not an SC action — so SC itself doesn't know head tracking exists; only your tracker software does.

### Eye Tracker Targeting

My main way to target in Star Citizen is via an eye tracker. Adds to immersion and is way easier than the native binds — look at the target, press a button, locked. For SC, the Tobii Eye Tracker is the one to get:

* **Tobii Eye Tracker** is the next-generation head + eye tracking option. Unlocks unique features that deepen immersion in Star Citizen, MSFS, DCS, and more. For 5% off, visit <https://tobii.subliminal.gg> and use code `subliminal` at checkout. *Purchases through that link support the curation of these binds.*

## Customizing

* **Different inversion preferences.** Every axis on this profile ships with a flat **Response Curve** action, so flipping one is the same flow everywhere. Open the JG profile, click the device tab for the stick with the axis you want to flip, then click that axis in the input list on the left. The right pane shows the axis's actions — find the Response Curve and click the **Invert Curve** button in its header (sitting next to the curve-type dropdown). For the change to take effect, **deactivate the profile** by clicking the blue Activate icon in the toolbar (turns it off), then **reactivate it** (click it again), then **save the profile** by clicking the Save icon in the toolbar (the page with a down arrow on it — Ctrl+S doesn't work in JG). Don't touch SC's keybind menu Invert toggles; they're meant to stay at defaults for this profile.

* **Tweak tempo timing.** A "tempo" is a JG action that fires one thing on a quick tap and a different thing on a held press of the same physical input — a duration threshold (in seconds) is what decides which side runs. Several binds in this profile use tempos. To adjust one, find the tempo action in the JG library and update its duration value. Lower means a briefer hold counts as a hold; higher means you have to commit longer before the hold-side fires.

## Known Issues

### JG R14 macro-editor "X Axis" rendering bug

Project-wide — affects every stick in this pack, not just the NXTs. When you open a macro action in Joystick Gremlin R14's editor, the input-type dropdown on `<vjoy>` rows can render as **"X Axis"** even when the underlying XML correctly says **Button**. Visual-only — confirmed by saving from this state and byte-comparing the resulting XML, identical to before. The macro fires real button presses in-game regardless of what the dropdown shows.

If you see it: **ignore it.** Don't try to "fix" the dropdown unless you know what you're doing — saving from a misclick *might* commit the wrong type. Trust the in-game behavior. Reported upstream to WhiteMagic.

### NXT non-EVO: encoder positions + three inverted axes

Two hardware-level differences from the EVO base mean a non-EVO NXT user has some extra setup to do before the profile feels right:

* **Encoder positions are different.** The non-EVO encoders sit in different spots than the EVO and don't match the binding chart. Either use them as-is or rebind them manually in JG — it's a simple process.

* **Three axes report inverted relative to the EVO** — left stick X, left stick Y, and right stick Y. Two ways to flip them so flight feels the way the chart describes:

    **Easy way (recommended for non-EVO users): use the Bindings Toolkit.** In the stick folder, open `Tools/Bindings Toolkit [ENH][NXT][4.8.0][LIVE].bat` and pick option **[7] Non-EVO axis flip**. It identifies the three affected axes after you confirm which physical stick is left vs right, backs up the profile, and flips all three response curves in one step. Close Joystick Gremlin first (the toolkit will refuse if JG is running).

    **Manual way (if you'd rather do it in JG):**

    1. Open the JG profile and click the device tab for the stick that has the axis you need to flip (left stick first, then right stick).
    2. Click the axis in the input list on the left (**X Axis** or **Y Axis**). The right pane shows that axis's actions.
    3. Find the **Response Curve** action and click the **Invert Curve** button in its header (sitting next to the curve-type dropdown).
    4. Repeat across all three affected axes — left stick X, left stick Y, right stick Y.
    5. For the changes to take effect, **deactivate the profile** by clicking the blue Activate icon in the toolbar (turns it off), then **reactivate it** (click it again), then **save the profile** by clicking the Save icon in the toolbar (the page with a down arrow on it — Ctrl+S doesn't work in JG).

### Some turret binds don't work properly

A few turret binds (gyro in particular) don't behave the way you'd expect. Turret speed limiter and the general speed limiter do work, but you need to turn the speed limiter on in the IFCS MFD page first. This may be ship-dependent — keeping the binds in and hoping CIG sorts it.

## Troubleshooting

Common Enhanced bind issues and their fixes live in the [Enhanced Binds FAQ](https://discord.com/channels/303670222097874945/1297919077062279209) in the Discord.

Common joystick / Star Citizen issues and their fixes live in the [Peripheral FAQ](https://discord.com/channels/303670222097874945/1154143410215731201) in the Discord.

!!! note
    If you have an issue not found in either FAQ, please read and follow the simple instructions in the pinned post in the [Enhanced Bindings Support Forum](https://discord.com/channels/303670222097874945/1006954369800998992) before posting.

## Binding Charts

### Online chart viewer

The [NXT chart viewer](https://subliminal.gg/bindings/vkb-gladiator-dual/chart) on subliminal.gg lets you browse the chart in a browser — handy when you're learning the binds and don't want to keep flipping back to a PDF.

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
