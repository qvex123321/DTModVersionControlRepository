local template_filenames = {
	"credits_store",
	"credits_goods_store",
	"credits_cosmetics_store_veteran",
	"credits_cosmetics_store_zealot",
	"credits_cosmetics_store_ogryn",
	"credits_cosmetics_store_psyker",
	"credits_weapon_cosmetics_store_veteran",
	"credits_weapon_cosmetics_store_zealot",
	"credits_weapon_cosmetics_store_ogryn",
	"credits_weapon_cosmetics_store_psyker",
	"marks_store",
	"marks_store_temporary",
	"contracts_list",
	"mission_board",
	"premium_store_account_update",
	"premium_store_featured",
	"premium_store_skins_veteran",
	"premium_store_skins_zealot",
	"premium_store_skins_ogryn",
	"premium_store_skins_psyker",
	"hard_currency_store"
}

local templates = {}

for _, v in ipairs(template_filenames) do
	local t = Mods.file.dofile(DC.mod_path .. "templates/" .. v)
	templates[v] = t
end

return templates
