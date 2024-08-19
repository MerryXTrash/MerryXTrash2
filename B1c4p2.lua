loadstring(game:HttpGet("https://raw.githubusercontent.com/MerryXTrash/MerryXTrash2/main/UI.lua"))()
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


-- Function to find ProximityPrompts within a certain radius around the player
local function findNearbyProximityPrompts(radius)
    local nearbyPrompts = {}
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    
    for _, obj in pairs(game.Workspace:GetDescendants()) do
        if obj:IsA("ProximityPrompt") then
            local distance = (humanoidRootPart.Position - obj.Parent.Position).Magnitude
            if distance <= radius then
                table.insert(nearbyPrompts, obj)
            end
        end
    end

    return nearbyPrompts
end

-- Function to fire ProximityPrompts
local function fireProximityPrompt(Obj, Amount, Skip)
    if Obj:IsA("ProximityPrompt") then
        local PromptTime = Obj.HoldDuration
        if Skip then
            Obj.HoldDuration = 0
        end
        for i = 1, Amount do
            Obj:InputHoldBegin()
            if not Skip then
                wait(Obj.HoldDuration)
            end
            Obj:InputHoldEnd()
        end
        Obj.HoldDuration = PromptTime
    else
        error("Expected ProximityPrompt object")
    end
end

-- Function to fire all nearby ProximityPrompts
local function fireNearbyProximityPrompts(radius, Amount, Skip)
    local prompts = findNearbyProximityPrompts(radius)
    
    if #prompts > 0 then
        for _, prompt in pairs(prompts) do
            fireProximityPrompt(prompt, Amount, Skip)
        end
    else
        warn("No ProximityPrompts found within the specified radius.")
    end
end

-- Function to handle player movement
function HandlePlayerMovement(player)
    if player and player.Character then
        player.Character:SetCollisionEnabled(false)
    end
end

-- Hook into the game loop or movement event
function OnUpdate()
    local player = game.Players.LocalPlayer
    if player then
        HandlePlayerMovement(player)
    end
end

-- Register the update handler
game:GetService("RunService").RenderStepped:Connect(OnUpdate)

local player = game.Players.LocalPlayer
local camera = game.Workspace.CurrentCamera
local isLookingDown = false

-- Function to make the camera look down
local function lookDown()
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    camera.CFrame = CFrame.new(camera.CFrame.Position, humanoidRootPart.Position - Vector3.new(0, 1, 0))
end

-- Function to reset the camera to its default view
local function resetCamera()
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    camera.CFrame = CFrame.new(camera.CFrame.Position, humanoidRootPart.Position)
end

-- Function to toggle between looking down and normal view
local function toggleCameraView()
    if isLookingDown then
        resetCamera()
    else
        lookDown()
    end
    isLookingDown = not isLookingDown
end

-- Bind the toggle function to a key press (e.g., "L")
local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if not gameProcessedEvent and input.KeyCode == Enum.KeyCode.L then
        toggleCameraView()
    end
end)

-- Function to set HoldDuration of all ProximityPrompts to 0
local function setHoldDurationForAllProximityPrompts()
    for _, instance in pairs(workspace:GetDescendants()) do
        if instance:IsA("ProximityPrompt") then
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
            local offset = Vector3.new(0, 6, 0)
            local newCFrame = v.CFrame + offset
            humanoidRootPart.CFrame = newCFrame
            break
        end
    end
end


local MainTab = MakeTab({Name = "Book 1"})

local section1 = AddSection(MainTab, {"Teste"})
SetSection(section1, "Chapter 4")

AddButton(MainTab, {
    Name = "Auto Butterfly Spirit",
    Callback = function()
        _G.auto = true
        while _G.auto do
            wait(0.2)
            isLookingDown = true
            teleportToBesideButterfly()
            fireNearbyProximityPrompts(15, 1, true)
        end
    end
})

AddButton(MainTab, {
    Name = "Stop Auto Butterfly Spirit",
    Callback = function()
        _G.auto = false
        isLookingDown = false
    end
})

local SettingsTab = MakeTab({Name = "Setting"})

local section2 = AddSection(SettingsTab, {"Teste"})
SetSection(section2, "Fullbright")

AddButton(SettingsTab, {
    Name = "Fullbright",
    Callback = function()
        spawn(function()
            local Time = game.Lighting
            Time.ClockTime = 12
            Time.Ambient = Color3.new(1, 1, 1)
            Time.Brightness = 10
            
            -- ColorCorrection implementation (if used)
            local colorCorrection = Instance.new("ColorCorrectionEffect")
            colorCorrection.Brightness = 0.2
            colorCorrection.Contrast = 0
            colorCorrection.TintColor = Color3.new(1, 1, 1)
            colorCorrection.Parent = game.Lighting
        end)
    end
})

local section3 = AddSection(SettingsTab, {"Teste"})
SetSection(section3, "Misc")

AddButton(SettingsTab, {
    Name = "Infinite Yield",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end
})

AddButton(SettingsTab, {
    Name = "Fly",
    Callback = function()
        loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\40\39\104\116\116\112\115\58\47\47\103\105\115\116\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\109\101\111\122\111\110\101\89\84\47\98\102\48\51\55\100\102\102\57\102\48\97\55\48\48\49\55\51\48\52\100\100\100\54\55\102\100\99\100\51\55\48\47\114\97\119\47\101\49\52\101\55\52\102\52\50\53\98\48\54\48\100\102\53\50\51\51\52\51\99\102\51\48\98\55\56\55\48\55\52\101\98\51\99\53\100\50\47\97\114\99\101\117\115\37\50\53\50\48\120\37\50\53\50\48\102\108\121\37\50\53\50\48\50\37\50\53\50\48\111\98\102\108\117\99\97\116\111\114\39\41\44\116\114\117\101\41\41\40\41\10\10")()
    end
})

AddButton(SettingsTab, {
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
