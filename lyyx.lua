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

-- Caminar sobre el agua (optimizando todas tus posiciones)
MiscSection:NewButton("Walk On Water", "Crear plataformas invisibles", function()
    local posiciones = {
        Vector3.new(11, -9, 78),
        Vector3.new(-110, -9, -999),
        Vector3.new(-110, -9, 1999),
        Vector3.new(-110, -9, -1999),
        Vector3.new(-110, -9, 2999),
        Vector3.new(-110, -9, -3999),
        Vector3.new(-110, -9, 4999),
        Vector3.new(-110, -9, -5999),
        Vector3.new(-110, -9, -6999),
        Vector3.new(-110, -9, -7999),
        Vector3.new(-110, -9, -8999),
        Vector3.new(-110, -9, -9999),
        Vector3.new(-8922.48, -9.84, -6233.65),
        Vector3.new(-3072.01, -9.64, -6136.02),
        Vector3.new(-5100.05, -9.21, -5128.03),
        Vector3.new(-7096.39, -9.78, -6403.66),
        Vector3.new(-9882.70, -9.63, -5228.53),
        Vector3.new(-7888.44, -9.20, -4648.04),
        Vector3.new(-9873.09, -9.26, -6775.55),
        Vector3.new(-8453.76, -9.26, -7212.89),
        Vector3.new(-6483.57, -9.26, -9055.90),
        Vector3.new(1009.69, -9.11, 1046.96),
        Vector3.new(2178.02, -9.09, 287.15),
        Vector3.new(1416.96, -9.90, 2066.50),
        Vector3.new(1687.23, -9.25, 5069.81),
        Vector3.new(1655.41, -9.04, 6056.37),
        Vector3.new(1945.24, -9.39, 8507.65),
        Vector3.new(2895.56, -9.35, -2546.12),
        Vector3.new(6886.39, -9.50, -3488.15),
        Vector3.new(10812.92, -9.64, -3987.93),
        Vector3.new(14800.76, -9.78, -4368.71),
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
