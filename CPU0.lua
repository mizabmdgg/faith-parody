-- assign variables
video = gdt.VideoChip0
pad = gdt.DPad0
led = gdt.Led0

player = {}
player.x = 10
player.y = 10

demon = {}
demon.x = 50
demon.y = 50
demon.wid = 55
demon.heg = 55

cross = false

function update() 
	video:Clear(color.black)-- update the screen

	walk()

	crossf()
	
	video:DrawRect(vec2(0,0), vec2(63,63), color.white)-- draw border
	
	demn()
	
		border() -- use border
end

function border() -- code of border
	if player.width >= 63 or player.height >= 63 or player.x <= 0 or player.y <= 0 then
			player.x = player.x - pad.X/100
			player.y = player.y + pad.Y/100
			
	end
end

function crossf() -- code of cross (not working yet)

if gdt.LedButton0.ButtonState == true then cross = true else cross = false end
video:DrawRect(vec2(player.x,player.y),vec2(player.width,player.height),color.blue)
	if cross == true then	video:FillRect(vec2(player.width-1, player.height-1), vec2(player.x+1,player.y+1), color.yellow) else video:FillRect(vec2(player.width-1, player.height-1), vec2(player.x+1,player.y+1), color.black) end

end

function walk() -- code of walk

	player.x = player.x + pad.X/100
	player.y = player.y - pad.Y/100
	player.width = player.x + 5
	player.height = player.y + 5

end 

function demn () -- code of demon

video:DrawRect(vec2(demon.x,demon.y),vec2(demon.wid,demon.heg), color.red) -- draw demon

dpd = math.ceil( (math.pow(demon.x - player.x,2)) + (math.pow(demon.y - player.y, 2)))/9 -- find the distance

if dpd < 3 and dpd < 9 then led.State = true -- player collision with demon
			player.x = player.x - pad.X/100					
			player.y = player.y + pad.Y/100

end
end

-- sorry for the small number of comments, I'm from Ukraine and I don't know English well and lua, but i'm learning