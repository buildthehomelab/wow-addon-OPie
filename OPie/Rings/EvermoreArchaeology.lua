-- ArchaeologyUI owns the survey protocol and research window.
-- OptionalDeps ensures it has loaded before this file when enabled.
if not IsAddOnLoaded("ArchaeologyUI") then return; end
local RingKeeper = type(OneRingLib) == "table" and OneRingLib.RingKeeper;
if not (type(RingKeeper) == "table" and type(RingKeeper.AddRing) == "function") then return; end

RingKeeper:AddRing("EvermoreArchaeology", {
	{c="d9ad50", rtype="macrotext", id="/arch survey", caption="Survey", icon="Interface\\Icons\\INV_Misc_Shovel_01"},
	{c="71b8dd", rtype="macrotext", id="/arch", caption="Archaeology Research", icon="Interface\\Icons\\INV_Misc_Book_09"},
	{c="8dcc70", rtype="macrotext", id="/arch minimap", caption="Toggle Dig Sites on Minimap", icon="Interface\\Icons\\INV_Misc_Map_01"},
	name="Archaeology", version=1
});
