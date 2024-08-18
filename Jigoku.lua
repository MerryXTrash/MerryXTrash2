-- Load UI Library
loadstring(game:HttpGet("https://raw.githubusercontent.com/MerryXTrash/MerryXTrash2/main/UI.lua"))()

-- Create Main Window
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
            CorrectKey = "Key is Correct, please wait...",
            IncorrectKey = "The key is incorrect",
            CopyKeyLink = "Copied to Clipboard"
        }
    }
})

-- Configure Minimize Button
MinimizeButton({
    Image = "rbxassetid://18982309971",
    Size = {55, 55},
    Color = Color3.fromRGB(10, 10, 10),
    Corner = true,
    Stroke = false,
    StrokeColor = Color3.fromRGB(255, 0, 0)
})

-- Create Main Tab
local Main = MakeTab({Name = "Jigoku"})

-- Button to Enter Zone and Trigger Prompts
AddButton(Main, {
    Name = "Enter Zone",
    Callback = function()
        local player = game.Players.LocalPlayer
        player.Character.HumanoidRootPart.CFrame = CFrame.new(609.1366, 17.5699, 1087.6727)
        wait(2)
        player.Character.HumanoidRootPart.CFrame = CFrame.new(601.8018, 111.0565, 836.9151)
        wait(0.1)

        -- Fire all proximity prompts
        local function updateAllProximityPrompts()
    -- Loop through all objects in the game
    for _, object in ipairs(workspace:GetDescendants()) do
        -- Check if the object is a ProximityPrompt
        if object:IsA("ProximityPrompt") then
            -- Set HoldDuration to 0
            object.HoldDuration = 0
        end
    end
end

-- Call the function to update all ProximityPrompts
updateAllProximityPrompts()
})

-- Button to Trigger All Prompts
AddButton(Main, {
    Name = "Prompts",
    Callback = function()
        for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
            if v:IsA("ProximityPrompt") then
                v.HoldDuration = 0
                if v.Parent and v.Parent:IsA("BasePart") then
                    v:Fire()
                end
            end
        end
    end
})

-- Auto Orb Collection
AddButton(Main, {
    Name = "Auto Correct Orb",
    Callback = function()
        -- LocalScript in StarterPlayerScripts or another client-side location

_G.AutoOrb = true
local heightOffset = 4
local cameraDistance = 10  -- Adjust these values as needed
local cameraHeight = 5

local camera = workspace.CurrentCamera
local isCameraLocked = false

-- Function to toggle camera lock
local function toggleCameraLock()
    isCameraLocked = not isCameraLocked
    if isCameraLocked then
        camera.CameraType = Enum.CameraType.Scriptable
    else
        camera.CameraType = Enum.CameraType.Custom
    end
end

-- Function to update the camera position
local function updateCamera(targetPosition)
    if isCameraLocked then
        local cameraPosition = targetPosition + Vector3.new(0, cameraHeight, -cameraDistance)
        camera.CFrame = CFrame.new(cameraPosition, targetPosition)
    end
end

-- Function to auto-press the "E" key
local function autoPressE()
    local virtualInputManager = game:GetService("VirtualInputManager")
    virtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
    wait(0.1)
    virtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
end

-- Main loop
while _G.AutoOrb do
    wait(0.3)
    local player = game.Players.LocalPlayer
    local character = player and player.Character
    local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

    if humanoidRootPart then
        local orbs = game:GetService("Workspace"):FindFirstChild("GameAI") and game.Workspace.GameAI:FindFirstChild("Souls")
        if orbs then
            local orbFound = false
            for _, v in pairs(orbs:GetChildren()) do
                if v.Name == "Orb" then
                    if v:IsA("BasePart") or (v:IsA("Model") and v.PrimaryPart) then
                        local targetCFrame = v:IsA("BasePart") and v.CFrame or v.PrimaryPart.CFrame
                        humanoidRootPart.CFrame = targetCFrame + Vector3.new(0, heightOffset, 0)
                        updateCamera(targetCFrame.Position)  -- Update camera position
                        orbFound = true
                        autoPressE()  -- Auto-press "E" key
                        wait(0.1)
                        break
                    end
                end
            end

            if not orbFound then
                humanoidRootPart.CFrame = CFrame.new(601.8018, 111.0565, 836.9151)
            end
        end
    end
end
})

-- Create Settings Tab
local Settings = MakeTab({Name = "Settings"})

-- Fullbright Feature
AddButton(Settings, {
    Name = "Fullbright",
    Callback = function()
        spawn(function()
            local Time = game.Lighting
            Time.ClockTime = 12
            Time.Ambient = Color3.new(1, 1, 1)
            Time.Brightness = 10
            local ColorCorrection = game.Lighting:FindFirstChildOfClass("ColorCorrectionEffect") or Instance.new("ColorCorrectionEffect", game.Lighting)
            ColorCorrection.Brightness = 0.2
            ColorCorrection.Contrast = 0
            ColorCorrection.TintColor = Color3.new(1, 1, 1)
            ColorCorrection.Enabled = true
        end)
    end
})

-- Miscellaneous Utilities
AddButton(Settings, {
    Name = "Infinite Yield",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end
})

AddButton(Settings, {
    Name = "Fly",
    Callback = function()
        loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\40\39\104\116\116\112\115\58\47\47\103\105\115\116\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\109\101\111\122\111\110\101\89\84\47\98\102\48\51\55\100\102\102\57\102\48\97\55\48\48\49\55\51\48\52\100\100\100\54\55\102\100\99\100\51\55\48\47\114\97\119\47\101\49\52\101\55\52\102\52\50\53\98\48\54\48\100\102\53\50\51\51\52\51\99\102\51\48\98\55\56\55\48\55\52\101\98\51\99\53\100\50\47\97\114\99\101\117\115\37\50\53\50\48\120\37\50\53\50\48\102\108\121\37\50\53\50\48\50\37\50\53\50\48\111\98\102\108\117\99\97\116\111\114\39\41\44\116\114\117\101\41\41\40\41\10\10")()
    end
})

AddButton(Settings, {
    Name = "Rejoin - Press if You Die",
    Callback = function()
        local TeleportService = game:GetService("TeleportService")
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer

        local function rejoinGame()
            local Success, ErrorMessage = pcall(function()
                TeleportService:Teleport(game.PlaceId, LocalPlayer)
            end)

            if not Success then
                warn("Failed to teleport: " .. tostring(ErrorMessage))
            end
        end

        rejoinGame()
    end
})
