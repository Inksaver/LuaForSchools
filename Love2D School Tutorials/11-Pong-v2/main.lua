WIDTH = love.graphics.getWidth()
HEIGHT = love.graphics.getHeight()

function collides(rect1, rect2)
	--[[ check whether rectangles are NOT colliding ]]
	
	-- if left side of rect1 is beyond rect2 right side
	-- OR left side of rect2 is beyond rect1 right side
	if rect1.x > rect2.x + rect2.w or rect2.x > rect1.x + rect1.w then
		return false
	end
	-- if top side of rect1 is beyond bottom of rect2
	-- OR top side of rect2 is beyond bottom of rect1
	if rect1.y > rect2.y + rect2.h or rect2.y > rect1.y + rect1.h then
		return false
	end
	
	-- code only gets this far if both if statements above fail 
	return true
end

function love.load()
	-- set variables for left paddle in a table
	--[[
	-------------------------------------------------------------
	|         tables of variables for paddles and ball          |
	-------------------------------------------------------------
	|   name  |x position | y position | width | height | speed |
	-------------------------------------------------------------
	| paddleL |     10    |     260    |   15  |   80   |   10  |
	-------------------------------------------------------------
	| paddleR | WIDTH - 25|     260    |   15  |   80   |   10  |
	-------------------------------------------------------------
	|   ball  | WIDTH/2-5 | HEIGHT/2-5 |   10  |   10   |    5  |
	-------------------------------------------------------------
	]]
	paddleL = {}
	paddleL.x = 10 			-- start 10 pixels in from left edge
	paddleL.y = 260			-- start 260 pixels down from top
	paddleL.w = 15			-- paddle is 15 pixels wide
	paddleL.h = 80			-- paddle is 80 pixels tall
	paddleL.speed = 10
	
	-- set variables for right paddle in a table
	paddleR = {}
	paddleR.x = WIDTH - 25	-- start 10 pixels from the right edge (10 + width of paddle)
	paddleR.y = 260
	paddleR.w = 15
	paddleR.h = 80
	paddleR.speed = 10
	
	-- set variables for ball in a table
	ball = {}
	ball.x = WIDTH / 2 - 5	-- start in centre of the screen (half of WIDTH minus ball width)
	ball.y = HEIGHT / 2 - 5	-- start in centre of the screen (half of HEIGHT minus ball height)
	ball.w = 10
	ball.h = 10
	ball.speedx = math.random(-5, 5)
	ball.speedy = math.random(-2, 2)
end

function love.update(dt)
	-- w and s keys control left paddle
	if love.keyboard.isDown('w') then -- move left paddle up
		paddleL.y = math.max(0, paddleL.y - paddleL.speed)
	elseif love.keyboard.isDown('s') then -- move left paddle down
		paddleL.y = math.min(HEIGHT - paddleL.h, paddleL.y + paddleL.speed)
	end
	
	-- up and down keys control right paddle
	if love.keyboard.isDown('up') then -- move right paddle up
		paddleR.y = math.max(0, paddleR.y - paddleR.speed)
	elseif love.keyboard.isDown('down') then -- move right paddle down
		paddleR.y = math.min(HEIGHT - paddleR.h, paddleR.y + paddleR.speed)
	end
	
	ball.x = ball.x + ball.speedx
	ball.y = ball.y + ball.speedy
	if ball.x < 0 or ball.x > WIDTH then -- if ball has hit the edge of the screen, put it back in the centre
		ball.x = WIDTH / 2 - ball.w / 2
	end
	if ball.y < 0 or ball.y > HEIGHT - ball.h then
		ball.speedy = ball.speedy * -1
	end
	
	if collides(ball, paddleR) then			-- has the ball hit the right paddle?
		ball.speedx = ball.speedx * -1		-- reverse the direction right -> left
		-- alter the vertical speed between 1 and 2 randomly in the same direction
		if ball.speedy < 0 then
			ball.speedy = -math.random(-2, 2)
		else
			ball.speedy = math.random(-2, 2)
		end
	elseif	collides(ball, paddleL) then 	-- has the ball hit the right paddle?
		ball.speedx = math.abs(ball.speedx)	-- reverse the direction left -> right
		if ball.speedy < 0 then
			ball.speedy = -math.random(-2, 2)
		else
			ball.speedy = math.random(-2, 2)
		end
	end
end

function love.draw()
	love.graphics.clear(0.18, 0.16, 0.2)	-- clear screen with a dark grey colour
	love.graphics.rectangle('fill', paddleL.x, paddleL.y, paddleL.w, paddleL.h)	-- draw left paddle
	love.graphics.rectangle('fill', paddleR.x, paddleR.y, paddleR.w, paddleR.h)	-- draw right paddle
	love.graphics.rectangle('fill', ball.x, ball.y, ball.w, ball.h)				-- draw ball
end
