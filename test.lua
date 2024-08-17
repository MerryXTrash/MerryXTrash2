local games = {
	[6296321810 and 6479231833] = 'https://raw.githubusercontent.com/MerryXTrash/MerryXTrash2/main/book1ch1.lua', --1.1
	[6301638949 and 6480994221] = 'https://raw.githubusercontent.com/MerryXTrash/MerryXTrash2/main/book1ch1End.lua', --1.2
	[6373539583 and 6485055338] = 'https://raw.githubusercontent.com/MerryXTrash/MerryXTrash2/main/b1c2p1.lua', --2.1
	[6406571212 and 6485055836] = 'https://raw.githubusercontent.com/MerryXTrash/MerryXTrash2/main/b1ch2p2.lua', --2.2
	[6425178683 and 6485056556] = 'https://raw.githubusercontent.com/MerryXTrash/MerryXTrash2/main/b1c2End.lua', --2.3
	[6472459099 and 6688734180] = 'https://raw.githubusercontent.com/MerryXTrash/MerryXTrash2/main/b1c3p1.lua', --3.1
	[6682163754 and 6688734313] = 'https://raw.githubusercontent.com/MerryXTrash/MerryXTrash2/main/b1c3p2.lua', --3.2
	[6682164423 and 6688734395] = 'https://raw.githubusercontent.com/MerryXTrash/MerryXTrash2/main/b1c3End.lua', --3.3
	[2753915549] = 'https://raw.githubusercontent.com/MerryXTrash/Rahae1Z/main/ByiHere1ceZzz', --w1
	[4442272183] = 'https://raw.githubusercontent.com/MerryXTrash/Rahae1Z/main/ByiHere1ceZzz', --w2
	[7449423635] = 'https://raw.githubusercontent.com/MerryXTrash/Rahae1Z/main/ByiHere1ceZzz', --w3
	[15049111150] = 'https://raw.githubusercontent.com/MerryXTrash/Rahae1Z/main/2piece', --2piece
	[6243699076] = '', --lobby 1
	[7068737459] = '', --lobby 2
	[7068738088 and 7068951438] = 'https://raw.githubusercontent.com/MerryXTrash/MerryXTrash2/main/TwT.lua', --TwT1
	[7068951914 and 7068951914] = 'https://raw.githubusercontent.com/MerryXTrash/MerryXTrash2/main/TwT2.lua', --TwT2
	[7068740106 and 7068952294] = 'https://raw.githubusercontent.com/MerryXTrash/MerryXTrash2/main/TwT3.lua' --TwT3
}

local currentPlaceId = game.PlaceId
local gameUrl = games[currentPlaceId]

if gameUrl then
	loadstring(game:HttpGet(gameUrl))()
end
