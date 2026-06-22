local forcetrigger = nil

---@diagnostic disable-next-line undefined-global
if Spectrallib then
    forcetrigger = function(this, card, ctx)
        ---@diagnostic disable-next-line undefined-global
        Spectrallib.forcetrigger({
            card = card,
            message = localize("cry_demicolon"),
            colour = G.C.RARITY.cry_exotic,
            message_card = this,
            context = ctx,
            silent = ctx.forcetrigger,
        })
    end
else
    forcetrigger = function(_, card, ctx)
        return Cryptid.forcetrigger(card, ctx)
    end
end

SMODS.Joker({
    key = "demicolon",
    rarity = "cry_exotic",
    atlas = "c_atlas_1",
    blueprint_compat = true,
    demicoloncompat = true,
    pos = { x = 6, y = 5 },
    soul_pos = { x = 8, y = 5, extra = { x = 7, y = 5 } },
    immutable = true,

    config = { check = nil },

    cost = 50,

    calculate = function(_, card, context)
        if (context.joker_main or context.forcetrigger) and not context.blueprint then
            local marker = -1
            local ft = {}

            for i = 1, #G.jokers.cards do
                if marker ~= -1 and Cryptid.demicolonGetTriggerable(G.jokers.cards[i])[1] then
                    ft[#ft + 1] = G.jokers.cards[i]
                end

                if G.jokers.cards[i] == card then
                    marker = i
                end
            end

            for _, joker in pairs(ft) do
                forcetrigger(card, joker, context)
            end

            return {
                message = localize("cry_demicolon"),
                colour = G.C.RARITY.cry_exotic,
                sound = "cry_demitrigger",
            }
        end
    end,

    asc_credits = {
        idea = { "Rhelvetican" },
        art = { "???" },
        code = { "Rhelvetican" },
    },
})
