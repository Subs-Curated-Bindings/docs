# General Joystick/Star Citizen FAQ

## How to properly Clear Bindings

The most effective way to clear you bindings is to load my clear bindings file `layout_SUB_Clear-Bindings_exported.xml`. Then go to Options > Settings > Advanced Controls Customization > change to joystick (bottom right). Then scroll all the way to the bottom and open every category by clicking the `+` sign  on the left. Then scroll down and manually remove every bind the game failed to remove. 

!!! warning
	Not recommended: you can also clear in-game from `Options > Keybindings > Advanced Controls Customization > Control Profiles > Clear All Device Bindings`. Select the corresponding devices and click load. Sometimes this does not clear everything properly.

## How to back-up bindings

You SHOULD NOT have to rebind everything from scratch after a new SC patch. Back up your binds to cloud storage and redeploy them if you need to delete your USER folder or if a patch wipes bindings.

The binding profile XML files can be found at:

`C:\Program Files\Roberts Space Industries\StarCitizen\LIVE\USER\Client\0\Controls\Mappings`

## How to check what peripherals are connected

1. Click the Windows button.
2. Search for "Set Up USB Game Controllers".
3. The ideal config is only having your two VKB Gladiator NXTs connected.
4. If you have more, either physically unplug them or hide them in software.
5. If you disconnect devices via physical or software you will need to restart SC in order for changes to take effect.

!!! note
	Any time your visible device list changes, restart Star Citizen so it rebuilds the device order cleanly.

## How to hide devices from Star Citizen

You can use HIDHide to hide devices from SC. I have a setup video guide for downloading and configuring HIDHide.

## My sticks are out of order/swapped?/One stick does not work?

- Check how many game controllers you have connected by opening up `USB Game Controllers`. If you are using my enhanced binds you should have 2 vJoy devices showing here. If not then check your [HIDHide Configuration](../general-setup/software-configuration.md#applications-allow-list){ data-preview }
- Alternativly you can type `i_DumpDeviceInformation` into the Star Citizen console.

### Only two devices

If it is only two, enter AC or the PU and press `~` to open the console. Then type `pp_resortdevices joystick 1 2`.

### More than two devices

If you are using my enhanced binds you should only have two vJoy devices. 
	- Error: If this is not intended check your [HIDHide Configuration](../general-setup/software-configuration.md#applications-allow-list){ data-preview }.
	- Not Error: If you wish to add a third device to the setup you will need to map its buttons and axis inside Joystick Gremlin. Two vJoy devices has more than enough buttons and axis for 99% of setups. You *do not* need to add another vjoy. If you are adding rudder pedals to your setup check out the FAQ for [adding rudder pedals](enhanced-bindings-faq.md#can-i-add-rudder-pedalsbutton-box-to-the-enhanced-binds){ data-preview }
If your setup doesnt use Joystick Gremlin and you do use three peripherals check in game to see which devices are correct. If you have three devices, one stick may work while the other is unresponsive because it's int he wrong slot.
Example flow:
	- Let’s say the right stick is unresponsive but the left is fine.
	- Go to `Options > Keybinds > Advanced Controls Customization`.
	- Switch from `Keyboard/Mouse` to `Joystick/HOTAS`.
	- Go to `Flight - Movement` and find a bind on the unresponsive stick (for example yaw).
	- Check what input number it uses. If it says `(Input 3)`, note that.
	- Now double tap the yaw bind and move the stick direction briefly to see what input SC expects (for example `(Input 2)`).
	- Quickly press `Esc` before rebinding completes.
	- Then run `pp_resortdevices joystick 3 2` in console.
If more than one device is out of order, repeat the process. *Then consider using Joystick Gremlin so you dont have to worry about this again :rofl:*

!!! warning
	Be ready to cancel with `Esc` immediately during the input check so you don't accidentally overwrite a bind.

## My Throttle/Roll/Any Axis is inverted?

Some VKB Gladiator NXT EVOs have an inverted throttle. This is an easy in-game fix. Go to `Options > Controls`, change the device selector from Mouse to the joystick you want to edit, then go to `Inversion Settings > Flight > Flight Movement > Throttle - Forward/Backward (abs.)`.

If you have a different `Throttle - Forward/Backward` binding, invert that one instead.

## Basic Binds Notice

I no longer recommend basic binds. Master Modes was the tipping point for how many buttons can realistically be bound on a joystick. You get tap and double tap, and sometimes hold if CIG gives it to us. Even at three actions per button across 29 buttons, options are finite. This also doesn't include conflicts (like double tap collisions). Recent patches added MFD and MFD Cast controls; MFDs alone add 54 binds and need at least 8 to function well. I simply can't find the room anymore.

Joystick Gremlin exists because Star Citizen's native binding system is limited. When new features drop, we have to decide what to replace or what not to use. I originally named my JG binds "Advanced" because I thought setup would be harder and wanted users to know it might require extra effort for the best experience.

But with current resources it's much easier: step-by-step videos, a snag checklist, and pre-made profiles. Thousands of people are using these profiles with minimal issues and very few downsides. Below are the reasons I use JG and common concerns people have. I'll keep making basic binds as long as enough people still use them.

## Why Subliminal Uses Joystick Gremlin

### Problems Joystick Gremlin Solves

- No need to run `pp_resortdevices` all the time. There is a 50/50 chance you may need `pp_resortdevices joystick 1 2` when you first load my profile, then NEVER AGAIN.
- A modifier button doubles your bindable button count. SC adds more binds every patch.
- Create double tap, and short/long press actions when SC doesn't!
- The right mini stick's two axes are remapped to mouse X/Y, so you can freelook while controlling the ship.
- If you have other peripherals like rudders, gamepads, button boxes, etc. They can be added to the two virtual devices. My profiles leave 4-6 axes open and hundreds of unbound buttons.
- Map buttons to keyboard or mouse clicks
- Create macros to automate tasks.
- Play audio file when you press a button or change modes
- The new SCM and NAV modes allow tinkerers to have binds and response curves depending on what Master Mode you are in.
- And more...

### Why people avoid Joystick Gremlin

#### "My computer can't handle more software" / "I don't want to reduce performance"

- vJoy and HIDHide do not need to stay running. Open configs, make changes, then close them.
- Joystick Gremlin uses up half a percent of my CPU when I spam buttons and 0% when idle.

#### "I don't want to remember to launch another program"

- If you forget to start JG, you can start it while playing. No need to restart SC.
- If you forget to turn the profile on, you can do so at any time without restarting the game.
- There are settings to launch JG with Windows, launch minimized to tray, auto-load profile (can cause startup timing issues for some users), and enable profile when SC opens.

This means once the software is configured you don't even have to look at it anymore.

#### "I don't want to spend time installing programs and loading profiles"

- My vJoy install/config video is about 7 minutes.
- My HIDHide video is 5 min long and also has an intro and outro.
- I have a video guide specifically for loading my JG and SC binding profiles. It's 20min long but the loading JG and SC profiles part is about 10min long. And I'm teaching, not just doing.

#### "I don't want to reload JG profiles every patch"

- My load profile video spends 3 min teaching you how to load a JG profile in real time.
- You may need `pp_resortdevices joystick 1 2` once when first loading the SC profile, then never again. That usually repays the setup time.

#### "Joystick Gremlin is buggy and causes issues on my PC"

- I only come across issues when I am "tinkering" and since I provide the profiles for you, you should not have issues.
- If vJoy conflicts with other games, just turn off the JG profile so sticks don't send input. You can also hide vJoy devices with HIDHide.
- I may occasionally release a profile with a bug after tinkering, but I fix those quickly and I don't plan to change profiles often unless CIG changes force updates or I discover a meaningful improvement.

## Video Guides

### HIDHide Quick Setup Guide

Shows how to install and configure HIDHide so Star Citizen only sees the intended virtual devices.

<iframe width="100%" height="450" src="https://www.youtube.com/embed/PyL156AywYQ" title="HIDHide Quick Setup Guide" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

### Loading Joystick Gremlin Bindings into Star Citizen

Full walkthrough for loading Joystick Gremlin and Star Citizen binding files in the correct order.

<iframe width="100%" height="450" src="https://www.youtube.com/embed/mc-ozIogrpI" title="Loading Joystick Gremlin Bindings into Star Citizen" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>