-- Cargar librería Kavo UI
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

-- Crear ventana principal
local Window = Library.CreateLib("Lyyx V1", "DarkTheme")

-- ================== MAIN TAB ==================
local Main = Window:NewTab("Main")
local Section = Main:NewSection("Brawl")

-- God Mode Toggle
local godModeToggle = false
Section:NewToggle("God Mode (Brawl)", "Auto join brawl rápido", function(State)
    godModeToggle = State
    if State then
        task.spawn(function()
            while godModeToggle do
                game:GetService("ReplicatedStorage").rEvents.brawlEvent:FireServer("joinBrawl")
                task.wait(0)
            end
        end)
    end
end)

-- Auto Join Brawl
local autoJoinToggle = false
Section:NewToggle("Auto Join Brawl", "Entrar siempre al brawl", function(State)
    autoJoinToggle = State
    if State then
        task.spawn(function()
            while autoJoinToggle do
                game:GetService("ReplicatedStorage").rEvents.brawlEvent:FireServer("joinBrawl")
                task.wait(2)
            end
        end)
    end
end)

-- ================== MISC TAB ==================
local Misc = Window:NewTab("Misc")
local MiscSection = Misc:NewSection("Extras")

-- Quitar portales de publicidad
MiscSection:NewButton("Destroy Ad Teleport", "Elimina portales de publicidad", function()
    local part = workspace:FindFirstChild("RobloxForwardPortals")
    if part then part:Destroy() end
end)

-- Caminar sobre el agua
MiscSection:NewButton("Walk On Water", "Crear plataformas invisibles", function()
    local posiciones = {
        Vector3.new(11, -9, 78),
        Vector3.new(-110, -9, -999),
        Vector3.new(-110, -9, 1999),
    }
    for _, pos in ipairs(posiciones) do
        local WalkPart = Instance.new("Part")
        WalkPart.Parent = workspace
        WalkPart.Anchored = true
        WalkPart.Size = Vector3.new(20000, 0, 20000)
        WalkPart.Position = pos
        WalkPart.Transparency = 1
    end
end)
