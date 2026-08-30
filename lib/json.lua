local M    = {}
local json = require("json")

--- Serialize the given value into a JSON string.
---@generic T
---@param value T The value to serialize.
---@return string enc The serialized JSON string.
function M.serialize(value)
    return json.encode(value)
end

--- Deserialize the given JSON string into a value.
---@generic T
---@param enc string The JSON string.
---@return T dec The deserialized value.
function M.deserialize(enc)
    return json.decode(enc)
end

return M
