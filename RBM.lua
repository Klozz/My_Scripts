--date 28-05-2011
prism={obj=model.load("obj/prism.obj"),w = 10,h=10,d=20,pos={x=4,y=6} }

cube={obj=model.load("obj/cube.obj"),w = 10,h=10,d=10}

minicube={obj=model.load("obj/minicube.obj"),w = 10,h=5,d=10}

objs={prism,cube,minicube} objs.current=3

pos={x=0,y=0,z=0}
rot={x=0,y=0,z=0}

init={pos={x=-49,y=15,z=-88},rot={x=38,y=-0,z=0}}

map={
{"","g","g","g","g","g","g","g"},
{"g","g","g","g","g","g","g","g"},
{"g","c","g","g","c","g","g","g"},
{"g","g","g","g","g","g","g","g"},
{"g","g","g","g","g","g","g","g"},
{"g","g","g","g","g","g","g","g"},
{"g","g","g","g","g","g","g","g"}
}


--world.perspective(75,16/9,20,1000);
while true do
draw.fillrect(0,0,480,272,color.new(255,255,255))
controls.read()

if controls.press("down") then prism.pos.y = math.min(prism.pos.y +1,#map) end
if controls.press("up") then prism.pos.y = math.max(prism.pos.y -1,1) end
if controls.press("right") then prism.pos.x = math.min(prism.pos.x +1,#map[prism.pos.y]) end
if controls.press("left") then prism.pos.x = math.max(prism.pos.x -1,1) end
if controls.l() then init.pos.z=init.pos.z-1 end
if controls.r() then init.pos.z=init.pos.z+1 end

--if controls.square() then init.rot.y=init.rot.y-1 end
--if controls.circle() then init.rot.y=init.rot.y+1 end
if controls.triangle() then init.rot.x=init.rot.x+1 end
if controls.cross() then init.rot.x=init.rot.x-1 end
if controls.analogx()>100 then init.pos.x=init.pos.x+1 end
if controls.analogx()<-100 then init.pos.x=init.pos.x-1 end
if controls.analogy()>100 then init.pos.y=init.pos.y-1 end
if controls.analogy()<-100 then init.pos.y=init.pos.y+1 end

if controls.start() then init.pos,init.rot = {x=-49,y=15,z=-88},{x=38,y=-0,z=0} end --reset model


for z = #map, 1,-1 do
 for x = 1, #map[z] do
 		local x1 = init.pos.x + x*minicube.w
		local y1 = init.pos.y + (math.sin(math.rad(-init.rot.x))*minicube.w)*(z-1)
		local z1 = init.pos.z + (math.cos(math.rad(-init.rot.x))*minicube.w)*(z-1)
	if map[z][x] == "g" then	
		minicube.obj:rotation(math.rad(init.rot.x),math.rad(init.rot.y),math.rad(init.rot.z));
		minicube.obj:position(x1,y1,z1);
		minicube.obj:blit()
	elseif map[z][x] == "c" then
		local x2 = x1
		local y2 = y1
		local z2 = z1 
		cube.obj:rotation(math.rad(init.rot.x),math.rad(init.rot.y),math.rad(init.rot.z));
		cube.obj:position(x2,y2,z2);
		cube.obj:blit()
	end
	if z == prism.pos.y and x == prism.pos.x then
		local x2 = x1
		local y2 = y1
		local z2 = z1
		prism.obj:rotation(math.rad(init.rot.x),math.rad(init.rot.y),math.rad(init.rot.z));
		prism.obj:position(x2,y2,z2);
		prism.obj:blit()
	end
 end
end

screen.print(5,5,"Pos: "..init.pos.x..":"..init.pos.y..":"..init.pos.z.."   Rot: "..init.rot.x.." : "..init.rot.y.." : "..init.rot.z)
screen.print(400,5,screen.fps())
if controls.select() then a() end
screen.flip()
end



