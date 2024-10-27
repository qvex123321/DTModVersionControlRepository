local mod = get_mod("weapon_customization")

return {
	name = mod:localize("mod_title"),
	description = mod:localize("mod_description"),
	is_togglable = false,
	options = {
		widgets = {
			{["setting_id"] = "group_visible_equipment",
  				["type"] = "group",
				["sub_widgets"] = {
					{["setting_id"] = "mod_option_visible_equipment",
						["type"] = "checkbox",
						["default_value"] = true,
						["tooltip"] = "mod_option_visible_equipment_tooltip",
						["sub_widgets"] = {
							{["setting_id"] = "mod_option_visible_equipment_sounds",
								["type"] = "dropdown",
								["default_value"] = "others",
								["tooltip"] = "mod_option_visible_equipment_sounds_tooltip",
								["options"] = {
									{text = "mod_option_visible_equipment_sounds_all", value = "all"},
									{text = "mod_option_visible_equipment_sounds_others", value = "others"},
									{text = "mod_option_visible_equipment_sounds_off", value = "off"},
								}
							},
							{["setting_id"] = "mod_option_visible_equipment_own_sounds_fp",
								["type"] = "checkbox",
								["default_value"] = false,
								["tooltip"] = "mod_option_visible_equipment_own_sounds_fp_tooltip",
							},
							{["setting_id"] = "mod_option_visible_equipment_disable_in_hub",
								["type"] = "checkbox",
								["default_value"] = false,
								["tooltip"] = "mod_option_visible_equipment_disable_in_hub_tooltip",
							},
						},
					},
				},
			},
			{["setting_id"] = "group_scopes",
  				["type"] = "group",
				["sub_widgets"] = {
					{["setting_id"] = "mod_option_scopes",
						["type"] = "checkbox",
						["default_value"] = true,
						["tooltip"] = "mod_option_scopes_tooltip",
						["sub_widgets"] = {
							{["setting_id"] = "mod_option_scopes_sound",
								["type"] = "checkbox",
								["default_value"] = true,
								["tooltip"] = "mod_option_scopes_sound_tooltip",
							},
							{["setting_id"] = "mod_option_scopes_particle",
								["type"] = "checkbox",
								["default_value"] = true,
								["tooltip"] = "mod_option_scopes_particle_tooltip",
							},
							-- {["setting_id"] = "mod_option_scopes_recoil",
							-- 	["type"] = "numeric",
							-- 	["default_value"] = .1,
							-- 	["range"] = {0, 1},
							-- 	["decimals_number"] = 2,
							-- 	["tooltip"] = "mod_option_scopes_recoil_tooltip",
							-- },
							-- {["setting_id"] = "mod_option_scopes_sway",
							-- 	["type"] = "numeric",
							-- 	["default_value"] = .1,
							-- 	["range"] = {0, 1},
							-- 	["decimals_number"] = 2,
							-- 	["tooltip"] = "mod_option_scopes_sway_tooltip",
							-- },
							{["setting_id"] = "mod_option_deactivate_crosshair_aiming",
								["type"] = "checkbox",
								["default_value"] = true,
								["tooltip"] = "mod_option_deactivate_crosshair_aiming_tooltip",
							},
							{["setting_id"] = "mod_option_deactivate_laser_aiming",
								["type"] = "checkbox",
								["default_value"] = true,
								["tooltip"] = "mod_option_deactivate_laser_aiming_tooltip",
							},
							{["setting_id"] = "mod_option_scopes_reticle_size",
								["type"] = "numeric",
								["default_value"] = .1,
								["range"] = {.1, 1},
								["decimals_number"] = 2,
								["tooltip"] = "mod_option_scopes_reticle_size_tooltip",
							},
							{["setting_id"] = "mod_option_scopes_lens_transparency",
								["type"] = "numeric",
								["default_value"] = 1,
								["range"] = {.5, 1},
								["decimals_number"] = 2,
								["tooltip"] = "mod_option_scopes_lens_transparency_tooltip",
							},
						},
					},
				},
			},
			{["setting_id"] = "group_randomization",
  				["type"] = "group",
				["sub_widgets"] = {
					{["setting_id"] = "mod_option_randomization_only_base_mod",
						["type"] = "checkbox",
						["default_value"] = true,
						["tooltip"] = "mod_option_randomization_only_base_mod_tooltip",
					},
					{["setting_id"] = "mod_option_randomization_store",
						["type"] = "checkbox",
						["default_value"] = true,
						["tooltip"] = "mod_option_randomization_store_tooltip",
					},
					{["setting_id"] = "mod_option_randomization_players",
						["type"] = "checkbox",
						["default_value"] = true,
						["tooltip"] = "mod_option_randomization_players_tooltip",
					},
					{["setting_id"] = "mod_option_randomization_reward",
						["type"] = "checkbox",
						["default_value"] = true,
						["tooltip"] = "mod_option_randomization_reward_tooltip",
					},
					{["setting_id"] = "mod_option_randomization_laser_pointer",
						["type"] = "checkbox",
						["default_value"] = false,
						["tooltip"] = "mod_option_randomization_laser_pointer_tooltip",
					},
					{["setting_id"] = "mod_option_randomization_bayonet",
						["type"] = "numeric",
						["default_value"] = 25,
						["range"] = {0, 100},
						["decimals_number"] = 0,
						["tooltip"] = "mod_option_randomization_bayonet_tooltip",
					},
					{["setting_id"] = "mod_option_randomization_flashlight",
						["type"] = "numeric",
						["default_value"] = 25,
						["range"] = {0, 100},
						["decimals_number"] = 0,
						["tooltip"] = "mod_option_randomization_flashlight_tooltip",
					},
					{["setting_id"] = "mod_option_randomization_stock",
						["type"] = "numeric",
						["default_value"] = 25,
						["range"] = {0, 100},
						["decimals_number"] = 0,
						["tooltip"] = "mod_option_randomization_stock_tooltip",
					},
				},
			},
			{["setting_id"] = "group_weapon_animation",
  				["type"] = "group",
				["sub_widgets"] = {
					{["setting_id"] = "mod_option_weapon_build_animation",
						["type"] = "checkbox",
						["default_value"] = true,
						["tooltip"] = "mod_option_weapon_build_animation_tooltip",
						["sub_widgets"] = {
							{["setting_id"] = "mod_option_weapon_build_animation_speed",
								["type"] = "numeric",
								["default_value"] = 2.5,
								["range"] = {1, 4},
								["unit_text"] = "mod_option_weapon_build_animation_speed_unit",
								["tooltip"] = "mod_option_weapon_build_animation_speed_tooltip",
								["decimals_number"] = 2
							},
							{["setting_id"] = "mod_option_weapon_build_animation_wobble",
								["type"] = "checkbox",
								["default_value"] = true,
								["tooltip"] = "mod_option_weapon_build_animation_wobble_tooltip",
							},
						},
					},
					{["setting_id"] = "mod_option_carousel",
						["type"] = "checkbox",
						["default_value"] = true,
						["tooltip"] = "mod_option_carousel_tooltip",
					},
					{["setting_id"] = "mod_option_camera_zoom",
						["type"] = "checkbox",
						["default_value"] = true,
						["tooltip"] = "mod_option_camera_zoom_tooltip",
					},
					-- {["setting_id"] = "mod_option_attachment_boxes",
					-- 	["type"] = "checkbox",
					-- 	["default_value"] = true,
					-- 	["tooltip"] = "mod_option_attachment_boxes_tooltip",
					-- },
					-- {["setting_id"] = "mod_option_camera_hide_ui",
					-- 	["type"] = "checkbox",
					-- 	["default_value"] = true,
					-- 	["tooltip"] = "mod_option_camera_hide_ui_tooltip",
					-- },
				}
			},
			{["setting_id"] = "group_flashlight",
  				["type"] = "group",
				["sub_widgets"] = {
					{["setting_id"] = "mod_option_flashlight",
						["type"] = "checkbox",
						["default_value"] = true,
						["tooltip"] = "mod_option_flashlight_tooltip",
						["sub_widgets"] = {
							{["setting_id"] = "mod_option_flashlight_shadows",
								["type"] = "checkbox",
								["default_value"] = true,
								["tooltip"] = "mod_option_flashlight_shadows_tooltip",
							},
							{["setting_id"] = "mod_option_flashlight_flicker",
								["type"] = "checkbox",
								["default_value"] = true,
							},
							{["setting_id"] = "mod_option_flashlight_flicker_start",
								["type"] = "checkbox",
								["default_value"] = true,
								["tooltip"] = "mod_option_flashlight_flicker_start_tooltip",
							},
						},
					},
				},
			},
			{["setting_id"] = "group_laser_pointer",
  				["type"] = "group",
				["sub_widgets"] = {
					{["setting_id"] = "mod_option_laser_pointer",
						["type"] = "checkbox",
						["default_value"] = true,
						["tooltip"] = "mod_option_laser_pointer_tooltip",
						["sub_widgets"] = {
							{["setting_id"] = "mod_option_laser_pointer_count",
								["type"] = "numeric",
								["default_value"] = 10,
								["range"] = {1, 30},
								["decimals_number"] = 0,
								["tooltip"] = "mod_option_laser_pointer_count_tooltip",
							},
							{["setting_id"] = "mod_option_laser_pointer_count_others",
								["type"] = "numeric",
								["default_value"] = 1,
								["range"] = {1, 30},
								["decimals_number"] = 0,
								["tooltip"] = "mod_option_laser_pointer_count_others_tooltip",
							},
							{["setting_id"] = "mod_option_deactivate_crosshair_laser",
								["type"] = "checkbox",
								["default_value"] = true,
								["tooltip"] = "mod_option_deactivate_crosshair_laser_tooltip",
							},
							{["setting_id"] = "mod_option_laser_pointer_dot_size",
								["type"] = "numeric",
								["default_value"] = 1,
								["range"] = {.5, 1},
								["decimals_number"] = 2,
								["tooltip"] = "mod_option_laser_pointer_dot_size_tooltip",
							},
							{["setting_id"] = "mod_option_laser_pointer_weapon_dot",
								["type"] = "checkbox",
								["default_value"] = true,
								["tooltip"] = "mod_option_laser_pointer_weapon_dot_tooltip",
							},
						},
					},
				}
			},
			{["setting_id"] = "group_battery",
  				["type"] = "group",
				["sub_widgets"] = {
					{["setting_id"] = "mod_option_battery_show",
						["type"] = "checkbox",
						["default_value"] = true,
						["tooltip"] = "mod_option_battery_show_tooltip",
					},
					{["setting_id"] = "mod_option_battery_show_threshold",
						["type"] = "dropdown",
						["default_value"] = 1,
						["tooltip"] = "mod_option_battery_show_threshold_tooltip",
						["options"] = {
							{text = "mod_option_battery_show_threshold_10", value = .1},
							{text = "mod_option_battery_show_threshold_25", value = .25},
							{text = "mod_option_battery_show_threshold_50", value = .5},
							{text = "mod_option_battery_show_threshold_75", value = .75},
							{text = "mod_option_battery_show_threshold_100", value = 1},
						}
					},
				},
			},
			{["setting_id"] = "group_weapon_sway",
  				["type"] = "group",
				["sub_widgets"] = {
					{["setting_id"] = "mod_option_sway",
						["type"] = "checkbox",
						["default_value"] = true,
						["tooltip"] = "mod_option_sway_tooltip",
						["sub_widgets"] = {
							{["setting_id"] = "mod_option_misc_sway",
								["type"] = "checkbox",
								["default_value"] = true,
								["tooltip"] = "mod_option_misc_sway_tooltip",
							},
							{["setting_id"] = "mod_option_misc_sway_aim",
								["type"] = "checkbox",
								["default_value"] = false,
								["tooltip"] = "mod_option_misc_sway_aim_tooltip",
							},
						},
					},
				},
			},
			{["setting_id"] = "group_weapon_dof",
  				["type"] = "group",
				["sub_widgets"] = {
					{["setting_id"] = "mod_option_misc_weapon_dof",
						["type"] = "checkbox",
						["default_value"] = true,
						["tooltip"] = "mod_option_misc_weapon_dof_tooltip",
						["sub_widgets"] = {
							{["setting_id"] = "mod_option_misc_weapon_dof_no_aim",
								["type"] = "checkbox",
								["default_value"] = true,
								["tooltip"] = "mod_option_misc_weapon_dof_no_aim_tooltip",
								["sub_widgets"] = {
									{["setting_id"] = "mod_option_misc_weapon_dof_strength_no_aim",
										["type"] = "numeric",
										["default_value"] = .6,
										["range"] = {0, 2},
										["decimals_number"] = 1,
										["tooltip"] = "mod_option_misc_weapon_dof_strength_no_aim_tooltip",
									},
								},
							},
							{["setting_id"] = "mod_option_misc_weapon_dof_scope",
								["type"] = "checkbox",
								["default_value"] = true,
								["tooltip"] = "mod_option_misc_weapon_dof_scope_tooltip",
								["sub_widgets"] = {
									{["setting_id"] = "mod_option_misc_weapon_dof_strength_scope",
										["type"] = "numeric",
										["default_value"] = .7,
										["range"] = {0, 2},
										["decimals_number"] = 1,
										["tooltip"] = "mod_option_misc_weapon_dof_strength_scope_tooltip",
									},
								},
							},
							{["setting_id"] = "mod_option_misc_weapon_dof_sight",
								["type"] = "checkbox",
								["default_value"] = true,
								["tooltip"] = "mod_option_misc_weapon_dof_sight_tooltip",
								["sub_widgets"] = {
									{["setting_id"] = "mod_option_misc_weapon_dof_strength_sight",
										["type"] = "numeric",
										["default_value"] = .4,
										["range"] = {0, 2},
										["decimals_number"] = 1,
										["tooltip"] = "mod_option_misc_weapon_dof_strength_sight_tooltip",
									},
								},
							},
						},
					},
				},
			},
			{["setting_id"] = "group_crouch_animation",
  				["type"] = "group",
				["sub_widgets"] = {
					{["setting_id"] = "mod_option_crouch_animation",
						["type"] = "checkbox",
						["default_value"] = true,
						["tooltip"] = "mod_option_crouch_animation_tooltip",
					},
				},
			},
			-- {["setting_id"] = "group_sling",
  			-- 	["type"] = "group",
			-- 	["sub_widgets"] = {
			-- 		{["setting_id"] = "mod_option_sling",
			-- 			["type"] = "checkbox",
			-- 			["default_value"] = false,
			-- 			["tooltip"] = "mod_option_sling_tooltip",
			-- 		},
			-- 	},
			-- },
			{["setting_id"] = "group_misc",
  				["type"] = "group",
				["sub_widgets"] = {
					{["setting_id"] = "mod_option_misc_attachment_names",
						["type"] = "checkbox",
						["default_value"] = true,
						["tooltip"] = "mod_option_misc_attachment_names_tooltip",
					},
					{["setting_id"] = "mod_option_keep_packages",
						["type"] = "dropdown",
						["default_value"] = "hub",
						["tooltip"] = "mod_option_keep_packages_tooltip",
						["options"] = {
							{text = "mod_option_keep_packages_off", value = "off"},
							{text = "mod_option_keep_packages_hub", value = "hub"},
							{text = "mod_option_keep_packages_always", value = "always"},
						}
					},
					-- {["setting_id"] = "mod_option_misc_keep_packages_in_hub",
					-- 	["type"] = "checkbox",
					-- 	["default_value"] = true,
					-- 	["tooltip"] = "mod_option_misc_keep_packages_in_hub_tooltip",
					-- },
				},
			},
			{["setting_id"] = "group_debug",
  				["type"] = "group",
				["sub_widgets"] = {
					{["setting_id"] = "mod_option_debug",
						["type"] = "checkbox",
						["default_value"] = false,
						["sub_widgets"] = {
							{["setting_id"] = "test_index",
								["type"] = "keybind",
								["default_value"] = {},
								["keybind_trigger"] = "pressed",
								["keybind_type"] = "function_call",
								["function_name"] = "inc_test_index",
							},
							{["setting_id"] = "test_index_2",
								["type"] = "keybind",
								["default_value"] = {},
								["keybind_trigger"] = "pressed",
								["keybind_type"] = "function_call",
								["function_name"] = "dec_test_index",
							},
							{["setting_id"] = "clear_chat",
								["type"] = "keybind",
								["default_value"] = {},
								["keybind_trigger"] = "pressed",
								["keybind_type"] = "function_call",
								["function_name"] = "clear_chat",
							},
							{["setting_id"] = "load_mission",
								["type"] = "keybind",
								["default_value"] = {},
								["keybind_trigger"] = "pressed",
								["keybind_type"] = "function_call",
								["function_name"] = "load_mission",
							},
						}
					},
				}
			},
		},
	},
}
