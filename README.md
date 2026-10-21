# OPie for WoW 3.3.5a

[OPie](http://www.go-hero.net/opie/) "Foxtrot 9" (1.49) by foxlit, the Wrath of the Lich King build, for the WoW 3.3.5a client.

OPie puts abilities, items, mounts, companions and macros on rings. Hold a key binding and the ring opens around your cursor; point at a slice and let go to use it.

## Changes from OPie Foxtrot 9

The first commit is the unmodified release, as downloaded from [Warperia](https://warperia.com/addon-wotlk/opie/) (`ww-opie-251222.zip`). Everything after it is from this fork:

- `OPie/OPieConfig.lua`: creating a profile with a name that already exists is refused again. The check read an unset variable (`kn`) instead of the typed name, so the duplicate went through and its undo step could delete the existing profile.
- `OPie/Meta/RingKeeperConfig.lua`: shift-clicking an item or spell into an empty slice macro adds `/use` or `/cast` in front again. The "macro is empty" flag was never set, so the prefix was never added.
- `OPie/OneRingLib.lua`: the companion and mount cache only reports a change when an index really moved. It compared against an unset variable (`csID`), so every companion update counted as a change and rebuilt the rings.
- `OPie/Rings/EvermoreArchaeology.lua`: an editable Archaeology ring uses the ArchaeologyUI addon for Survey, Research and toggling dig-site minimap pins.
- `OPie/Rings/EvermoreProfessions.lua`: a Professions ring with Milling and Prospecting shortcuts that open Retail Professions' herbs or ore view, plus the Archaeology ring when ArchaeologyUI is loaded. The `Evermore*` file and ring names are kept so saved rings and bindings keep working.

## Requirements

- A WoW 3.3.5a (12340) client.

## Installation

Copy the `OPie` folder into `Interface/AddOns`, so you end up with `Interface/AddOns/OPie/OPie.toc`, replacing any OPie folder already there. Rings and bindings are stored in `WTF`, not in the addon folder, so they are kept.

## Usage

- `/opie` (or `/op`) opens the options, where you bind a key to each ring.
- `/rk` (RingKeeper) adds, edits and removes rings and their slices.

## Archaeology ring

Install and enable `ArchaeologyUI` from
[wow-mod-archaeology](https://github.com/buildthehomelab/wow-mod-archaeology/tree/main/addon/ArchaeologyUI)
alongside OPie, then reload the interface. The new **Archaeology** ring contains:

- **Survey**: `/arch survey`, through ArchaeologyUI's existing server messaging.
- **Archaeology Research**: `/arch`, including its DragonUI integration.
- **Toggle Dig Sites on Minimap**: `/arch minimap`.

Assign the ring a key in `/opie`. It has no default binding and leaves existing
rings and bindings unchanged. Use `/rk` to edit it or nest it inside another
ring. It appears whenever ArchaeologyUI is loaded, regardless of the character's
skill; ArchaeologyUI and the server decide which actions are available.

ArchaeologyUI is optional: without it, OPie does not register this default ring.
The existing archaeology module and its normal client requirements still apply;
this integration needs no additional server change or client patch.

Not yet tried in a game client: radial selection, macro execution, saved bindings and combat behavior of this ring.

## Professions ring

With `RetailProfessions` enabled, the **Professions** ring adds **Milling** and
**Prospecting** shortcuts for characters who know those abilities. Each shortcut
opens its profession with Retail Professions' herbs or ore view selected. Choose
materials, amounts, and Mill All or Prospect All there; opening a view does not
start processing or select a material for you.

When `ArchaeologyUI` is enabled, the same ring also includes the **Archaeology**
sub-ring. Either addon can be used on its own. Assign the Professions ring a key
in `/opie`, and use `/rk` to customize it. It has no default binding.

The shortcuts use Retail Professions' existing pending-view API and localized
Inscription/Jewelcrafting casts through OPie's secure macro buttons. They require
the realm's normal Retail Professions setup and its retail crafting window.
If you previously selected `/prof classic`, switch back with `/prof retail`.
No server code or additional client patch is needed.
Opening the profession and selecting the refine page, including repeated use,
DragonUI hosting and combat restrictions, still need testing in the game client.

## Credits

- OPie: foxlit ([go-hero.net/opie](http://www.go-hero.net/opie/))

## License

OPie is foxlit's work. The release ships without a license file. This repository keeps the 3.3.5a build available with the fixes above. All rights to OPie stay with its author.
