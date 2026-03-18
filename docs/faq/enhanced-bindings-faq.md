# Enhanced Binds Frequently Asked Questions

## Enhanced Binds Checklist

Installing the Enhanced binds is very simple but due to game bugs or slight user error, there can be some snags. Here are some common places users get snagged.

1. Make sure your physical joysticks match mine. The README section for your specific setup will say if you need to make changes. This usually means going through the manufacturer software to calibrate and align the same physical button layout (if your controls are interchangeable). I only change joystick configs when I absolutely have to, to keep things as plug-and-play as possible.

    !!! example
        Make sure your Gladiator NXTs have been properly set up. Players commonly skip setup after assembly. Here is the latest [VKB video at the software setup timestamp](https://youtu.be/HRC5uPpFPzk?si=POKljkenaIM9mxpF&t=487). If this wasn't done, your physical button mappings may not match.

2. You may want to update your firmware, but that is usually optional. I’ll specify in your setup README if this is required.

3. Make sure your HIDHide and vJoy settings look exactly like the images below (whitelisting JG, HIDHide, and VKBDev; hiding all but the virtual sticks; and having a second vJoy device with all the same params except button count). You can compare against [vJoy Configuration](../general-setup/software-configuration.md#vjoy-configuration) and [HIDHide Configuration](../general-setup/software-configuration.md#applications-allow-list).

    !!! note "Image placeholders"
        - `IMG:VJOY_TAB_1`
        - `IMG:VJOY_TAB_2`
        - `IMG:HIDHIDE_TAB_1`
        - `IMG:HIDHIDE_TAB_2`

4. Ensure you are loading the correct Joystick Gremlin profile for your setup. i.e. `Joystick Gremlin Profile [ENH][STICK_COMBO][X.Y.Z].xml` (for example: `Joystick Gremlin Profile [ENH][NXT][4.5.0].xml`).

5. Make sure you [Swap Devices](#i-loaded-your-profile-but-its-empty-or-there-are-no-mappings) in Joystick Gremlin.

6. Optional: delete the`actionmaps.xml` file inside`Profiles` folder at `C:\Program Files\Roberts Space Industries\StarCitizen\LIVE\USER\Client\0\Profiles`

    ??? tip "Pro Tip"
        That file houses the current binds SC has loaded, inversion settings, etc. Basically all the settings you can change inside SC for keybinds. 

7. Put your setup-specific `layout_*_exported.xml` file (for example: `layout_ENH_450_NXT_exported.xml`) and `layout_SUB_Clear_Bindings_exported.xml` into `Roberts Space Industries\StarCitizen\LIVE\USER\Client\0\Controls\Mappings`

8. Make sure the JG profile is on (🎮  icon should be green). This must be done every time JG starts, unless you enable auto-load/auto-start in settings.

9. You must [properly clear bindings](general-joystick-star-citizen-faq.md#how-to-properly-clear-bindings){ data-preview }. There are many ways to do this, and the linked section explains the quickest reliable method.

10. Launch SC and load your setup-specific `layout_*_exported.xml` SC binding file (for example: `layout_ENH_450_NXT_exported.xml`). 

11. Check inside "Flight movement" and make sure all six axes are bound. If some of the axes are missing, clear and rebind again. (SC can be jank...)

12. Axis inverted? See the [Inverted Throggle](general-joystick-star-citizen-faq.md#my-throttlerollany-axis-is-inverted){ data-preview }

## Known Issues

### Failed to Execute Script Joystick Gremlin

See [Known Issues - Failed to Execute Script Joystick Gremlin](../known-issues.md#failed-to-execute-script-joystick-gremlin) for details and workaround notes.

### Loaded the SC bindings but the MFD binds are missing

This is a bug with Star Citizen. Check out [Known Issues - MFD Binds](../known-issues.md#mfd-binds){ data-preview } for the workaround.

## I loaded your profile but it's empty or there are no mappings

After you load a profile, you need to `Swap Devices` in Joystick Gremlin. You should see your physical devices on the left, and what devices they are assigned to on the right. Contrary to its name, you aren't necessarily "swapping" devices; you are syncing them. Press the white box to the right of your first physical stick, then move an axis on that stick. Then **STOP** and double-check that the physical sticks didn't reorder themselves. If they did, redo the first device, and possibly the second.

!!! example "Explanation"
    What you just did replaced my device IDs with your own and synced the vJoy devices to the correct sticks.

!!! tip "Pro Tip"
       Save the profile right after this so you don't have to repeat the action.

## I am getting a vJoy error

There are a few things that can cause vJoy errors:

- You did not restart your PC after making a change to a vJoy device.
- Your vJoy settings don't EXACTLY match what I showed in the installation video. Each vJoy device should have all axes enabled, POV Hat Switch set to Continuous, and 4 POVs. Your first device should have 128 buttons and the second 127.
- You do not have 2 vJoy devices set up.

### Explanation

We have to change something on the second vJoy device because two vJoy devices cannot have an identical config, and your vJoy settings need to match mine EXACTLY for JG to not error out.

!!! note
   Having 2 vJoy devices may require entering `pp_resortdevices joystick 1 2` in the Star Citizen console, but you should only need to do this once, and never again unless you reset your SC settings.

## Only one stick works in Star Citizen

If one of your sticks isn't working in SC, that usually means SC is seeing more than the 2 vJoy devices. In most cases, your HIDHide settings don't match the ones shown in [vJoy - Software Configuration](../general-setup/software-configuration.md#vjoy-configuration){ data-preview }

## Star Citizen/JG Input Viewer does not register any actions

- First check Input Viewer to see if your `virtual` sticks are firing.
- If they are not, turn on the profile. *It's ok, it happens to the best of us 🤣*

## I press a button and JG keeps pressing that button

`Input Repeater` and `Input Viewer` look similar andyou probably accidentally cliked the wrong one.

!!! tip
	Turn off "Input Repeater".

## Modifier or Operator Mode becomes a toggle instead of a temp hold

This can happen for multiple reasons:

1. First, try turning the profile off and back on.
2. You might be using the 13.3 DEBUG version of JG.
    - This version is designed to fix three specific issues. If you don't have those issues, this version is not intended for use. This is not a proper full release and should not be needed if R13.3 is not causing issues. From what I have seen, this version is not compatible with sharing from the main version. Please download the regular release.
3. Check for an old profile getting auto-loaded.
    - This bug was fixed in the 10.24.24 release. Your JG settings might be set to auto-load a profile either on launch or when SC starts. Make sure that file is a fresh profile from the download page. Your Joystick Gremlin may be loading an old file I or you already fixed. It's best to throw old profiles away.

## Known Issues

### Failed to Execute Script Joystick Gremlin

See [Known Issues - Failed to Execute Script Joystick Gremlin](../known-issues.md#failed-to-execute-script-joystick-gremlin) for details and workaround notes.

### Loaded the SC bindings but the MFD binds are missing

This is a bug with Star Citizen. Check out [Known Issues - MFD Binds](../known-issues.md#mfd-binds){ data-preview } for the workaround.

## How to add TTS dialogue when I switch between Master Modes

Adding Text to Speech to a button is simple. Inside you stick gremlin:

1. Select physical button 3 for example. This will open up a view of the actions.
2. Add a TTS (Text to Speech) action beneith the already added remap.
3. Type in the desired phrase or word (for example: Auxiliary Mode Enabled).
4. Turn the profile off and then back on.
5. Repeat for each stick in Auxiliary, Nav, and SCM modes.

## How to get JG to play a sound when I switch between Master Modes

Adding an audio clip to a button is simple:

1. Select physical button 3 for example. This will open up a view of the actions.
2. There is usually a TTS action added here by default. You should delete this or risk hearing both TTS and the audio file.
3. Click the pencil icon and point it to where the audio file is located on your hard drive. *Make sure you dont have them saved to a location like your desktop or downloads folder that you may delete later.*
4. Repeat for each stick in Auxiliary, Nav, and SCM modes.
5. Turn the profile off and then back on.

??? tip "Save As, Pro Tip"
    Its a good practivce to `Save As` whenever you make a change to my default config. That way if you break something you have it to fall back on. Also if you are doing lots of changes it is a good best practice to `Save As` occationally incase you break something after spending an evening getting it just right. Since you cant *undo* your cange if you corrupt a JG profile you will need to fix the syntax manually to fix it and thats a pain. Ask me how I know...

## Can I add Rudder Pedals/Button Box to the Enhanced Binds?

Absolutely. In fact you can do it so quickly with Joystick Gremlin you'll probably spend more time reading this than getting it ready. And if the game is open you dont even need to restart it.

Step 1: Plug in your rudder pedals. Joystick Gremlin should add a new tab for the physical device.
Step 2: Open the tab for that device click the axis you want to bind. And then remap that axis to the first available axis. *Joystick Gremlin will automatically select the next available vjoy axis.*
Step 3: If your profile was on turn it off and back on. If the profile was off then just turn it on.
Step 4: Open Star Citizen and go to Advanced Controls, find the bind for roll/yaw (depending on what team your on :lol:) and rebind it to the Rudder Pedals.

If you are adding a button box the process is the same, you'll need to map it's physical buttons to available virtual ones and then add the keybinds ingame.

??? tip "Save As, Pro Tip"
    Its a good practivce to `Save As` whenever you make a change to my default config. That way if you break something you have it to fall back on. Also if you are doing lots of changes it is a good best practice to `Save As` occationally incase you break something after spending an evening getting it just right. Since you cant *undo* your change if you corrupt a JG profile you will need to fix the syntax manually to fix it and thats a pain. Ask me how I know...

## Video Guides

### Loading Joystick Gremlin Bindings into Star Citizen

Step-by-step walkthrough for loading Joystick Gremlin and Star Citizen profiles (timestamp starts at the profile-loading portion).

<iframe width="100%" height="450" src="https://www.youtube.com/embed/mc-ozIogrpI?start=498" title="Loading Joystick Gremlin Bindings into Star Citizen" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>


