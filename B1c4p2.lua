-- Function to enable noclip for all parts in Workspace
local function enableNoclipForAllParts()
    local Workspace = game:GetService("Workspace")

    -- Iterate over all parts in Workspace
    for _, part in pairs(Workspace:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false  -- Disable collision for the part
        end
    end
end

-- Call the function to apply noclip to all parts
enableNoclipForAllParts()

local utf8 = {
	["A"] = 0x41,
	["B"] = 0x42,
	["C"] = 0x43,
	["D"] = 0x44,
	["E"] = 0x45,
	["F"] = 0x46,
	["G"] = 0x47,
	["H"] = 0x48,
	["I"] = 0x49,
	["J"] = 0x4A,
	["K"] = 0x4B,
	["L"] = 0x4C,
	["M"] = 0x4D,
	["N"] = 0x4E,
	["O"] = 0x4F,
	["P"] = 0x50,
	["Q"] = 0x51,
	["R"] = 0x52,
	["S"] = 0x53,
	["T"] = 0x54,
	["U"] = 0x55,
	["V"] = 0x56,
	["W"] = 0x57,
	["X"] = 0x58,
	["Y"] = 0x59,
	["Z"] = 0x5A,
}

function pressKey(key, times, delay)
	key = string.upper(key)
	for i = 1, tonumber(times) do
		keypress(utf8[key])
		wait(delay)
	end
end
function clickMouse(which, times, delay)
	local clicks = {
		["1"] = mouse1click,
		["2"] = mouse2click
	}
	local clickfunc = clicks[which]
	for i = 1, times do
		clickfunc()
		wait(delay)
	end
end


-- Function to set HoldDuration of all ProximityPrompts to 0
local function setHoldDurationForAllProximityPrompts()
    -- Iterate over all parts and models in the game
    for _, instance in pairs(workspace:GetDescendants()) do
        -- Check if the instance is a ProximityPrompt
        if instance:IsA("ProximityPrompt") then
            -- Set the HoldDuration to 0
            instance.HoldDuration = 0
        end
    end
end

-- Call the function to update ProximityPrompts
setHoldDurationForAllProximityPrompts()


local function teleportToBesideButterfly()
    local butterflies = game.Workspace:FindFirstChild("Butterflies")
    if not butterflies then
        warn("Butterflies model not found in Workspace.")
        return
    end

    local player = game.Players.LocalPlayer
    if not player then
        warn("LocalPlayer not found.")
        return
    end

    local character = player.Character or player.CharacterAdded:Wait()
    if not character then
        warn("Character not found.")
        return
    end

    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then
        warn("HumanoidRootPart not found in character.")
        return
    end

    for _, v in pairs(butterflies:GetChildren()) do
        if v:IsA("BasePart") and v.Name == "Butterfly" then
            -- Define the offset (e.g., 5 studs to the right)
            local offset = Vector3.new(0, 6, 0)
            
            -- Calculate the new CFrame for the player
            local newCFrame = v.CFrame + offset
            
            -- Teleport the player to the new CFrame
            humanoidRootPart.CFrame = newCFrame
            break
        end
    end
end


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
  Name = "Auto Buttlefly Spirit",
  Callback = function()
     _G.auto = true
while _G.auto do wait()
wait(0.2)
teleportToBesideButterfly()
pressKey("E", 2, 0.1)
end
  end
})

AddButton(Main, {
  Name = "Stop Auto Buttlefly Spirit",
  Callback = function()
     _G.auto = false
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
