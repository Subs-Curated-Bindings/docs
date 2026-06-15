# Contributing

This page is for advanced users who want to help improve the bleeding-edge binds between stable releases.

## Reporting a binding or chart issue

You don't need to be a contributor to flag a problem. If something about a specific stick's **binds or chart** is wrong, open an issue **on that stick's own repository** — each stick lives in its own repo under the [Subs-Curated-Bindings](https://github.com/Subs-Curated-Bindings) org, so the report lands where the files actually are.

| Stick | Open an issue |
|---|---|
| VKB Gladiator NXT EVO | [New issue](https://github.com/Subs-Curated-Bindings/VKB-Dual-GladiatorNXT/issues/new) |
| Thrustmaster SOL-R 2 | [New issue](https://github.com/Subs-Curated-Bindings/Thrustmaster-Dual-SOLR2/issues/new) |
| VKB Gunfighter (SCG grip) | [New issue](https://github.com/Subs-Curated-Bindings/VKB-Dual-GunfighterSCG/issues/new) |
| Virpil VMAX + Aeromax-R | [New issue](https://github.com/Subs-Curated-Bindings/Virpil-VMAX-AeromaxR/issues/new) |
| MOZA MTQ + MHG | [New issue](https://github.com/Subs-Curated-Bindings/MOZA-MTQ-MHG/issues/new) |

Each stick's own docs page links to the same tracker with a short report template pre-filled.

**Good issues — things that aren't right about the binds themselves:**

- **A bind feels missing.** Say what action you want and where on the chart you'd expect it to live. If it makes sense, it may get added in a future update.
- **The chart doesn't match the game.** The chart shows one thing but the bind does another — or nothing.

**Not issues — setup and usage:**

- Installing or loading a profile, **Swap Devices**, blank binds, vJoy errors, axis inversion → work through the [Setup Guide](general-setup/download.md). If you're still stuck, ask in [Discord](https://discord.subliminal.gg) — that's faster than an issue, and it keeps the trackers focused on bind accuracy.

Want to go further and actually fix or add binds yourself? Read on.

## Who Should Contribute

- Users comfortable troubleshooting Joystick Gremlin and Star Citizen control profiles
- Testers willing to validate changes after patch updates
- Community members who want to submit fixes or quality-of-life improvements

## Contribution Workflow

1. Sync to the current patch baseline
2. Clear old Joystick Gremlin and Star Citizen binds
3. Apply latest repository profile and XML files
4. Test controls in practical flight/combat scenarios
5. Open a GitHub issue or pull request with findings/changes

## What Makes a Great Report

- Joystick hardware and firmware version
- Star Citizen build/patch number
- Which profile/files were used
- Repro steps
- Expected behavior vs actual behavior
- Suggested adjustment (if known)

## Pull Request Guidance

- Keep PRs focused and small when possible
- Clearly describe what changed and why
- Include before/after behavior for control changes
- Reference related issue IDs when applicable

## Community Coordination

Coordinate priorities and testing focus in Discord:

- https://discord.subliminal.gg
