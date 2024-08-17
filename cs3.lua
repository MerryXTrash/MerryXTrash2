-- Load the UI script
loadstring(game:HttpGet("https://raw.githubusercontent.com/MerryXTrash/MerryXTrash2/main/UI.lua"))()

-- Create the window
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
            CorrectKey = "Key is Correct, wait...",
            IncorrectKey = "The key is incorrect",
            CopyKeyLink = "Copied to Clipboard"
        }
    }
})

-- Minimize Button settings
MinimizeButton({
    Image = "rbxassetid://18982309971",
    Size = {55, 55},
    Color = Color3.fromRGB(10, 10, 10),
    Corner = true,
    Stroke = false,
    StrokeColor = Color3.fromRGB(255, 0, 0)
})

-- Classic Mode Tab
local classicModeTab = MakeTab({Name = "Classic Mode"})
local classicSection = AddSection(classicModeTab, {"Teste"})
SetSection(classicSection, "Chapter 2")
AddButton(classicModeTab, {
    Name = "Part 1",
    Callback = function()
        local player = game.Players.LocalPlayer
        if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = CFrame.new(64.74767303466797, 60.94379806518555, -1622.5250244140625)
        end
    end
})

-- Settings Tab
local settingsTab = MakeTab({Name = "Setting"})

-- Fullbright Setting
local fullbrightSection = AddSection(settingsTab, {"Teste"})
SetSection(fullbrightSection, "Fullbright")
AddButton(settingsTab, {
    Name = "Fullbright",
    Callback = function()
        spawn(function()
            local lighting = game.Lighting
            local colorCorrection = Instance.new("ColorCorrectionEffect", lighting)
            colorCorrection.Name = "ColorCorrection"
            lighting.ClockTime = 12
            lighting.Ambient = Color3.new(1, 1, 1)
            lighting.Brightness = 10
            colorCorrection.Brightness = 0.2
            colorCorrection.Contrast = 0
            colorCorrection.TintColor = Color3.new(1, 1, 1)
            colorCorrection.Enabled = true
        end)
    end
})

-- Miscellaneous Settings
local miscSection = AddSection(settingsTab, {"Teste"})
SetSection(miscSection, "Misc")

-- Infinite Yield Button
AddButton(settingsTab, {
    Name = "Infinite Yield",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end
})

-- Fly Button
AddButton(settingsTab, {
    Name = "Fly",
    Callback = function()
        -- Assuming the encoded Fly script is correct
        loadstring(game:HttpGet('https://raw.githubusercontent.com/MerryXTrash/MerryXTrash2/main/FlyScript.lua'))()
    end
})

-- Rejoin Button
AddButton(settingsTab, {
    Name = "Rejoin - Press if You Die",
    Callback = function()
        local teleportService = game:GetService("TeleportService")
        local players = game:GetService("Players")
        local localPlayer = players.LocalPlayer

        local rejoin = coroutine.create(function()
            local success, errorMessage = pcall(function()
                teleportService:Teleport(game.PlaceId, localPlayer)
            end)

            if not success and errorMessage then
                warn(errorMessage)
            end
        end)

        coroutine.resume(rejoin)
    end
})
