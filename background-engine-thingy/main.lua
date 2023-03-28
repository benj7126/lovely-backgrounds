local sets = {}

local curSet = "Test"

-- set should contain the following when i get there
--[[
local images = {} -- contains all kinds of images (animated and whatever else im gonna aad)

local particles = {} -- settings n stuff, use as refference to spawn particles in activeParticles
]]--

local activeParticles = {}

local setFiles = love.filesystem.getDirectoryItems("Sets")

for _, setName in pairs(setFiles) do
    sets[setName] = {images = {}, particels = {}}

    local setContent = love.filesystem.getDirectoryItems("Sets/"..setName)

    for _, contentName in pairs(setContent) do
        print(contentName)

        isImage = love.filesystem.getInfo("Sets/"..setName.."/"..contentName.."/".."image.lua")
        if isImage then
            local chunk = love.filesystem.load("Sets/"..setName.."/"..contentName.."/".."image.lua")
            local image = chunk()

            image:setup("Sets/"..setName.."/"..contentName)

            table.insert(sets[setName].images, image)
        end

        isParticle = love.filesystem.getInfo("Sets/"..setName.."/"..contentName.."/".."particle.lua")
    end
end

function love.draw()
    for _, image in pairs(sets[curSet].images) do
        image:draw()
    end
end