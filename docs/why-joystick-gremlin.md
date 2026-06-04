# Why Joystick Gremlin?

Master Modes is what broke the math.

Star Citizen's native binding system gives you a tap, a double-tap, and *sometimes* a hold if CIG hands it to us that patch. Even at three actions per button across ~29 buttons, you run out of room fast — and that's before double-tap collisions, before MFDs (which alone add 54 binds and need at least 8 to feel usable), before every patch bolts on something new. I used to ship "basic" binds for everyone. I can't honestly recommend them anymore. There just isn't space on the stick.

Joystick Gremlin is how I get that space back. It sits between your physical sticks and the game, and it does a handful of things SC's keybind menu simply can't do. This page walks through each one — what it does, and what you'd be giving up if you skipped it.

!!! warning "These profiles need Joystick Gremlin R14"
    The Enhanced profiles are built on the R14 (GremlinEx) profile format. The modes, tempo, and vJoy mappings below won't load correctly on older Joystick Gremlin builds. Grab the right version from the [Joystick Gremlin Installation](general-setup/software-installation/joystick-gremlin-installation.md) page.

## The short version

| Software | What it actually does for you |
|---|---|
| **Joystick Gremlin** | The brain. Modes, modifiers, tempo, macros, curves, mouse emulation — everything below. |
| **vJoy** | Creates the two clean *virtual* sticks the game binds against, so JG can remap freely. |
| **HIDHide** | Hides your *physical* sticks from Star Citizen so the game only ever sees the virtual ones. No double-inputs, no `pp_resortdevices` roulette. |

You configure vJoy and HIDHide once and basically never touch them again. JG is the only one you interact with day to day, and even that's a single profile toggle.

## What you get that Star Citizen can't do alone

### A modifier layer that doubles your button count

This is the big one. A single modifier button — held like a Shift key — gives every other button on the stick a second meaning. Press the button, you get action A. Hold the modifier and press it, you get action B. The Enhanced NXT profile runs more than 60 binds off that modifier layer alone.

SC has no concept of a shift state for joysticks. Without JG, that button does one thing, full stop. With it, your whole stick gains a second floor.

### Modes that change with your Master Mode

JG modes are full binding layers you swap between — and these profiles wire them to your gameplay context: an **SCM** layer for combat, a **NAV** layer for travel, and an **Auxiliary** layer for everything else. The same physical button can fire weapons in SCM and do something travel-appropriate in NAV, because it's reading from a different layer depending on where you are.

Mode switching itself is smarter than a flat toggle — the profile uses **Cycle** (step through modes), **Previous** (jump back to where you were), and **Temporary** (a momentary mode that only lasts while you hold the button). SC's bind menu has nothing like this; it's one global layout and that's it.

### Short press vs. long press on the same button (Tempo)

Tempo lets one button do two different things based on how long you hold it — a quick tap fires one action, a deliberate hold fires another. CIG occasionally gives us a native hold variant, but it's inconsistent and not available on most binds. JG makes it available on *any* button you want, and the timing is yours to tune.

### Macros for the things SC won't let you bind cleanly

A macro is a scripted sequence — multiple keys and vJoy presses fired in order, with timing. The profiles use these for actions SC handles badly, like keyboard chords that need to be *held* for a beat (SC polls key state per frame, so a plain chord bind oscillates; a macro with a short internal hold actually lands). Things like Toggle Docking ride on a macro for exactly this reason.

That said — macros are for cleaning up game jank, not for automation that crosses the line. These stay firmly on the "make a stubborn bind work" side of things.

### Your right mini-stick becomes a mouse

Both axes of the right grip's mini-stick are remapped to mouse X/Y. That means you can freelook — or drive any of SC's mouse-driven UI, like mobiGlas and the inner-thought system — without taking a hand off the stick to grab the actual mouse.

Star Citizen can't map a joystick axis to mouse movement. This is pure JG, and once you fly with it you don't go back.

### Map buttons to keyboard keys or mouse clicks

Beyond ship controls, JG can send raw keyboard keypresses and mouse clicks from a stick button. Handy for the binds SC keeps keyboard-only, or for on-foot and UI actions you'd rather not reach across the desk for.

### Response curves and deadzones that survive patches

Every axis can carry its own custom response curve and deadzone, set inside JG. The reason that matters isn't just tuning feel — it's *where the tuning lives*. SC's keybind menu gets wiped by patches, reinstalls, and character wipes. VKB's own Configurator works but is fiddly and per-device.

When the curve lives in the JG profile, it carries across SC patches — and across other games — with one save. The same logic owns axis inversion: one toggle per axis in JG instead of fighting SC's menu every wipe. (For that to hold up, leave inversions at default in VKB Configurator and SC's menu — let JG be the only place it lives.)

### Spoken callouts when you change modes

JG can play an audio clip on a button press or mode change, so switching from SCM to NAV gives you an actual voice callout instead of guessing which layer you're in. The packages ship two voice sets — a HAL 9000 set and a Star Trek "Computer" set — both made with a TTS generator, so swapping in your own clips is trivial.

Small thing, big quality-of-life. Modes are invisible by nature; a callout makes them legible.

### Room to grow

Your inputs get funneled into two virtual devices, and those devices have far more capacity than any single grip uses. The profiles deliberately leave 4–6 axes and hundreds of buttons open. Got rudder pedals, a button box, a GameGlass tablet, a throttle you want to fold in? They drop onto the same two virtual sticks — one tidy device for SC to bind against instead of a pile of separate hardware IDs the game has to keep straight.

## The supporting cast: vJoy and HIDHide

These two aren't optional extras — they're what makes the JG layer clean.

**vJoy** creates the virtual joysticks. JG reads your real sticks, does all the work above, and outputs to vJoy. Star Citizen binds against vJoy, not your hardware. That indirection is the whole trick.

**HIDHide** hides your physical sticks so the game *only* sees the virtual ones. Without it, SC sees both the real and virtual devices and you get double-inputs and binding conflicts — and you're back to running `pp_resortdevices` every session to fix device order. Hide the physical sticks once and that headache is gone. (You may still need `pp_resortdevices joystick 1 2` *one time* on first load. Then never again.)

Neither has to stay running. Open the configs, set them to match the [Software Configuration](general-setup/software-configuration.md) screenshots, close them. Done.

## "But I don't want more software running"

Fair concern, quick answers:

- **Performance:** JG uses about half a percent of CPU when you're mashing buttons, and 0% idle. vJoy and HIDHide don't need to stay open at all.
- **Forgot to launch it?** Start JG or flip the profile on mid-session — no SC restart needed.
- **Set-and-forget:** There are settings to launch JG with Windows, start minimized to tray, and enable the profile when SC opens. Once it's configured, you stop thinking about it.

More detail — and the rest of the common objections — lives in the [General FAQ](faq/general-joystick-star-citizen-faq.md#why-subliminal-uses-joystick-gremlin).

## Bottom line

If you're flying a single grip casually, basic binds are fine and I'll keep making them. But if you're running dual sticks, juggling combat and mining and salvage off the same hardware, and you've felt SC run out of buttons — that's the wall Joystick Gremlin is built to knock down. The setup cost is real (a few short videos and a one-time config), and it usually pays for itself the first time you don't have to re-bind a wiped keymap.

Pick your hardware from the [Joysticks](joysticks/index.md) section, then follow [General Setup](general-setup/download.md) to get the software in place.
