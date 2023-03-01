
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
	video:Clear(color.black)

	walk()

	crossf()
	
	video:DrawRect(vec2(0,0), vec2(63,63), color.white)
	
	demn()
	
		border()
end

function border()
	if player.width >= 63 or player.height >= 63 or player.x <= 0 or player.y <= 0 then
			player.x = player.x - pad.X/100
			player.y = player.y + pad.Y/100
			
	end
end

function crossf()

if gdt.LedButton0.ButtonState == true then cross = true else cross = false end
video:DrawRect(vec2(player.x,player.y),vec2(player.width,player.height),color.blue)
	if cross == true then	video:FillRect(vec2(player.width-1, player.height-1), vec2(player.x+1,player.y+1), color.yellow) else video:FillRect(vec2(player.width-1, player.height-1), vec2(player.x+1,player.y+1), color.black) end

end

function walk()

	player.x = player.x + pad.X/100
	player.y = player.y - pad.Y/100
	player.width = player.x + 5
	player.height = player.y + 5

end 

function demn ()

video:DrawRect(vec2(demon.x,demon.y),vec2(demon.wid,demon.heg), color.red)
--print(player.y - demon.y + player.x - demon.x)

dpd = math.ceil( (math.pow(demon.x - player.x,2)) + (math.pow(demon.y - player.y, 2)))/9

	--if dpd < 0 or dpd < -0 then
if dpd < 3 and dpd < 9 then led.State = true
			player.x = player.x - pad.X/100					
			player.y = player.y + pad.Y/100

end
print(dpd)
end