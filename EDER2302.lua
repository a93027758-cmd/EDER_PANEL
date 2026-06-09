-- // EDER2302 PANEL FASE BETA | Echo también por TOCINACIO23021
-- ADVERTENCIA: Viola los Términos de Servicio de Roblox. Úsalo bajo tu propia responsabilidad.

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local GuiService = game:GetService("GuiService")

local player = Players.LocalPlayer
local jugador = player.Name
local dispositivo = UserInputService.TouchEnabled and "📱 Celular" or "💻 PC"

-- ==================== PANTALLA DE CLAVE ====================
local keyGui = Instance.new("ScreenGui")
keyGui.Name = "KeySystem"
keyGui.ResetOnSpawn = false
keyGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
keyGui.Parent = player:WaitForChild("PlayerGui")

local keyFrame = Instance.new("Frame")
keyFrame.Size = UDim2.new(1, 0, 1, 0)
keyFrame.BackgroundColor3 = Color3.new(0.05, 0.05, 0.08)
keyFrame.BorderSizePixel = 0
keyFrame.Parent = keyFrame.Parent

-- Fondo decorativo
local keyGradient = Instance.new("UIGradient")
keyGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(15, 20, 35)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(5, 8, 18))
}
keyGradient.Rotation = 45
keyGradient.Parent = keyFrame

local keyTitle = Instance.new("TextLabel")
keyTitle.Size = UDim2.new(0.8, 0, 0.15, 0)
keyTitle.Position = UDim2.new(0.1, 0, 0.2, 0)
keyTitle.BackgroundTransparency = 1
keyTitle.Text = "🔑 INSERTA LA KEY"
keyTitle.TextColor3 = Color3.fromRGB(120, 230, 255)
keyTitle.TextSize = 32
keyTitle.Font = Enum.Font.GothamBold
keyTitle.Parent = keyFrame

-- Botón cerrar
local closeKeyBtn = Instance.new("TextButton")
closeKeyBtn.Size = UDim2.new(0, 120, 0, 40)
closeKeyBtn.Position = UDim2.new(0.5, -60, 0.75, 0)
closeKeyBtn.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
closeKeyBtn.Text = "❌ CERRAR"
closeKeyBtn.TextColor3 = Color3.new(1, 1, 1)
closeKeyBtn.TextSize = 16
closeKeyBtn.Font = Enum.Font.GothamBold
closeKeyBtn.BorderSizePixel = 0
closeKeyBtn.Parent = keyFrame
Instance.new("UICorner", closeKeyBtn).CornerRadius = UDim.new(0, 8)
Instance.new("UIStroke", closeKeyBtn).Thickness = 1
Instance.new("UIStroke", closeKeyBtn).Color = Color3.fromRGB(255, 120, 120)

local keyBox = Instance.new("TextBox")
keyBox.Size = UDim2.new(0.6, 0, 0.07, 0)
keyBox.Position = UDim2.new(0.2, 0, 0.4, 0)
keyBox.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
keyBox.PlaceholderText = "Escribe la clave aquí..."
keyBox.Text = ""
keyBox.TextColor3 = Color3.new(1,1,1)
keyBox.TextSize = 18
keyBox.Font = Enum.Font.GothamSemibold
keyBox.BorderSizePixel = 0
keyBox.Parent = keyFrame
Instance.new("UICorner", keyBox).CornerRadius = UDim.new(0, 10)
Instance.new("UIStroke", keyBox).Thickness = 1.5
Instance.new("UIStroke", keyBox).Color = Color3.fromRGB(90, 180, 255)

local keyLinkBtn = Instance.new("TextButton")
keyLinkBtn.Size = UDim2.new(0.35, 0, 0.06, 0)
keyLinkBtn.Position = UDim2.new(0.15, 0, 0.55, 0)
keyLinkBtn.BackgroundColor3 = Color3.fromRGB(40, 120, 220)
keyLinkBtn.Text = "🔗 KEY LINK"
keyLinkBtn.TextColor3 = Color3.new(1,1,1)
keyLinkBtn.TextSize = 16
keyLinkBtn.Font = Enum.Font.GothamBold
keyLinkBtn.BorderSizePixel = 0
keyLinkBtn.Parent = keyFrame
Instance.new("UICorner", keyLinkBtn).CornerRadius = UDim.new(0, 8)
Instance.new("UIStroke", keyLinkBtn).Thickness = 1
Instance.new("UIStroke", keyLinkBtn).Color = Color3.fromRGB(120, 200, 255)

local verifyBtn = Instance.new("TextButton")
verifyBtn.Size = UDim2.new(0.35, 0, 0.06, 0)
verifyBtn.Position = UDim2.new(0.5, 0, 0.55, 0)
verifyBtn.BackgroundColor3 = Color3.fromRGB(30, 180, 80)
verifyBtn.Text = "✅ VERIFY KEY"
verifyBtn.TextColor3 = Color3.new(1,1,1)
verifyBtn.TextSize = 16
verifyBtn.Font = Enum.Font.GothamBold
verifyBtn.BorderSizePixel = 0
verifyBtn.Parent = keyFrame
Instance.new("UICorner", verifyBtn).CornerRadius = UDim.new(0, 8)
Instance.new("UIStroke", verifyBtn).Thickness = 1
Instance.new("UIStroke", verifyBtn).Color = Color3.fromRGB(120, 255, 180)

local keyStatus = Instance.new("TextLabel")
keyStatus.Size = UDim2.new(0.8, 0, 0.05, 0)
keyStatus.Position = UDim2.new(0.1, 0, 0.65, 0)
keyStatus.BackgroundTransparency = 1
keyStatus.Text = ""
keyStatus.TextColor3 = Color3.fromRGB(255, 100, 100)
keyStatus.TextSize = 15
keyStatus.Font = Enum.Font.Gotham
keyStatus.Parent = keyFrame

closeKeyBtn.MouseButton1Click:Connect(function() keyGui:Destroy() end)

keyLinkBtn.MouseButton1Click:Connect(function()
    setclipboard("https://chat.whatsapp.com/Cn5IwKTTcsf49PushVJ3LX")
    keyStatus.TextColor3 = Color3.fromRGB(100, 255, 150)
    keyStatus.Text = "✅ Enlace copiado al portapapeles"
    task.wait(2) keyStatus.Text = ""
end)

local claveCorrecta = "EDER23021"
verifyBtn.MouseButton1Click:Connect(function()
    if keyBox.Text == claveCorrecta then
        keyStatus.TextColor3 = Color3.fromRGB(100, 255, 150)
        keyStatus.Text = "✅ Clave correcta! Cargando..."
        task.wait(1) keyGui:Destroy() cargarPantallaCarga()
    else
        keyStatus.TextColor3 = Color3.fromRGB(255, 100, 100)
        keyStatus.Text = "❌ Clave incorrecta. Intenta nuevamente"
        keyBox.Text = ""
    end
end)

-- ==================== PANTALLA DE CARGA ====================
function cargarPantallaCarga()
    local loadingGui = Instance.new("ScreenGui")
    loadingGui.Name = "LoadingScreen"
    loadingGui.ResetOnSpawn = false
    loadingGui.Parent = player:WaitForChild("PlayerGui")

    local loadingFrame = Instance.new("Frame")
    loadingFrame.Size = UDim2.new(1,0,1,0)
    loadingFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
    loadingFrame.Parent = loadingGui

    local loadGradient = Instance.new("UIGradient")
    loadGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(15, 20, 35)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(5, 8, 18))
    }
    loadGradient.Rotation = 90
    loadGradient.Parent = loadingFrame

    local titleLoad = Instance.new("TextLabel")
    titleLoad.Size = UDim2.new(0.9,0,0.2,0)
    titleLoad.Position = UDim2.new(0.05,0,0.25,0)
    titleLoad.BackgroundTransparency = 1
    titleLoad.Text = "Cargando EDER2302 PANEL FASE BETA | Echo también por TOCINACIO23021"
    titleLoad.TextColor3 = Color3.fromRGB(100, 200, 255)
    titleLoad.TextSize = 26
    titleLoad.Font = Enum.Font.GothamBold
    titleLoad.TextWrapped = true
    titleLoad.Parent = loadingFrame

    local progressBar = Instance.new("Frame")
    progressBar.Size = UDim2.new(0.6,0,0,20)
    progressBar.Position = UDim2.new(0.2,0,0.55,0)
    progressBar.BackgroundColor3 = Color3.fromRGB(20, 25, 40)
    progressBar.Parent = loadingGui
    Instance.new("UICorner", progressBar).CornerRadius = UDim.new(0,10)
    Instance.new("UIStroke", progressBar).Thickness = 1
    Instance.new("UIStroke", progressBar).Color = Color3.fromRGB(80, 150, 220)

    local progressFill = Instance.new("Frame")
    progressFill.Size = UDim2.new(0,0,1,0)
    progressFill.BackgroundColor3 = Color3.fromRGB(80, 200, 255)
    progressFill.Parent = progressBar
    Instance.new("UICorner", progressFill).CornerRadius = UDim.new(0,10)
    local fillGradient = Instance.new("UIGradient")
    fillGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(80, 200, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(120, 230, 255))
    }
    fillGradient.Parent = progressFill

    local percentLabel = Instance.new("TextLabel")
    percentLabel.Size = UDim2.new(1,0,0,30)
    percentLabel.Position = UDim2.new(0,0,0.65,0)
    percentLabel.BackgroundTransparency = 1
    percentLabel.Text = "0%"
    percentLabel.TextColor3 = Color3.fromRGB(200,200,200)
    percentLabel.TextSize = 20
    percentLabel.Font = Enum.Font.Gotham
    percentLabel.Parent = loadingFrame

    for i = 1, 100 do
        percentLabel.Text = i .. "%"
        progressFill.Size = UDim2.new(i/100, 0, 1, 0)
        task.wait(0.03)
    end

    task.wait(0.5) loadingGui:Destroy() crearMenuPrincipal()
end

-- ==================== MENÚ PRINCIPAL ====================
function crearMenuPrincipal()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "Eder2302Panel"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = player:WaitForChild("PlayerGui")

    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 450, 0, 680)
    mainFrame.Position = UDim2.new(0.5, -225, 0.5, -340)
    mainFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
    mainFrame.Active = true
    mainFrame.Draggable = true
    mainFrame.Parent = screenGui
    Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 16)
    local mainStroke = Instance.new("UIStroke")
    mainStroke.Thickness = 2
    mainStroke.Color = Color3.fromRGB(90, 190, 255)
    mainStroke.Parent = mainFrame
    local mainGradient = Instance.new("UIGradient")
    mainGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 35)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(18, 18, 25))
    }
    mainGradient.Rotation = 90
    mainGradient.Parent = mainFrame

    local title = Instance.new("TextLabel")
    title.Size = UDim

   


            
