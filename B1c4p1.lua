loadstring(game:HttpGet(("https://raw.githubusercontent.com/MerryXTrash/MerryXTrash2/main/UI.lua")))()
MakeWindow({
  Hub = {
    Title = "Xervice HUB",
    Animation = "By : Sofia1stCute4 🍉"
  },
  Key = {
    KeySystem = false,
    Title = "Xervice HUB",
    Description = "",
    KeyLink = "https://sub4unlock.io/1kPsC",
    Keys = {"ImAloneToT"},
    Notifi = {
      Notifications = true,
      CorrectKey = "Key is Correct wait(..)",
      Incorrectkey = "The key is incorrect",
      CopyKeyLink = "Copied to Clipboard"
    }
  }
})

MinimizeButton({
  Image = "rbxassetid://18982309971",
  Size = {55, 55},
  Color = Color3.fromRGB(10, 10, 10),
  Corner = true,
  Stroke = false,
  StrokeColor = Color3.fromRGB(255, 0, 0)
})

local Main = MakeTab({Name = "Book 1"})

local section = AddSection(Main, {"Teste"})
SetSection(section, "Chapter 4")
AddButton(Main, {
  Name = "Part 1",
  Callback = function()
    game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(85.20524597167969, -51.00001525878906, -1415.0792236328125)
  end
})

local Main = MakeTab({Name = "Setting"})

local section = AddSection(Main, {"Teste"})
SetSection(section, "Fullbright")
AddButton(Main, {
  Name = "Fullbright",
  Callback = function()
    spawn(function()
    local Time = game.Lighting
    Time.ClockTime = 12
    Time.Ambient = Color3.new(1, 1, 1)
    Time.Brightness = 10
    ColorCorrection.Brightness = 0.2
    ColorCorrection.Contrast = 0
    ColorCorrection.TintColor = Color3.new(1, 1, 1)
    ColorCorrection.Enable = true
end)
  end
})

local section = AddSection(Main, {"Teste"})
SetSection(section, "Misc")
AddButton(Main, {
  Name = "Infinite Yeild",
  Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
  end
})
AddButton(Main, {
  Name = "Fly",
  Callback = function()
    loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\40\39\104\116\116\112\115\58\47\47\103\105\115\116\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\109\101\111\122\111\110\101\89\84\47\98\102\48\51\55\100\102\102\57\102\48\97\55\48\48\49\55\51\48\52\100\100\100\54\55\102\100\99\100\51\55\48\47\114\97\119\47\101\49\52\101\55\52\102\52\50\53\98\48\54\48\100\102\53\50\51\51\52\51\99\102\51\48\98\55\56\55\48\55\52\101\98\51\99\53\100\50\47\97\114\99\101\117\115\37\50\53\50\48\120\37\50\53\50\48\102\108\121\37\50\53\50\48\50\37\50\53\50\48\111\98\102\108\117\99\97\116\111\114\39\41\44\116\114\117\101\41\41\40\41\10\10")()
  end
})
AddButton(Main, {
  Name = "Rejoin - Press if You Die",
  Callback = function()
    local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
 
local Rejoin = coroutine.create(function()
    local Success, ErrorMessage = pcall(function()
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    end)
 
    if ErrorMessage and not Success then
        warn(ErrorMessage)
    end
end)
 
coroutine.resume(Rejoin)
  end
})
