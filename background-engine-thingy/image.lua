local Image = {}

--Image.src = (only needs image name)
--Image.targetSize = {w= , h= } (gets auto defined if not defined by user)

function Image:new()
    local image = {}

    -- image.image = -- the actual image to draw

    setmetatable(image, self)
    self.__index = self
    return image
end

function Image:setup(path)
    if self.src == nil then
        self.image = love.graphics.newImage("errorIMG.jpg")
    else
        self.image = love.graphics.newImage(path.."/"..self.src)
    end

    if not (self.targetSize and self.targetSize.w and self.targetSize.h) then
        self.targetSize = {w = self.image:getWidth(), h = self.image:getHeight()}
    end
end

function Image:draw()
    love.graphics.draw(self.image)
end

return Image