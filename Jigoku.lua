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

-- Function to simulate key press
local function simulateKeyPress(keyCode)
    local inputObject = Instance.new("InputObject")
    inputObject.UserInputType = Enum.UserInputType.Keyboard
    inputObject.KeyCode = keyCode
    inputObject.InputType = Enum.InputType.Keyboard
    inputObject.InputState = Enum.UserInputState.Begin

    -- Send the input
    game:GetService("UserInputService").InputBegan:Fire(inputObject)
    wait(0.1) -- Small delay to simulate key press duration
    inputObject.InputState = Enum.UserInputState.End
    game:GetService("UserInputService").InputEnded:Fire(inputObject)
end

-- Settings for teleportation
local teleportOffset = Vector3.new(0, 7, 0)  -- Default offset above the orb
local waitTime = 0.1  -- Default wait time between teleportations

-- Function to teleport player to the highest Orb (above its head) and fire ProximityPrompt
local function teleportToHighestOrbAboveHead()
    local player = game.Players.LocalPlayer
    local character = player and player.Character
    local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

    if not humanoidRootPart then
        warn("HumanoidRootPart not found!")
        return
    end

    while _G.Auto do
        local highestOrb = nil
        local highestY = -math.huge

        for _, v in pairs(workspace.GameAI.Souls:GetChildren()) do
            if v.Name == "Orb" then
                if v:IsA("BasePart") or (v:IsA("Model") and v.PrimaryPart) then
                    local orbPosition = v:IsA("BasePart") and v.Position or v.PrimaryPart.Position
                    if orbPosition.Y > highestY then
                        highestY = orbPosition.Y
                        highestOrb = v
                    end
                else
                    warn(v.Name .. " does not have a CFrame or PrimaryPart.")
                end
            end
        end

        if highestOrb then
            local orbPosition = highestOrb:IsA("BasePart") and highestOrb.Position or highestOrb.PrimaryPart.Position
            humanoidRootPart.CFrame = CFrame.new(orbPosition + teleportOffset)

            wait(0.1) -- Small wait to ensure the player is teleported properly

            if (humanoidRootPart.Position - orbPosition).magnitude <= 5 then
                -- Simulate key press
                simulateKeyPress(Enum.KeyCode.E)

                -- Fire proximity prompts if near
                for _, prompt in pairs(workspace:GetDescendants()) do
                    if prompt:IsA("ProximityPrompt") then
                        local part = prompt.Parent
                        if part and part:IsA("BasePart") and (part.Position - humanoidRootPart.Position).magnitude <= 10 then
                            prompt.HoldDuration = 0
                            prompt:Fire()
                        end
                    end
                end
            end
        else
            humanoidRootPart.CFrame = CFrame.new(601.8018, 111.0565, 836.9151) -- Fallback position
        end

        wait(waitTime) -- Adjust wait time between each loop iteration based on settings
    end
end

-- Button to Start Auto Teleport to Highest Orbs Above Head
AddButton(Main, {
    Name = "Auto Orbs",
    Callback = function()
        _G.Auto = true
        spawn(function()
            while _G.Auto do
                        wait(0.1)
                pcall(function()
                    teleportToHighestOrbAboveHead()
                    simulateKeyPress(Enum.KeyCode.E)
                end)
            end
        end)
    end
})

-- Button to Stop Auto Teleport to Orbs
AddButton(Main, {
    Name = "Stop Auto Orbs",
    Callback = function()
        _G.Auto = false
    end
})

-- Button to Fire All ProximityPrompts in a Loop
AddButton(Main, {
    Name = "Loop Fire Prompts",
    Callback = function()
        _G.FireLoop = true
            while _G.FireLoop do
                wait(0.1)
                for _, v in pairs(workspace:GetDescendants()) do
                    if v:IsA("ProximityPrompt") then
                        v.HoldDuration = 0
                        if v.Parent and v.Parent:IsA("BasePart") then
                            v:Fire()
                        end
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
