-- Ensure UI Library is loaded
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
            for _, object in ipairs(workspace:GetDescendants()) do
                if object:IsA("ProximityPrompt") then
                    object.HoldDuration = 0
                end
            end
        end

        updateAllProximityPrompts()
    end
})

-- Button to Trigger All Prompts
AddButton(Main, {
    Name = "Prompts",
    Callback = function()
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("ProximityPrompt") then
                v.HoldDuration = 0
                if v.Parent and v.Parent:IsA("BasePart") then
                    v:Fire()
                end
            end
        end
    end
})

-- Toggle for Auto Orb Collection
local autoOrbToggle = false

local function startAutoOrbCollection()
    _G.AutoOrb = true
    local heightOffset = 4
    local cameraDistance = 10
    local cameraHeight = 5
    local anchorHeight = 4 -- Height above the orb to anchor the player

    local camera = workspace.CurrentCamera
    local isCameraLocked = false

    local function toggleCameraLock()
        isCameraLocked = not isCameraLocked
        if camera then
            camera.CameraType = isCameraLocked and Enum.CameraType.Scriptable or Enum.CameraType.Custom
        end
    end

    local function updateCamera(targetPosition)
        if isCameraLocked and camera then
            local cameraPosition = targetPosition + Vector3.new(0, cameraHeight, -cameraDistance)
            camera.CFrame = CFrame.new(cameraPosition, targetPosition)
        end
    end

    local function autoPressE()
        local virtualInputManager = game:GetService("VirtualInputManager")
        virtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
        wait(0.1)
        virtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
    end

    local function fireProximityPromptsIfNear()
        local player = game.Players.LocalPlayer
        local character = player and player.Character
        local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

        if humanoidRootPart then
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("ProximityPrompt") then
                    local part = v.Parent
                    if part and part:IsA("BasePart") then
                        local distance = (part.Position - humanoidRootPart.Position).magnitude
                        if distance <= 10 then -- Adjust the distance threshold as needed
                            v.HoldDuration = 0
                            v:Fire()
                        end
                    end
                end
            end
        end
    end

    spawn(function()
        while _G.AutoOrb do
            wait(0.3) -- Adjust the wait time if needed
            local player = game.Players.LocalPlayer
            local character = player and player.Character
            local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

            if humanoidRootPart then
                local orbs = workspace:FindFirstChild("GameAI") and workspace.GameAI:FindFirstChild("Souls")
                if orbs then
                    local orbFound = false
                    for _, v in pairs(orbs:GetChildren()) do
                        if v.Name == "Orb" then
                            local targetCFrame = v:IsA("BasePart") and v.CFrame or v.PrimaryPart.CFrame
                            humanoidRootPart.CFrame = targetCFrame * CFrame.new(0, anchorHeight, 0)
                            updateCamera(targetCFrame.Position)
                            orbFound = true
                            autoPressE()
                            fireProximityPromptsIfNear()
                            wait(0.1) -- Adjust if needed
                            break
                        end
                    end

                    if not orbFound then
                        humanoidRootPart.CFrame = CFrame.new(601.8018, 111.0565, 836.9151)
                    end
                else
                    warn("Orbs container not found!")
                end
            else
                warn("HumanoidRootPart not found!")
            end
        end
    end)
end

local function stopAutoOrbCollection()
    _G.AutoOrb = false
end

AddToggle(Main, {
    Name = "Auto Correct Orb",
    Callback = function(state)
        autoOrbToggle = state
        if autoOrbToggle then
            startAutoOrbCollection()
        else
            stopAutoOrbCollection()
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
            local ColorCorrection = Time:FindFirstChildOfClass("ColorCorrectionEffect") or Instance.new("ColorCorrectionEffect", Time)
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
        loadstring(game:HttpGet('https://raw.githubusercontent.com/SomeRepo/YourFlyScript.lua'))()
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
