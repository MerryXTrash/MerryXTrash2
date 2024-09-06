local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local Show = loadstring(game:HttpGet("https://raw.githubusercontent.com/MerryXTrash/Vscose/main/Toggle.lua"))()

local folder = Instance.new("Folder")
folder.Name = "HighlightsFolder"
folder.Parent = game.Workspace

-- สร้าง Highlight แม่แบบ
local highlightTemplate = Instance.new("Highlight")
highlightTemplate.Name = "HighlightTemplate"
highlightTemplate.Enabled = true
highlightTemplate.FillTransparency = 0.5
highlightTemplate.OutlineTransparency = 0
highlightTemplate.Parent = folder

-- ฟังก์ชันในการตั้งค่า Highlight สำหรับ Mob
local function setupHighlightForMob(mob)
    local mobHighlight = highlightTemplate:Clone()
    mobHighlight.Name = "MobESP"
    mobHighlight.FillColor = Color3.fromRGB(255, 0, 0)
    mobHighlight.FillTransparency = 0.8
    mobHighlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    mobHighlight.Parent = mob
end

-- ฟังก์ชันในการตั้งค่า Highlight สำหรับ Player
local function setupHighlightForPlayer(player)
    local character = player.Character or player.CharacterAdded:Wait()
    local playerHighlight = highlightTemplate:Clone()
    playerHighlight.Name = "PlayerESP"
    playerHighlight.FillColor = Color3.fromRGB(0, 0, 255)
    playerHighlight.FillTransparency = 0.5
    playerHighlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    playerHighlight.Parent = character
end

local Window = Fluent:CreateWindow({
    Title = "The Mimic | Book 1 Chapter 1",
    SubTitle = "by JajaEngkubb",
    TabWidth = 160,
    Size = UDim2.fromOffset(460, 300),
    Acrylic = true,
    Theme = "Amethyst",
    MinimizeKey = Enum.KeyCode.One
})

local Tabs = {
    Log = Window:AddTab({ Title = "Update Log", Icon = "hash" }),
    General = Window:AddTab({ Title = "General", Icon = "align-left" }),
    ESP = Window:AddTab({ Title = "Visual", Icon = "eye" }),
    Misc = Window:AddTab({ Title = "Miscellaneous", Icon = "layout-grid" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

do
    Fluent:Notify({
        Title = "JajaCutecute",
        Content = "Thank you for using my script <3",
        SubContent = "ขอบคุณที่ใช้สคริปต์น่ะค่ะ จุ๊บๆ <3",
        Duration = 5
    })

    Tabs.Log:AddParagraph({
        Title = "+ Add",
        Content = "Jigoku Event"
    })

    Tabs.Log:AddParagraph({
        Title = "+ Add",
        Content = "Visual"
    })

    Tabs.General:AddParagraph({
        Title = "Book 1",
        Content = "Chapter 1"
    })

    Tabs.General:AddButton({
        Title = "Skip",
        Description = "Continue",
        Callback = function()
            Window:Dialog({
                Title = "Skip",
                Content = "Do you want to skip this Part?",
                Buttons = {
                    {
                        Title = "Yes",
                        Callback = function()
                            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3507.028564453125, 43.13663864135742, -1541.9735107421875)
                        end
                    },
                    {
                        Title = "No",
                        Callback = function()
                            print("Dialog cancelled.")
                        end
                    }
                }
            })
        end
    })

        Tabs.ESP:AddButton({
        Title = "Monster ESP",
        Description = "Show Monster ESP",
        Callback = function()
            Window:Dialog({
                Title = "Monster ESP",
                Content = "Do you want to show monster esp?",
                Buttons = {
                    {
                        Title = "Yes",
                        Callback = function()
                            for i,v in pairs(game:GetService("Workspace").GameAI:Getdescendandt()) do
    if Is:A("Model") then
        setupHighlightForMob(v)
    end
end 
                        end
                    },
                    {
                        Title = "No",
                        Callback = function()
                            print("Dialog cancelled.")
                        end
                    }
                }
            })
        end
    })

    Tabs.Misc:AddButton({
        Title = "Fullbright",
        Description = "If you're scared of the dark",
        Callback = function()
            Window:Dialog({
                Title = "Fullbright",
                Content = "Do you want to enable Fullbright?",
                Buttons = {
                    {
                        Title = "Yes",
                        Callback = function()
                            local Lighting = game.Lighting
                            Lighting.ClockTime = 12
                            Lighting.Brightness = 2
                            Lighting.FogEnd = 100000
                            Lighting.GlobalShadows = false
                            Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
                        end
                    },
                    {
                        Title = "No",
                        Callback = function()
                            print("Fullbright not enabled.")
                        end
                    }
                }
            })
        end
    })
    
    Tabs.ESP:AddButton({
        Title = "Player ESP",
        Description = "Show Player ESP",
        Callback = function()
            Window:Dialog({
                Title = "Player ESP",
                Content = "Do you want to enable Player ESP?",
                Buttons = {
                    {
                        Title = "Yes",
                        Callback = function()
                            local function setupHighlightForPlayer(player)
                                -- Example highlight setup
                                local highlight = Instance.new("Highlight")
                                highlight.Parent = player.Character
                                highlight.Adornee = player.Character
                                highlight.FillColor = Color3.fromRGB(0, 0, 255)  -- Set fill color to blue
                            end

                            local Players = game.Players
                            for _, player in pairs(Players:GetPlayers()) do
                                setupHighlightForPlayer(player)
                            end

                            -- Function to handle new players
                            Players.PlayerAdded:Connect(function(player)
                                player.CharacterAdded:Connect(function(character)
                                    setupHighlightForPlayer(player)
                                end)
                            end)
                        end
                    },
                    {
                        Title = "No",
                        Callback = function()
                            print("Player ESP not enabled.")
                        end
                    }
                }
            })
        end
    })

    SaveManager:SetLibrary(Fluent)
    SaveManager:IgnoreThemeSettings()
    SaveManager:SetIgnoreIndexes({})
    SaveManager:SetFolder("FluentScriptHub/specific-game")
    SaveManager:BuildConfigSection(Tabs.Settings)

    Window:SelectTab(1)

    Fluent:Notify({
        Title = "จ๊ะจ๊าเองจ้า",
        Content = "ใช้สคริปต์ระวังโดนแบนกันด้วยน้าา",
        Duration = 5
    })

    SaveManager:LoadAutoloadConfig()
end
