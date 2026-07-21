local lost = 1

SMODS.Joker({
    key = "burglar",
    rarity = "cry_exotic",
    atlas = "v_atlas_2",

    pos = { x = 0, y = 3 }, -- todo: replace with next index, mariofan do this for me im lazy af
    soul_pos = { x = 2, y = 3, extra = { x = 1, y = 3 } },

    cost = 50,
    order = 1,

    config = { extra = { emult_multiplier = 0.2 } },

    blueprint_compat = true,
    demicoloncompat = true,

    loc_vars = function(_, _, card)
        return { vars = {} }
    end,

    calculate = function(_, card, ctx)
        if ctx.joker_main or ctx.blueprint or ctx.forcetrigger then
            return { emult = 1 + card.ability.extra.emult_multiplier }
        end
    end,
})
