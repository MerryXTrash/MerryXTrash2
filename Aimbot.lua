function gayhod()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/UniversalAimbotUI.lua"))()
end

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Aimbot | ไว้ยิงไก่แอ๋ม", "BloodTheme")

local Tab = Window:NewTab("แอ๋มกากเล่นโปร")
Section:UpdateSection("ล็อคหัวไก่แอ๋ม")
Section:NewButton("กดเพื่อยิงไก่", "UwuUUUu", function()
    gayhod()
end)
