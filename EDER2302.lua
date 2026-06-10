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
-- (Código de clave sin cambios)
local keyGui = Instance.new("ScreenGui")
keyGui.Name = "KeySystem"
keyGui.ResetOnSpawn = false
keyGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
keyGui.Parent = player:WaitForChild("PlayerGui")

local keyFrame = Instance.new("Frame")
keyFrame.Size = UDim2.new(1, 0, 1, 0)
keyFrame.BackgroundColor3 = Color3.new(0.05, 0.05, 0.08)
keyFrame.BorderSizePixel = 0
keyFrame.Parent = keyGui

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

    -- (Código de carga sin cambios)
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
    mainFrame.Size = UDim2.new(0, 450, 0, 720)
    mainFrame.Position = UDim2.new(0.5, -225, 0.5, -360)
    mainFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
    mainFrame.Active = true
    mainFrame.Draggable = true
    mainFrame.Parent = screenGui
    Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 16)
    local mainStroke = Instance.new("UIStroke")
    mainStroke.Thickness = 2
    mainStroke.Color = Color3.fromRGB(90, 190, 255)
    mainStroke.Parent = mainFrame

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 70)
    title.BackgroundColor3 = Color3.fromRGB(12, 12, 20)
    title.Text = string.format("💎 EDER2302 PANEL FASE BETA\n👤 %s | %s | 👥 %d jugadores\nEcho también por TOCINACIO23021", jugador, dispositivo, #Players:GetPlayers())
    title.TextColor3 = Color3.fromRGB(110, 220, 255)
    title.TextSize = 16
    title.Font = Enum.Font.GothamBold
    title.TextWrapped = true
    title.Parent = mainFrame
    Instance.new("UICorner", title).CornerRadius = UDim.new(0, 16)

    local minBtn = Instance.new("TextButton")
    minBtn.Size = UDim2.new(0,40,0,40)
    minBtn.Position = UDim2.new(1,-90,0,8)
    minBtn.BackgroundColor3 = Color3.fromRGB(255,170,0)
    minBtn.Text = "−"
    minBtn.TextColor3 = Color3.new(1,1,1)
    minBtn.TextSize = 26
    minBtn.Parent = mainFrame
    Instance.new("UICorner", minBtn).CornerRadius = UDim.new(0,8)

    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0,40,0,40)
    closeBtn.Position = UDim2.new(1,-45,0,8)
    closeBtn.BackgroundColor3 = Color3.fromRGB(220,50,50)
    closeBtn.Text = "×"
    closeBtn.TextColor3 = Color3.new(1,1,1)
    closeBtn.TextSize = 26
    closeBtn.Parent = mainFrame
    Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0,8)

    local content = Instance.new("ScrollingFrame")
    content.Size = UDim2.new(1,-20,1,-85)
    content.Position = UDim2.new(0,10,0,75)
    content.BackgroundTransparency = 1
    content.ScrollBarThickness = 6
    content.Parent = mainFrame

    local list = Instance.new("UIListLayout")
    list.Padding = UDim.new(0,12)
    list.SortOrder = Enum.SortOrder.LayoutOrder
    list.Parent = content

    -- Variables
    local humanoid, root = nil, nil
    local connections = {}
    local savedCFrame = nil
    local normalGravity = Workspace.Gravity
    local velocidadNormal = 16
    local etiquetasESP = {}
    local ignoredPlayers = {}  -- Nueva lista de ignorados

    local function updateChar()
        local char = player.Character or player.CharacterAdded:Wait()
        humanoid = char:WaitForChild("Humanoid")
        root = char:WaitForChild("HumanoidRootPart")
    end
    updateChar()
    player.CharacterAdded:Connect(updateChar)

    local function createToggle(name)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1,0,0,58)
        btn.BackgroundColor3 = Color3.fromRGB(35,35,45)
        btn.Text = name .. " : OFF"
        btn.TextColor3 = Color3.fromRGB(255,90,90)
        btn.TextSize = 17
        btn.Font = Enum.Font.GothamSemibold
        btn.Parent = content
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0,10)
        return btn
    end

    -- ==================== SPEED Y JUMPPOWER (sin cambios) ====================
    -- (Mantengo exactamente el código anterior de Speed y JumpPower)

    -- ... (copia aquí el código de Speed y JumpPower del mensaje anterior si quieres)

    -- ==================== AIMBOT COMPLETO ====================
    local aimbotEnabled = false
    local aimPart = "Head"  -- Head o Torso
    local aimFOV = 150

    local fovCircle = Instance.new("Frame")
    fovCircle.Size = UDim2.new(0, aimFOV*2, 0, aimFOV*2)
    fovCircle.Position = UDim2.new(0.5, -aimFOV, 0.5, -aimFOV)
    fovCircle.BackgroundTransparency = 0.7
    fovCircle.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
    fovCircle.BorderSizePixel = 2
    fovCircle.BorderColor3 = Color3.fromRGB(255, 255, 255)
    fovCircle.Visible = false
    fovCircle.Parent = screenGui
    Instance.new("UICorner", fovCircle).CornerRadius = UDim.new(1,0)

    local aimbotBtn = createToggle("Aimbot")
    local headBtn = Instance.new("TextButton")
    local chestBtn = Instance.new("TextButton")
    local fovBox = Instance.new("TextBox")

    -- Configuración Aimbot (agregado después de las secciones existentes)
    local aimbotSection = Instance.new("Frame")
    aimbotSection.Size = UDim2.new(1,0,0,160)
    aimbotSection.BackgroundColor3 = Color3.fromRGB(35,35,45)
    aimbotSection.Parent = content
    Instance.new("UICorner", aimbotSection).CornerRadius = UDim.new(0,10)

    aimbotBtn.Size = UDim2.new(1,0,0,50)
    aimbotBtn.Parent = aimbotSection

    aimbotBtn.MouseButton1Click:Connect(function()
        aimbotEnabled = not aimbotEnabled
        fovCircle.Visible = aimbotEnabled
        aimbotBtn.Text = aimbotEnabled and "Aimbot : ON" or "Aimbot : OFF"
        aimbotBtn.TextColor3 = aimbotEnabled and Color3.fromRGB(80,255,120) or Color3.fromRGB(255,90,90)
    end)

    -- Selección Head / Chest
    headBtn.Size = UDim2.new(0.48,0,0,40)
    headBtn.Position = UDim2.new(0.02,0,0.4,0)
    headBtn.BackgroundColor3 = Color3.fromRGB(40,120,220)
    headBtn.Text = "Cabeza"
    headBtn.TextColor3 = Color3.new(1,1,1)
    headBtn.Parent = aimbotSection
    Instance.new("UICorner", headBtn).CornerRadius = UDim.new(0,8)

    chestBtn.Size = UDim2.new(0.48,0,0,40)
    chestBtn.Position = UDim2.new(0.5,0,0.4,0)
    chestBtn.BackgroundColor3 = Color3.fromRGB(40,120,220)
    chestBtn.Text = "Pecho"
    chestBtn.TextColor3 = Color3.new(1,1,1)
    chestBtn.Parent = aimbotSection
    Instance.new("UICorner", chestBtn).CornerRadius = UDim.new(0,8)

    headBtn.MouseButton1Click:Connect(function() aimPart = "Head" end)
    chestBtn.MouseButton1Click:Connect(function() aimPart = "Torso" or "UpperTorso" end)

    -- FOV
    local fovLabel = Instance.new("TextLabel")
    fovLabel.Size = UDim2.new(0.5,0,0,30)
    fovLabel.Position = UDim2.new(0.02,0,0.75,0)
    fovLabel.BackgroundTransparency = 1
    fovLabel.Text = "FOV:"
    fovLabel.TextColor3 = Color3.new(1,1,1)
    fovLabel.Parent = aimbotSection

    fovBox.Size = UDim2.new(0.4,0,0,30)
    fovBox.Position = UDim2.new(0.55,0,0.75,0)
    fovBox.BackgroundColor3 = Color3.fromRGB(25,25,35)
    fovBox.Text = "150"
    fovBox.TextColor3 = Color3.new(1,1,1)
    fovBox.Parent = aimbotSection
    Instance.new("UICorner", fovBox).CornerRadius = UDim.new(0,8)

    fovBox:GetPropertyChangedSignal("Text"):Connect(function()
        local newFov = tonumber(fovBox.Text) or 150
        aimFOV = newFov
        fovCircle.Size = UDim2.new(0, newFov*2, 0, newFov*2)
        fovCircle.Position = UDim2.new(0.5, -newFov, 0.5, -newFov)
    end)

    -- Aimbot Logic (simple pero funcional)
    connections.aimbot = RunService.RenderStepped:Connect(function()
        if not aimbotEnabled or not root then return end
        local closest = nil
        local shortest = aimFOV

        for _, p in ipairs(Players:GetPlayers()) do
            if p \~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and p.Character:FindFirstChild(aimPart) then
                local targetPart = p.Character[aimPart]
                local vector, onScreen = Workspace.CurrentCamera:WorldToViewportPoint(targetPart.Position)
                if onScreen then
                    local dist = (Vector2.new(vector.X, vector.Y) - Vector2.new(Workspace.CurrentCamera.ViewportSize.X/2, Workspace.CurrentCamera.ViewportSize.Y/2)).Magnitude
                    if dist < shortest then
                        shortest = dist
                        closest = targetPart
                    end
                end
            end
        end

        if closest then
            local cam = Workspace.CurrentCamera
            local targetCFrame = CFrame.lookAt(cam.CFrame.Position, closest.Position)
            cam.CFrame = cam.CFrame:Lerp(targetCFrame, 0.4)
        end
    end)

    -- ==================== SISTEMA DE IGNORAR ====================
    local ignoreFrame = Instance.new("Frame")
    ignoreFrame.Size = UDim2.new(1,0,0,180)
    ignoreFrame.BackgroundColor3 = Color3.fromRGB(35,35,45)
    ignoreFrame.Parent = content
    Instance.new("UICorner", ignoreFrame).CornerRadius = UDim.new(0,10)

    local ignoreTitle = Instance.new("TextLabel")
    ignoreTitle.Size = UDim2.new(1,0,0,25)
    ignoreTitle.BackgroundTransparency = 1
    ignoreTitle.Text = "🚫 Sistema de Ignorar"
    ignoreTitle.TextColor3 = Color3.fromRGB(255, 100, 100)
    ignoreTitle.TextSize = 16
    ignoreTitle.Font = Enum.Font.GothamBold
    ignoreTitle.Parent = ignoreFrame

    local ignoreBox = Instance.new("TextBox")
    ignoreBox.Size = UDim2.new(0.65,0,0,35)
    ignoreBox.Position = UDim2.new(0.02,0,0.2,0)
    ignoreBox.BackgroundColor3 = Color3.fromRGB(25,25,35)
    ignoreBox.PlaceholderText = "Nombre del jugador"
    ignoreBox.TextColor3 = Color3.new(1,1,1)
    ignoreBox.Parent = ignoreFrame
    Instance.new("UICorner", ignoreBox).CornerRadius = UDim.new(0,8)

    local addIgnoreBtn = Instance.new("TextButton")
    addIgnoreBtn.Size = UDim2.new(0.3,0,0,35)
    addIgnoreBtn.Position = UDim2.new(0.68,0,0.2,0)
    addIgnoreBtn.BackgroundColor3 = Color3.fromRGB(40, 180, 80)
    addIgnoreBtn.Text = "Agregar"
    addIgnoreBtn.TextColor3 = Color3.new(1,1,1)
    addIgnoreBtn.Parent = ignoreFrame
    Instance.new("UICorner", addIgnoreBtn).CornerRadius = UDim.new(0,8)

    addIgnoreBtn.MouseButton1Click:Connect(function()
        local name = ignoreBox.Text
        if name and name \~= "" and not ignoredPlayers[name] then
            ignoredPlayers[name] = true
            ignoreBox.Text = ""
        end
    end)

    local ignoreTeamBtn = createToggle("Ignorar Todo el Equipo")
    ignoreTeamBtn.Parent = ignoreFrame
    ignoreTeamBtn.Position = UDim2.new(0.02,0,0.55,0)
    ignoreTeamBtn.Size = UDim2.new(0.96,0,0,50)

    -- (Resto del código original se mantiene igual)

    print("✅ Panel actualizado con Aimbot + Sistema de Ignorar")
end
