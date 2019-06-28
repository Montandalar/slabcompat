--[[group:slab_wood
    Enables default and modded wooden slabs to be used wherever a wooden slab is
    needed.
--]]

-- Re-registrations for ethereal woods
if (minetest.get_modpath("ethereal")) then
    local S = ethereal.intllib

    minetest.log("action", "ethereal detected")
    local props_uninflammable = 
        {choppy = 2, oddly_breakable_by_hand = 1, put_out_fire = 1, slab_wood = 1}
    local props_default =
        {choppy = 2, oddly_breakable_by_hand = 1, flammable = 3, slab_wood = 1}
    local snd = default.node_sound_wood_defaults()

    stairs.register_slab(
        "frost_wood",
        "ethereal:frost_wood",
        props_uninflammable,
        {"frost_wood.png"},
        S("Frost Wood Slab"),
        snd
    )

    stairs.register_slab(
        "yellow_wood",
        "ethereal:yellow_wood",
        props_uninflammable,
        {"yellow_wood.png"},
        S("Healing Wood Slab"),
        snd
    )

    stairs.register_slab(
        "palm_wood",
        "ethereal:palm_wood",
        props_default,
        {"moretrees_palm_wood.png"},
        S("Palm Wood Slab"),
        snd
    )

    stairs.register_slab(
        "birch_wood",
        "ethereal:birch_wood",
        props_default,
        {"moretrees_birch_wood.png"},
        S("Birch Wood Slab"), -- translation call to S() missing in original?,
        snd
    )

    stairs.register_slab(
        "banana_wood",
        "ethereal:banana_wood",
        props_default,
        {"banana_wood.png"},
        S("Banana Wood Slab"),
        snd
    )

    stairs.register_slab(
        "redwood_wood",
        "ethereal:redwood_wood",
        props_default,
        {"redwood_wood.png"},
        S("Redwood Slab"),
        snd
    )

    stairs.register_slab(
        "bamboo_wood",
        "ethereal:bamboo_block",
        {snappy = 3, choppy = 2, oddly_breakable_by_hand = 1, flammable = 3,
        slab_wood = 1},
        {"bamboo_floor.png"},
        S("Bamboo Slab"),
        snd
    )
    
    stairs.register_slab(
        "sakura_wood",
        "ethereal:sakura_wood",
        props_default,
        {"ethereal_sakura_wood.png"},
        S("Sakura Wood Slab"),
        snd
    )
end

-- Re-registrations for minetest_game woods
if (minetest.get_modpath("stairs")) then
    minetest.log("action", "stairs detected")
    local props = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, slab_wood = 1} 
    stairs.register_slab(
        "wood",
        "default:wood",
        props,
        {"default_wood.png"},
        "Wooden Stair",
        "Wooden Slab",
        default.node_sound_wood_defaults()
    )
    for _, v in pairs({"Jungle", "Pine", "Acacia", "Aspen"}) do
        local lower = v:lower() 
        local wood
        if (v == "Jungle") then wood = "" else wood = "_" end
        stairs.register_slab(
            lower.."wood",
            "default:"..lower,
            props,
            {"default_"..lower..wood.."wood.png"},
            v.. " Wood Slab",
            default.node_sound_wood_defaults()
        )
    end
end
