---@class AscEventBase
---@field func?        fun(...: any): boolean?
---@field blocking?    boolean
---@field blockable?   boolean
---@field delay?       number
---@field timer?       "REAL" | "TOTAL" | string
---@field start_timer? boolean
---@field no_delete?   boolean
---@field pause_force? boolean

---@class AscEventStd: AscEventBase
---@field trigger? "immediate" | "after" | "before"

---@class AscEventCond: AscEventBase
---@field trigger   "condition"
---@field ref_table table<string, any>
---@field ref_value string
---@field stop_val  any

---@class AscEventEase: AscEventBase
---@field trigger   "ease"
---@field ref_table table<string, any>
---@field ref_value string
---@field ease_to   number
---@field ease?     "lerp" | "elastic" | "quad"

---@alias AscEvent AscEventStd | AscEventCond | AscEventEase

---@class AscEventProto
---@overload fun(e: AscEvent): AscEvent
local AscEvent = setmetatable({}, { __index = AscEvent, __call = function(_, e) return e end })

function AscEvent:register()
    G.E_MANAGER:add_event(Event(self))
end

Ascensio.Event = AscEvent
