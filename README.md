# OPie for WoW 3.3.5a

[OPie](http://www.go-hero.net/opie/) "Foxtrot 9" (1.49) by foxlit, the Wrath of the Lich King build, for the WoW 3.3.5a client.

OPie puts abilities, items, mounts, companions and macros on rings. Hold a key binding and the ring opens around your cursor; point at a slice and let go to use it.

## Changes from OPie Foxtrot 9

The first commit is the unmodified release, as downloaded from [Warperia](https://warperia.com/addon-wotlk/opie/) (`ww-opie-251222.zip`). Everything after it is from this fork:

- `OPie/OPieConfig.lua`: creating a profile with a name that already exists is refused again. The check read an unset variable (`kn`) instead of the typed name, so the duplicate went through and its undo step could delete the existing profile.
- `OPie/Meta/RingKeeperConfig.lua`: shift-clicking an item or spell into an empty slice macro adds `/use` or `/cast` in front again. The "macro is empty" flag was never set, so the prefix was never added.
- `OPie/OneRingLib.lua`: the companion and mount cache only reports a change when an index really moved. It compared against an unset variable (`csID`), so every companion update counted as a change and rebuilt the rings.

## Requirements

- A WoW 3.3.5a (12340) client.

## Installation

Copy the `OPie` folder into `Interface/AddOns`, so you end up with `Interface/AddOns/OPie/OPie.toc`, replacing any OPie folder already there. Rings and bindings are stored in `WTF`, not in the addon folder, so they are kept.

## Usage

- `/opie` (or `/op`) opens the options, where you bind a key to each ring.
- `/rk` (RingKeeper) adds, edits and removes rings and their slices.

## Credits

- OPie: foxlit ([go-hero.net/opie](http://www.go-hero.net/opie/))

## License

OPie is foxlit's work. The release ships without a license file. This repository keeps the 3.3.5a build available with the fixes above. All rights to OPie stay with its author.
