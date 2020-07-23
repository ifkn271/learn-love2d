flux = require 'flux.flux'
Tween = require 'tween.tween'
require 'checkbox'

l = {
    print = love.graphics.print
}

ball = {
    x = 0,
    y = 0,
    width = 20,
    hight = 20,
    vx = 0,
    vy = 0,
    ax = 0, -- 状态量
    ay = 0, -- 状态量
    tween = nil 
}

box = {
    width = 800,
    hight = 600
}

function love.mousepressed(tx,ty,key)
    if key == 1 then
        ball.tx = love.mouse.getX()
        ball.ty = love.mouse.getY()
        ball.tween = Tween.new(3,ball,{x = ball.tx,y = ball.ty},"inElastic")
    end
end


function love.load()
    love.window.setMode(800, 600)
    ball.x,ball.y = 400,300

end

function love.update(dt)
    --[[if love.mouse.isDown('1') then
        ball.tx = love.mouse.getX()
        ball.ty = love.mouse.getY()
        Tween.new(3,ball,{x = ball.tx,y = ball.ty},"inElastic")
        -- flux.to(ball,5,{x = mouse_x,y = mouse_y})
    end
    ]]--
    ball.tween:update(dt)
end
function love.draw(dt)
    love.graphics.setColor(1,0,0)
    love.graphics.circle('fill',ball.x,ball.y,50)
    l.print(tostring(ball.tx),400,400)
end

