---------------------------------------------------------------------------------------------------
-- -= ImageLayer =-
---------------------------------------------------------------------------------------------------
-- Setup
TILED_LOADER_PATH = TILED_LOADER_PATH or ({...})[1]:gsub("[%.\\/][Ii]mage[Ll]ayer$", "") .. '.'
local love = love
local unpack = unpack
local pairs = pairs
local ipairs = ipairs
local ImageLayer = {class = "ImageLayer"}
ImageLayer.__index = ImageLayer

---------------------------------------------------------------------------------------------------
-- Creates and returns a new ImageLayer
function ImageLayer:new(name, image, prop, visible)
    
    -- Create a new table for our object layer and do some error checking.
    local layer = setmetatable({}, ImageLayer)
    
    layer.name = name or "Unnamed ImageLayer"   -- The name of this layer
    layer.image = image                         -- Image
    layer.properties = prop or {}               -- Properties set by Tiled.
    layer.visible = visible                     -- If false then the layer will not be drawn
    
    -- Return the new object layer
    return layer
end

---------------------------------------------------------------------------------------------------
-- Draws the image
function ImageLayer:draw()

    -- Early exit if the layer is not visible.
    if not self.visible then return end

    love.graphics.draw(self.image)
end


return ImageLayer
