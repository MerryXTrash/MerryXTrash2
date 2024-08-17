local games = {
    [6296321810] = 'https://raw.githubusercontent.com/MerryXTrash/TheMimic.lua/main/Krampus_exe/Book1Ch1', --1.1
    [6301638949] = 'https://raw.githubusercontent.com/MerryXTrash/TheMimic.lua/main/Krampus_exe/Book1chapter1.2', --1.2
    [6373539583] = 'https://raw.githubusercontent.com/MerryXTrash/TheMimic.lua/main/Book1ch2/Book1ch2.1', --2.1
    [6406571212] = 'https://raw.githubusercontent.com/MerryXTrash/TheMimic.lua/main/Book1ch2/Book1ch2.2', --2.2
    [6425178683] = 'https://raw.githubusercontent.com/MerryXTrash/TheMimic.lua/main/Book1ch2/Book1ch2.3', --2.3
    [6472459099] = 'https://raw.githubusercontent.com/MerryXTrash/TheMimic.lua/main/Book1ch3/Book1ch3.1', --3.1
    [6682163754] = 'https://raw.githubusercontent.com/MerryXTrash/TheMimic.lua/main/Book1ch3/Book1ch3.2', --3.2
    [6682164423] = 'https://raw.githubusercontent.com/MerryXTrash/TheMimic.lua/main/Book1ch3/Book1ch3.3', --3.3
    [2753915549] = 'https://raw.githubusercontent.com/MerryXTrash/Rahae1Z/main/ByiHere1ceZzz', --w1
    [4442272183] = 'https://raw.githubusercontent.com/MerryXTrash/Rahae1Z/main/ByiHere1ceZzz', --w2
    [7449423635] = 'https://raw.githubusercontent.com/MerryXTrash/Rahae1Z/main/ByiHere1ceZzz', --w3
    [15049111150] = 'https://raw.githubusercontent.com/MerryXTrash/Rahae1Z/main/2piece', --2piece
    [6243699076] = '', --lobby 1
    [7068737459] = '', --lobby 2
    [7068738088] = '', --TwT1
    [7068951914] = '', --TwT2
    [7068740106] = '', --TwT3
}

local currentPlaceId = game.PlaceId
local gameUrl = games[currentPlaceId]

if gameUrl then
    loadstring(game:HttpGet(gameUrl))()
end
