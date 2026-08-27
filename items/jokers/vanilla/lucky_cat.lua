SMODS.Joker({
    key = "lucky_cat",
    rarity = "cry_exotic",
    atlas = "v_atlas_2",

    pos = { x = 0, y = 3 }, -- todo: replace with next index, mariofan do this for me im lazy af
    soul_pos = { x = 2, y = 3, extra = { x = 1, y = 3 } },

    cost = 50,
    order = 1,

    config = { extra = { emult_gain = 0.1, emult = 1.0 } },

    blueprint_compat = true,
    demicoloncompat = true,

    loc_vars = function(_, _, card) return { vars = { card.ability.extra.emult_gain, card.ability.extra.emult } } end,

    calculate = function(_, card, ctx)
        if ctx.cardarea == G.jokers and ctx.before and not ctx.blueprint_card and not ctx.retrigger_joker then
            local conv = #ctx.scoring_hand > 0

            for i = 1, #ctx.scoring_hand do
                ---@type Card
                local scard = ctx.scoring_hand[i]

                if scard.ability.effect ~= "Lucky Card" then scard:set_ability(G.P_CENTERS.m_lucky, nil, true) end
            end

            if conv then return { message = "Lucky!" } end
        end

        if (ctx.individual and ctx.cardarea == G.play and ctx.other_card.lucky_trigger and not ctx.blueprint) or ctx.forcetrigger then
            return SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "emult",
                scalar_value = "emult_gain",
            })
        end

        if ctx.joker_main then return { emult = card.ability.extra.emult } end
    end,
})
