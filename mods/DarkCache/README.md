*CHANGELOG*

---
# 1.4
- Added option to toggle suppressing the "Cache Regeneration required" notification.
- Added Icon Caching. Prevents generated item icons from being unloaded (and reloaded) by scrolling or exiting out of item list views.
- Added option to toggle Icon Caching (default is off). For now, this will not 'release' previously generated icons when disabled, but will allow normal unloading and generating where an icon has not yet been generated for an item.
- Added warning text when accessing premium store so that people are less likely to try and purchase premium store items that appear to be free due to DarkCache.
---
# 1.3.2
- Added prefetching and caching functionality for the new Commissary cosmetics stores.
- Added toggles in mod options for the new cache items.
- Removed old operative and weapon cosmetics cache items.
- Fixed crashing when loading directly into the Psykhanium from main menu, as is possible with mods like Psych Ward and Modular Menu Buttons.
---
# 1.3.1
- Added placeholder file to hub_preload_data directory so Vortex doesn't delete it.
---
# 1.3
- Added Mourningstar preloading (off by default).
- Added mod options for toggling any cache item.
- Added chat alerts announcing setting changes.
- Reintroduced incompatibility with CharWallets and refixed it.
- Changed Mourningstar caching and preloading to default to off so that people whose systems have less memory don't have issues upon adding the mod.
- Added warning text to be shown when Mourningstar caching is enabled.
- Lots of internal refactoring and reorganising.
- Moved all developer mode output to print() rather than DMF:echo() so output is shown in DMF developer console.
---
# 1.2.4
- Fixes issue where operative cosmetics store would constantly reload, preventing use.
- Added caching for Brunt's Armoury.
---
# 1.2.3
- Fixed incompatibilty issue with the CharWallets mod where incorrect contracts info was displayed.
---
# 1.2.2
- Fixed issue where an error would be shown if player started game with all caches but hub caching disabled and then went to buy something from the credits store.
- Fixed issue where toggling a cache would not take effect due to related cache not being rebuilt.
- Added a bit more text to hub caching explanation indicating that (currently) the cache won't be disabled properly until player restarts client.
- Changed all the ModNexus filenames back to just "DarkCache" so things work better for Vortex users. Sorry you guys for this last change.
- Reworked settings so caches aren't rebuilt at character change when no mod settings have changed.
---
# 1.2
- Fixed issue where item icons were loading slowly or not at all when viewing weapon skins and trinkets. Item icon caching was disabled for this fix.
- Fixed issue where premium store was not showing owned assets as such.
- Fixed issue where contracts list was not updating after rerolling tasks.
- Fixed issue where loaders attempted to reload Mourningstar when exiting psykhanium.
- Fixed issue where Mourningstar would apparently try to reload despite caching when exiting psykhanium.
- Added text output confirming setting changes.
- Added special text explanations with setting confirmations where appropriate.
- Reworked all caching toggles (except Mourningstar since it works differently) to simply rebuild the relevant cache when a related setting is changed. They should all work now.
- Added caching for the Armoury's cosmetics store.
- Added caching for the Armoury's weapon cosmetics store.
---
# 1.1
- Fixed issue where psykhanium was crashing.
---
# 1
- Added prefetching and caching for Armoury, Melk, Contracts List, Mission Board & Premium Store.
- Added intra-view persistence for item icons.
- Added caching of Mourningstar level itself.
