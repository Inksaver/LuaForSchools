WIDTH = love.graphics.getWidth()
HEIGHT = love.graphics.getHeight()
anim8 = require('anim8')
sound = love.audio.newSource('assets/Chicken Sound Effect.mp3','static')

function love.load()
	bg = love.graphics.newImage("assets/MistyForest.jpg")
	-- 94 x 89 16 images
	chick = {}
	chick.x = 0
	chick.y = 500
	chick.image = love.graphics.newImage("assets/chicken.png")
	chick.grid = anim8.newGrid(94, 89, 377, 356) --width of each frame, height of each frame, width of atlas, height of atlas
	chick.animation = anim8.newAnimation(chick.grid('1-4',1, '1-4',2, '1-4',3, '1-4',4), 0.1) -- frames 1-4 on row 1,etc
end

function love.update(dt)
    chick.animation:update(dt)
	chick.x = chick.x + 150 * dt
	--chick.y = chick.y - 1
	if chick.x > 300 and chick.x < 800 then
		love.audio.play(sound)
		chick.y = chick.y - 30 * dt 
	else
		chick.y = chick.y + 40 * dt
	end
	if chick.x > WIDTH  then
		chick.x = 0
		chick.y = 500
	end
end

function love.draw()
	love.graphics.draw(bg,0 ,0)
	-- Animation:draw(image, x, y, r, sx, sy, ox, oy, kx, ky)
	chick.animation:draw(chick.image, chick.x, chick.y, nil, nil, nil, nil , nil)
end
