# Enhanced — MOZA MTQ Throttle + MHG Grip

!!! warning
    THESE BINDINGS REQUIRE JOYSTICK GREMLIN.

!!! quote "Support this project"
    These binds take a really long time to make and keep updated. Here are a few ways to make sure I can keep doing it, ordered roughly from most impactful to still awesome.
    ??? example "Twitch"
        * Sub on [Twitch](https://subs.twitch.tv/subliminalstv). Even if you don't watch live, this is the biggest single help while we work toward the first goal of 100 (currently 20/100).
        * FREE: Got Amazon Prime? You get one [free Twitch Prime sub](https://subs.twitch.tv/subliminalstv) per month.
        * FREE: Come hang out while I'm live. Sometimes I'm playing, sometimes I'm updating these binds or covering SC news. YouTube simulcast coming soon.
    ??? note "Store"
        * Pick up something direct from [my store](https://store.subliminal.gg/l/supporters) — great if you don't have a Twitch or Amazon account.
        * You can also tip at checkout. The button's small but it's there.

A tuned throttle + flight-stick keybind setup for Star Citizen built around the MOZA MTQ throttle and MHG grip. Same Enhanced philosophy as the rest of the pack — modifier layers, mode switching (SCM / Aux / Nav), tempo-driven tap-vs-hold binds, JG-owned inversion that survives SC's wipes and reinstalls.

!!! note "Works with any MOZA FFB base — not just AB6"
    These bindings live entirely on the **MTQ throttle** and **MHG grip**. The FFB base (AB6, AB9, whichever you have) reports no buttons of its own — it's the force-feedback mechanism, not an input device. Any MOZA FFB base with an MHG grip on top will work the same. The chart and profile don't care which base you're flying.

???+ abstract "Change Log"

    **4.8.0 PTU — May 2026**

    * **Light amplification toggle paired with ship lights** on MTQ throttle btn 4 (SCM Mode). Tempo + macro pattern (threshold 0.5s):
        * **Tap (< 0.5s)** — `v_lights` (ship lights toggle, unchanged).
        * **Hold (≥ 0.5s)** — `v_light_amplification_toggle` via a 100ms macro tap on vJoy 1 button 60.
    * **Afterburner triggered by MTQ rocker** — pulling either rocker rotation (X-rot or Y-rot) past 90% in any direction presses-and-holds the afterburner. Both rotations also keep their normal axis behavior (strafe / yaw on the throttle). This coexists with the regular physical afterburner button — three JG paths feed the same vJoy slot, so any one of them holds afterburner down. Think "full forward/sideways strafe gesture = afterburner."
    * **V-plateau response curve** applied to the MTQ rocker X-rot and Y-rot. Asymmetric deadband around center (clean center-detent for strafe without runtime jitter) and a stable threshold at +0.75 of travel before saturating. If you're cross-referencing the JG R14 distribution notes — the V-plateau base shape is documented there with a "do not apply to non-mouse axes" warning, but on this throttle's rocker the deadband is intentional, not a workaround.
    * New `Fix MFD Binds [ENH][MTQ+MHG][4.8.0][PTU].bat` script ships in the folder. Works around SC's long-standing `vehicle_mfd` wipe bug. See [MFD bind fix](#mfd-bind-fix-workaround-for-sc-bug).
    * **Axis inversion is now fully handled inside Joystick Gremlin.** The layout XML no longer ships SC-side `<options type="joystick">` invert overrides. SC's keybind-menu Invert toggles can be left at game defaults.
    * Internal layout name realigned to `ENH_MTQ_MHG_480_PTU` (previously `ENH_450_PTU_MTQ_MHG`), matching the schema used by the other current sticks.
    * Distribution zip renamed to `[4.8.0][PTU][ENH] MOZA MTQ + MHG Binds.zip`. AB6 dropped from the title — see the note above.
    * **Heads up — JG R14 macro editor visual bug.** Opening a macro action in JG R14's editor can show "X Axis" on `<vjoy>` rows where the XML correctly says Button. Visual only, ignore it. See [Known Issues](#jg-r14-macro-editor-x-axis-rendering-bug).

## Hardware required

* **MOZA MTQ throttle + MHG grip** mounted on any MOZA FFB base (AB6 / AB9 / etc.).
* **vJoy** with at least 2 vJoy devices configured, each with 8 axes, 4 hats, 128 buttons. Standard install defaults.
* **Joystick Gremlin R14** (14.2 or later). [Official repo](https://github.com/WhiteMagic/JoystickGremlin).
* **Star Citizen 4.8.0 PTU** for now. Roll-forward for LIVE when 4.8 lands.

If you don't have JG and vJoy already, install those first. Both are free, both need admin, and vJoy needs a system reboot before its devices show up in DirectInput. SC sees the vJoy devices as standard joysticks — your physical MTQ and MHG are invisible to SC; everything routes through JG.

## Quick start

1. Drop both layout XMLs into your SC install:

    ```
    …\StarCitizen\<channel>\user\client\0\controls\mappings\
    ```

    Files: `layout_ENH_MTQ_MHG_480_PTU_exported.xml` and `layout_SUB_Clear_Bindings_exported.xml`.

2. Launch SC. Open **Customization → Control Profiles → Use this profile**, pick `ENH_MTQ_MHG_480_PTU`, confirm.

3. Fully close SC and the RSI Launcher.

4. Double-click `Fix MFD Binds [ENH][MTQ+MHG][4.8.0][PTU].bat` from the unzipped folder. Pick your channel at the prompt. This works around a long-standing SC bug — see [MFD bind fix](#mfd-bind-fix-workaround-for-sc-bug) below.

5. Launch JG R14, load `Joystick Gremlin Profile [ENH][MTQ+MHG][4.8.0][PTU][R14].xml`. Run **Tools → Swap Devices** and remap each profile slot to your physical MTQ + MHG.

6. Toggle JG to **Active** (top-right). Launch SC. Test in Arena Commander or in your hangar before flying anything important.

If something looks wrong, jump to [Customizing](#customizing) below.

## What makes these binds different

If you'd never opened Joystick Gremlin and bound your sticks directly through SC's keybind menu, you'd hit four walls fast:

* **No modifier layer.** SC has no real concept of "this button does X normally and Y while holding modifier." You'd be stuck with one function per physical button.
* **No tap-vs-hold differentiation.** SC's bind system fires actions on press. Want one button to toggle ship lights on a quick tap and toggle light amplification on a 0.5-second hold? SC can't do that natively.
* **No clean macros for SC's toggle actions.** SC has actions like `v_light_amplification_toggle` that only fire on a complete press+release cycle. A sustained vJoy press doesn't trigger them. JG lets you synthesize a clean tap shape from any input gesture.
* **No way to make an axis act as a button past a threshold.** You can't natively tell SC "treat this rocker past 90% as a button press." That's how the strafe-gesture afterburner works in this profile.
* **Inversion is fragile.** Inversion lives in SC's keybind menu by default. It gets reset by reinstalls, patch wipes, fresh installs on a new machine. If you want it to survive any of those, it needs to live somewhere SC doesn't manage.

This profile addresses all five. The next section walks through how.

## The patterns explained

### Modifier mode — doubles your usable binds

Hold the modifier button and every other button on the MTQ + MHG fires a *different* SC action. The extra layer is where most of the niche binds live — engineering controls, advanced view options, vehicle-specific stuff. The chart shows the un-modified action in one color and the modified action in a contrasting color so you can read both layers at a glance.

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

The light-amp / ship-lights pairing on MTQ throttle btn 4 is the only tempo bind on this profile. Tap < 0.5s = ship lights. Hold ≥ 0.5s = light amplification toggle. The threshold is 500ms by default.

Tempo binds that wrap a SC toggle action use a 100ms macro tap on the long-action side, because SC's toggles only fire on a complete press+release cycle and a sustained vJoy hold won't trigger them.

### Macros — clean tap shapes for stubborn SC actions

Whenever a bind needs to produce a "clean tap" for SC regardless of how long the user physically holds the input, it goes through a JG macro: vJoy press → 100ms pause → vJoy release. SC sees a complete cycle and the action fires once. The light-amp route on throttle btn 4 runs this pattern through vJoy 1 button 60.

### Afterburner from the rocker — axis-as-button

The MTQ throttle's rocker has two rotations (X-rot, Y-rot). They normally drive lateral / longitudinal strafe. In this profile, **each rotation also carries a button-style behavior past 90% of travel** — pulling either rotation past 90% in any direction presses-and-holds vJoy 1 button 37, which is mapped to `v_afterburner` in SC.

This means three different physical gestures all hold afterburner:

* The physical afterburner button (its normal role).
* Pulling rocker X-rot past 90% — left or right.
* Pulling rocker Y-rot past 90% — forward or back.

JG ORs the three press states together — afterburner is held as long as *any* of them is active. Releasing back below 90% (or releasing the physical button) releases afterburner. Think of it as "full strafe gesture = afterburner kicks in." It coexists with the rocker's normal axis behavior — the rotation still drives strafe at full deflection *and* holds afterburner at the same time.

### V-plateau response curve on the rocker

Both MTQ rocker rotations carry a custom piecewise-linear response curve:

* Asymmetric deadband around center (~−0.05 / +0.03).
* Linear ramp from the deadband edge up to +0.75 of travel, then saturates at +1.0 from there to the end.

The deadband gives the rocker a clean center-detent for strafe without runtime jitter, and the saturation plateau gives a stable threshold for the axis-button afterburner gesture. Both rotations carry byte-identical curve bodies — edit each independently if you're tweaking.

!!! note "Cross-stick context (for the curious)"
    The V-plateau base shape is documented in the contributor notes as a `map-to-mouse` runtime-drift workaround, with a warning *not* to apply it to non-mouse axes. On the MTQ rocker that warning doesn't apply — the deadband is intentional for the strafe + AB-threshold behavior described above. If you're cross-referencing the contributor docs, this stick is the exception.

### Flat response curves on every other map-to-vJoy axis

All other axes use a baseline linear response curve. There's no curve-shaping going on for control feel — SC handles per-axis sensitivity in its own UI, that's the right place for it.

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

The shipped `Fix MFD Binds [ENH][MTQ+MHG][4.8.0][PTU].bat` script puts them all back. Workflow:

1. Load the MTQ+MHG layout in-game (Customization → Control Profiles → Use this profile).
2. Fully close Star Citizen and the RSI Launcher.
3. Double-click the `.bat`. Pick your SC channel at the prompt (LIVE / PTU / EPTU / HOTFIX / TECH-PREVIEW).
4. Launch SC. MFDs work.

The script:

* Makes a timestamped backup of `actionmaps.xml` before any change.
* Refuses to run if SC or RSI Launcher is alive.
* Is **idempotent** — running it twice gives identical results, no double-bindings.
* Self-heals if SC ever nukes the entire `vehicle_mfd` actionmap by rebuilding the block from scratch.

If you'd rather rebind manually via SC's keybind UI instead of running the script, here's the table (21 binds — the MTQ+MHG profile uses dedicated MFD slot-select buttons rather than navigation hats, which is why this list is longer than the other sticks):

### Manual fallback — re-bind via SC's keybind menu

| SC action (Customization → Keybindings → MFD) | vJoy mapping |
| --- | --- |
| MFD - Cycle Page - Backwards (Short Press) | `button64 (Input2)` |
| MFD - Cycle Page - Forwards (Short Press) | `button68 (Input2)` |
| MFD - Quick Action - Self Repair All | `button5 (Input2)` |
| MFD - Select View - Comms (Short) | `button35 (Input2)` |
| MFD - Select View - Configuration (Short) | `button34 (Input2)` |
| MFD - Select View - Diagnostics (Short) | `button37 (Input2)` |
| MFD - Select View - IFCS (Short) | `button36 (Input2)` |
| MFD - Select View - Resource Network (Short) | `button38 (Input2)` |
| MFD - Select View - Scanning (Short) | `button33 (Input2)` |
| MFD - Select View - Self Status (Short) | `button31 (Input2)` |
| MFD - Select View - Target Status (Short) | `button32 (Input2)` |
| MFD - Soft Select - Cast Left (Long) | `button61 (Input2)` |
| MFD - Soft Select - Cast Right (Long) | `button62 (Input2)` |
| MFD - Soft Select - MFD 1 (Long) | `button31 (Input2)` |
| MFD - Soft Select - MFD 2 (Long) | `button32 (Input2)` |
| MFD - Soft Select - MFD 3 (Long) | `button33 (Input2)` |
| MFD - Soft Select - MFD 4 (Long) | `button34 (Input2)` |
| MFD - Soft Select - MFD 5 (Long) | `button35 (Input2)` |
| MFD - Soft Select - MFD 6 (Long) | `button36 (Input2)` |
| MFD - Soft Select - MFD 7 (Long) | `button37 (Input2)` |
| MFD - Soft Select - MFD 8 (Long) | `button38 (Input2)` |

Physical input labels for these are on the binding chart. Note: the Soft-Select buttons 31–38 do double duty — short tap selects an MFD page view directly; long press (re-)selects the soft-select target slot. SC distinguishes them on the (Short)/(Long) qualifier, no multi-tap activation needed.

## Features and Functions

### Eye Tracker Targeting

My main way to target in Star Citizen is via an eye tracker. Adds to immersion and is way easier than the native binds — look at the target, press a button, locked. Two eye trackers worth considering:

* **Tobii Eye Tracker** is the next-generation head + eye tracking option. Unlocks unique features that deepen immersion in Star Citizen, MSFS, DCS, and more. For 5% off, visit <https://tobii.subliminal.gg> and use code `subliminal` at checkout. *Purchases through that link support the curation of these binds.*

* **Beam Eye Tracker** is a more budget-friendly alternative — software-only, runs off your existing webcam. Limitations around dark rooms and seeing through glasses, but if you've got a webcam and want to try eye tracking, it's a must-have IMO. Free trial on Steam, or buy direct. For more info: <https://beam.subliminal.gg>. *Direct purchases through that link support the curation of these binds; Steam purchases do not.*

## Customizing

* **Different physical hardware.** If you have other MOZA gear (different grip, etc.) the profile's device GUIDs won't match. JG R14's **Tools → Swap Devices** is the path: pick the profile's slots, point them at your physical devices, save.

* **Different inversion preferences.** Open the JG profile, find the axis you want to flip, edit the response-curve action — there's an Invert toggle on the curve itself. Save. Don't touch SC's keybind menu Invert toggles; they're meant to stay at defaults for this profile.

* **Different modifier button.** The modifier button is a single physical input mapped as the modifier "shift" in JG. Find the input that drives Modifier mode, swap it for whichever physical button you'd rather use. JG's UI is safer for this than editing the XML directly.

* **Tweak the AB threshold or the V-plateau curve.** The afterburner-on-rocker triggers at +/-0.9 of axis travel. To change it, find the rocker's axis input in the JG profile, locate the `<virtual-button>` block on the button-behavior action-configuration, and edit `lower-limit` / `upper-limit`. To reshape the response curve, edit the rocker's response-curve action — both rotations have separate curve bodies, edit each independently.

* **Tweak tempo timing.** The light-amp tempo on btn 4 defaults to a 500ms threshold. To change it, find the tempo action in the JG library and update the `threshold` value.

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

### NO MORE ADOBE

The charts are authored in the free alternative [Affinity](https://www.affinity.studio/get-affinity). Affinity is now FREE, which means anyone can open the `.af` files and edit them.

### PDF files are back

Searchable PDFs in Affinity — they're back.

### Printer-friendly binding chart

The chart labeled `[Print]` has a white background to conserve ink for people who'd like to print it.

## Support

Patch-day chaos is normal. Give it a couple of days after a major SC patch before assuming the binds are broken; usually it's CIG breaking something downstream and I'm already sorting it. Hit me up via the support channels above or in the SubliminalsTV Discord.

## Open Source Notice

!!! note
    These binds are open source. I need contributors to assist with small updates when a patch drops. DM me on Discord if you're interested. <https://github.com/SubliminalsTV/Subs-Curated-Bindings>
