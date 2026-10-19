-- Open Retail Professions' existing refine views; processing stays in that addon.
local RingKeeper = type(OneRingLib) == "table" and OneRingLib.RingKeeper;
if not (type(RingKeeper) == "table" and type(RingKeeper.AddRing) == "function") then return; end

local ring = {name="Professions", version=1};
if IsAddOnLoaded("RetailProfessions") and RetailProfessions and RetailProfessions.Refine then
	-- Pend selects the refine view when the profession opens, as in its book.
	-- The /cast line runs through OPie's secure macro button, using localized names.
	local function refineMacro(code, ability, profession)
		local name = GetSpellInfo(ability);
		if not name then return ""; end
		-- Keep the requirement's name literal: an unknown {{spell:...}} becomes
		-- empty before RingKeeper checks requirements, which would drop the gate.
		return '#rkrequire ' .. name .. '\n/run local r=RetailProfessions.Refine;r.Pend("' .. code .. '");if r.IsOpen(r.Kind("' .. code .. '")) then r.SetView("' .. code .. '") end\n/cast {{spell:' .. profession .. '}}';
	end
	ring[#ring+1] = {c="8dcc70", rtype="macrotext", id=refineMacro("M", 51005, 45357), caption="Milling", icon="Interface\\Icons\\Ability_Milling"};
	ring[#ring+1] = {c="71b8dd", rtype="macrotext", id=refineMacro("P", 31252, 25229), caption="Prospecting", icon="Interface\\Icons\\INV_Misc_Gem_BloodGem_01"};
end
if IsAddOnLoaded("ArchaeologyUI") then
	ring[#ring+1] = {c="d9ad50", rtype="ring", id="EvermoreArchaeology", onlyWhilePresent=true, caption="Archaeology", icon="Interface\\Icons\\INV_Misc_Shovel_01"};
end
if #ring > 0 then RingKeeper:AddRing("EvermoreProfessions", ring); end
