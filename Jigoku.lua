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

-- Function to create BodyGyro and BodyVelocity for flying
local function setupFlying(character)
    if not character or not character:FindFirstChild("HumanoidRootPart") then return end

    local humanoidRootPart = character.HumanoidRootPart
    local bodyGyro = Instance.new("BodyGyro", humanoidRootPart)
    local bodyVelocity = Instance.new("BodyVelocity", humanoidRootPart)

    bodyGyro.MaxTorque = Vector3.new(4000, 4000, 4000)
    bodyGyro.CFrame = humanoidRootPart.CFrame
    bodyGyro.P = 3000

    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
    bodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
end

-- Function to remove BodyGyro and BodyVelocity
local function removeFlying(character)
    if not character then return end

    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then return end

    local bodyGyro = humanoidRootPart:FindFirstChildOfClass("BodyGyro")
    local bodyVelocity = humanoidRootPart:FindFirstChildOfClass("BodyVelocity")

    if bodyGyro then bodyGyro:Destroy() end
    if bodyVelocity then bodyVelocity:Destroy() end
end

-- Auto Fire ProximityPrompts When Near
local function autoFireProximityPrompts()
    local player = game.Players.LocalPlayer
    local character = player.Character
    local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

    if not humanoidRootPart then
        return
    end

    local detectionRadius = 10  -- Adjust this value based on how close you want to be to the prompt

    while true do
        wait(0.3)  -- Adjust the check frequency as needed

        local proximityPrompts = workspace:GetDescendants()
        for _, obj in pairs(proximityPrompts) do
            if obj:IsA("ProximityPrompt") and obj.Parent and obj.Parent:IsA("BasePart") then
                local part = obj.Parent
                local distance = (humanoidRootPart.Position - part.Position).magnitude

                if distance <= detectionRadius then
                    obj:Fire()

                    -- Set up flying if the orb is found
                    if obj.Parent.Name == "Orb" then
                        setupFlying(character)
                        -- Optionally adjust velocity or other flying parameters
                        local bodyVelocity = humanoidRootPart:FindFirstChildOfClass("BodyVelocity")
                        if bodyVelocity then
                            bodyVelocity.Velocity = Vector3.new(0, 50, 0)  -- Adjust the velocity as needed
                        end
                    end
                end
            end
        end
    end
end

-- Toggle for Auto Proximity Prompt Firing and Flying
local autoProximityPromptToggle = false

local function startAutoProximityPrompt()
    spawn(autoFireProximityPrompts)
end

local function stopAutoProximityPrompt()
    -- Note: To actually stop the function, you might need to use a more complex approach, such as using a flag or coroutine.
end

AddToggle(Main, {
    Name = "Auto Fire Proximity Prompts with Flying",
    Callback = function(state)
        autoProximityPromptToggle = state
        if autoProximityPromptToggle then
            startAutoProximityPrompt()
        else
            stopAutoProximityPrompt()
            -- Remove BodyGyro and BodyVelocity if toggle is off
            local character = game.Players.LocalPlayer.Character
            removeFlying(character)
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
