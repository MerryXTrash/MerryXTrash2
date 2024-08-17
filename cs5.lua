-- Load the UI library
loadstring(game:HttpGet("https://raw.githubusercontent.com/MerryXTrash/MerryXTrash2/main/UI.lua"))()

-- Create the main window for the hub
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

-- Configure the minimize button
MinimizeButton({
    Image = "rbxassetid://18982309971",
    Size = {55, 55},
    Color = Color3.fromRGB(10, 10, 10),
    Corner = true,
    Stroke = false,
    StrokeColor = Color3.fromRGB(255, 0, 0)
})

-- Create and configure the Classic Mode tab
local classicModeTab = MakeTab({Name = "Classic Mode"})

-- Add Chapter 2 section and button
local chapter2Section = AddSection(classicModeTab, {"Teste"})
SetSection(chapter2Section, "Chapter 2")
AddButton(classicModeTab, {
    Name = "Part 3",
    Callback = function()
        local player = game.Players.LocalPlayer
        if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = CFrame.new(1013.8822021484375, 75.34132385253906, -352.441650390625)
        end
    end
})

-- Create and configure the Settings tab
local settingsTab = MakeTab({Name = "Setting"})

-- Fullbright setting
local fullbrightSection = AddSection(settingsTab, {"Teste"})
SetSection(fullbrightSection, "Fullbright")
AddButton(settingsTab, {
    Name = "Fullbright",
    Callback = function()
        spawn(function()
            local lighting = game.Lighting
            local colorCorrection = Instance.new("ColorCorrectionEffect")
            colorCorrection.Name = "ColorCorrection"
            colorCorrection.Brightness = 0.2
            colorCorrection.Contrast = 0
            colorCorrection.TintColor = Color3.new(1, 1, 1)
            colorCorrection.Parent = lighting
            lighting.ClockTime = 12
            lighting.Ambient = Color3.new(1, 1, 1)
            lighting.Brightness = 10
            colorCorrection.Enabled = true
        end)
    end
})

-- Miscellaneous settings
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
        loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\40\39\104\116\116\112\115\58\47\47\103\105\115\116\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\109\101\111\122\111\110\101\89\84\47\98\102\48\51\55\100\102\102\57\102\48\97\55\48\48\49\55\51\48\52\100\100\100\54\55\102\100\99\100\51\55\48\47\114\97\119\47\101\49\52\101\55\52\1
