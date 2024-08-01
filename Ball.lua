Ball = {}

function Ball:load()
    self.x = love.math.random(love.graphics.getWidth())
    self.y = love.math.random(love.graphics.getHeight())
    self.radius = 50
    self.score = 0

    -- Create a font with a larger size
    self.font = love.graphics.newFont(36)
    love.graphics.setFont(self.font)
end

function Ball:update()
    local mouseX, mouseY = love.mouse.getPosition()
    local dx = mouseX - self.x
    local dy = mouseY - self.y
    local distance = math.sqrt(dx * dx + dy * dy)
    
    -- Check if the mouse is within the ball's radius and if the mouse is pressed
    if love.mouse.isDown(1) and distance <= self.radius then
        self.score = self.score + 1
        self:randomPosition()
    end
end

function Ball:randomPosition()
    self.x = love.math.random(self.radius, love.graphics.getWidth() - self.radius)
    self.y = love.math.random(self.radius, love.graphics.getHeight() - self.radius)
end

function Ball:draw()
    love.graphics.circle("fill", self.x, self.y, self.radius)
    
    love.graphics.setFont(self.font)
    love.graphics.setColor(1, 1, 1)  -- Set the color to white for the text
    love.graphics.printf("Score: " .. tostring(self.score),  -- Convert score to string
                         0, 
                         50, 
                         love.graphics.getWidth(), 
                         "center")
end
