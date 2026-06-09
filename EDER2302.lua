-- // EDER2302 PANEL FASE BETA | Echo también por TOCINACIO23021
-- ADVERTENCIA: Viola los Términos de Servicio de Roblox. Úsalo bajo tu propia responsabilidad.
-- CORREGIDO PARA DELTA EXECUTOR + AIMBOT + LISTA DE IGNORADOS

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
keyFrame.Parent = keyGui

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
    title.Size = UDim2.new(1, 0, 0, 70)
    title.BackgroundColor3 = Color3.fromRGB(12, 12, 20)
    title.Text = string.format("💎 EDER2302 PANEL FASE BETA
👤 %s | %s | 👥 %d jugadores
Echo también por TOCINACIO23021", jugador, dispositivo, #Players:GetPlayers())
    title.TextColor3 = Color3.fromRGB(110, 220, 255)
    title.TextSize = 16
    title.Font = Enum.Font.GothamBold
    title.TextWrapped = true
    title.Parent = mainFrame
    Instance.new("UICorner", title).CornerRadius = UDim.new(0, 16)
    local titleGradient = Instance.new("UIGradient")
    titleGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(110, 220, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(160, 240, 255))
    }
    titleGradient.Parent = title
    title.TextTransparency = 0.1

    local minBtn = Instance.new("TextButton")
    minBtn.Size = UDim2.new(0,40,0,40)
    minBtn.Position = UDim2.new(1,-90,0,8)
    minBtn.BackgroundColor3 = Color3.fromRGB(255,170,0)
    minBtn.Text = "−"
    minBtn.TextColor3 = Color3.new(1,1,1)
    minBtn.TextSize = 26
    minBtn.AutoButtonColor = false
    minBtn.Parent = mainFrame
    Instance.new("UICorner", minBtn).CornerRadius = UDim.new(0,8)
    Instance.new("UIStroke", minBtn).Thickness = 1
    Instance.new("UIStroke", minBtn).Color = Color3.fromRGB(255, 200, 100)

    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0,40,0,40)
    closeBtn.Position = UDim2.new(1,-45,0,8)
    closeBtn.BackgroundColor3 = Color3.fromRGB(220,50,50)
    closeBtn.Text = "×"
    closeBtn.TextColor3 = Color3.new(1,1,1)
    closeBtn.TextSize = 26
    closeBtn.AutoButtonColor = false
    closeBtn.Parent = mainFrame
    Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0,8)
    Instance.new("UIStroke", closeBtn).Thickness = 1
    Instance.new("UIStroke", closeBtn).Color = Color3.fromRGB(255, 120, 120)

    local content = Instance.new("ScrollingFrame")
    content.Size = UDim2.new(1,-20,1,-85)
    content.Position = UDim2.new(0,10,0,75)
    content.BackgroundTransparency = 1
    content.ScrollBarThickness = 6
    content.ScrollBarImageColor3 = Color3.fromRGB(90, 190, 255)
    content.ScrollBarImageTransparency = 0.3
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
    local espActivo = false
    local espInventarioActivo = false
    local etiquetasESP = {}

    -- ==================== VARIABLES AIMBOT ====================
    local aimbotActivo = false
    local aimbotFOV = 90
    local aimbotSmooth = 15
    local aimbotPart = "Head"
    local aimbotIgnoreTeammates = true
    local ignoreList = {}

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
        btn.AutoButtonColor = false
        btn.Parent = content
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0,10)
        Instance.new("UIStroke", btn).Thickness = 0.8
        Instance.new("UIStroke", btn).Color = Color3.fromRGB(70, 70, 90)
        return btn
    end

    -- ==================== SPEED ====================
    local speedFrame = Instance.new("Frame")
    speedFrame.Size = UDim2.new(1,0,0,75)
    speedFrame.BackgroundColor3 = Color3.fromRGB(35,35,45)
    speedFrame.Parent = content
    Instance.new("UICorner", speedFrame).CornerRadius = UDim.new(0,10)
    Instance.new("UIStroke", speedFrame).Thickness = 0.8
    Instance.new("UIStroke", speedFrame).Color = Color3.fromRGB(70, 70, 90)

    local speedBox = Instance.new("TextBox")
    speedBox.Size = UDim2.new(0.45,0,0,35)
    speedBox.Position = UDim2.new(0.5,0,0,8)
    speedBox.BackgroundColor3 = Color3.fromRGB(25,25,35)
    speedBox.Text = "120"
    speedBox.TextColor3 = Color3.new(1,1,1)
    speedBox.TextSize = 16
    speedBox.Font = Enum.Font.GothamSemibold
    speedBox.Parent = speedFrame
    Instance.new("UICorner", speedBox).CornerRadius = UDim.new(0,8)
    Instance.new("UIStroke", speedBox).Thickness = 1
    Instance.new("UIStroke", speedBox).Color = Color3.fromRGB(90, 180, 255)

    local speedBtn = createToggle("Speed")
    speedBtn.Size = UDim2.new(0.45,0,0,35)
    speedBtn.Position = UDim2.new(0.03,0,0,8)
    speedBtn.TextColor3 = Color3.new(1,1,1)

    speedBtn.MouseButton1Click:Connect(function()
        if connections.speed then
            connections.speed:Disconnect() connections.speed = nil
            if humanoid then humanoid.WalkSpeed = velocidadNormal end
            speedBtn.Text = "Speed : OFF" speedBtn.TextColor3 = Color3.fromRGB(255,90,90)
        else
            local spd = tonumber(speedBox.Text) or 120
            connections.speed = RunService.Heartbeat:Connect(function()
                if humanoid then humanoid.WalkSpeed = spd end
            end)
            speedBtn.Text = "Speed : ON ("..spd..")" speedBtn.TextColor3 = Color3.fromRGB(80,255,120)
        end
    end)

    -- ==================== JUMP POWER ====================
    local jumpFrame = Instance.new("Frame")
    jumpFrame.Size = UDim2.new(1,0,0,75)
    jumpFrame.BackgroundColor3 = Color3.fromRGB(35,35,45)
    jumpFrame.Parent = content
    Instance.new("UICorner", jumpFrame).CornerRadius = UDim.new(0,10)
    Instance.new("UIStroke", jumpFrame).Thickness = 0.8
    Instance.new("UIStroke", jumpFrame).Color = Color3.fromRGB(70, 70, 90)

    local jumpBox = Instance.new("TextBox")
    jumpBox.Size = UDim2.new(0.45,0,0,35)
    jumpBox.Position = UDim2.new(0.5,0,0,8)
    jumpBox.BackgroundColor3 = Color3.fromRGB(25,25,35)
    jumpBox.Text = "200"
    jumpBox.TextColor3 = Color3.new(1,1,1)
    jumpBox.TextSize = 16
    jumpBox.Font = Enum.Font.GothamSemibold
    jumpBox.Parent = jumpFrame
    Instance.new("UICorner", jumpBox).CornerRadius = UDim.new(0,8)
    Instance.new("UIStroke", jumpBox).Thickness = 1
    Instance.new("UIStroke", jumpBox).Color = Color3.fromRGB(90, 180, 255)

    local jumpBtn = createToggle("JumpPower")
    jumpBtn.Size = UDim2.new(0.45,0,0,35)
    jumpBtn.Position = UDim2.new(0.03,0,0,8)
    jumpBtn.TextColor3 = Color3.new(1,1,1)

    jumpBtn.MouseButton1Click:Connect(function()
        if connections.jump then
            connections.jump:Disconnect() connections.jump = nil
            jumpBtn.Text = "JumpPower : OFF" jumpBtn.TextColor3 = Color3.fromRGB(255,90,90)
            if humanoid then humanoid.JumpPower = 50 humanoid.JumpHeight = 7.2 end
        else
            local jp = tonumber(jumpBox.Text) or 200
            if humanoid then humanoid.JumpPower = jp humanoid.JumpHeight = jp end
            connections.jump = RunService.Heartbeat:Connect(function()
                if humanoid then humanoid.JumpPower = jp end
            end)
            jumpBtn.Text = "JumpPower : ON ("..jp..")" jumpBtn.TextColor3 = Color3.fromRGB(80,255,120)
        end
    end)

    -- Infinite Jump
    local infBtn = createToggle("Infinite Jump")
    infBtn.MouseButton1Click:Connect(function()
        if connections.inf then
            connections.inf:Disconnect() connections.inf = nil
            infBtn.Text = "Infinite Jump : OFF" infBtn.TextColor3 = Color3.fromRGB(255,90,90)
        else
            connections.inf = UserInputService.JumpRequest:Connect(function()
                if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end
            end)
            infBtn.Text = "Infinite Jump : ON" infBtn.TextColor3 = Color3.fromRGB(80,255,120)
        end
    end)

    -- God Mode
    local godBtn = createToggle("God Mode (Ultra)")
    godBtn.MouseButton1Click:Connect(function()
        if connections.god then
            connections.god:Disconnect() connections.god = nil
            if connections.respawnGod then connections.respawnGod:Disconnect() connections.respawnGod = nil end
            godBtn.Text = "God Mode : OFF" godBtn.TextColor3 = Color3.fromRGB(255,90,90)
        else
            godBtn.Text = "God Mode : ON" godBtn.TextColor3 = Color3.fromRGB(255, 200, 0)
            connections.god = RunService.Heartbeat:Connect(function()
                if humanoid then
                    humanoid.MaxHealth = math.huge
                    humanoid.Health = math.huge
                    humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
                end
            end)
            connections.respawnGod = player.CharacterAdded:Connect(function(newChar)
                task.wait(0.3)
                local h = newChar:WaitForChild("Humanoid")
                h.MaxHealth = math.huge h.Health = math.huge
                h:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
            end)
        end
    end)

    -- ✅ LOW GRAVITY ARREGLADO
    local gravBtn = createToggle("Low Gravity")
    local gravActivo = false
    gravBtn.MouseButton1Click:Connect(function()
        gravActivo = not gravActivo
        if gravActivo then
            Workspace.Gravity = 25
            gravBtn.Text = "Low Gravity : ON"
            gravBtn.TextColor3 = Color3.fromRGB(80,255,120)
        else
            Workspace.Gravity = normalGravity
            gravBtn.Text = "Low Gravity : OFF"
            gravBtn.TextColor3 = Color3.fromRGB(255,90,90)
        end
    end)

    -- ==================== NO CLIP ====================
    local noclipBtn = createToggle("No Clip")
    noclipBtn.MouseButton1Click:Connect(function()
        if connections.noclip then
            connections.noclip:Disconnect() connections.noclip = nil
            for _,p in ipairs(root.Parent:GetDescendants()) do
                if p:IsA("BasePart") then p.CanCollide = true end
            end
            noclipBtn.Text = "No Clip : OFF" noclipBtn.TextColor3 = Color3.fromRGB(255,90,90)
        else
            connections.noclip = RunService.Stepped:Connect(function()
                if root then
                    for _,p in ipairs(root.Parent:GetDescendants()) do
                        if p:IsA("BasePart") then p.CanCollide = false end
                    end
                end
            end)
            noclipBtn.Text = "No Clip : ON" noclipBtn.TextColor3 = Color3.fromRGB(80,255,120)
        end
    end)

    -- ==================== ESP JUGADORES ====================
    local espBtn = createToggle("ESP Jugadores")
    espBtn.MouseButton1Click:Connect(function()
        espActivo = not espActivo
        if espActivo then
            espBtn.Text = "ESP : ON" espBtn.TextColor3 = Color3.fromRGB(80,255,120)
            connections.esp = RunService.RenderStepped:Connect(function()
                for _,p in ipairs(Players:GetPlayers()) do
                    if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and p.Character:FindFirstChild("Humanoid") and p.Character.Humanoid.Health > 0 then
                        local parte = p.Character.HumanoidRootPart
                        local dist = (root.Position - parte.Position).Magnitude
                        local vector, visible = Workspace.CurrentCamera:WorldToViewportPoint(parte.Position)
                        if visible then
                            if not etiquetasESP[p] then
                                local gui = Instance.new("BillboardGui")
                                gui.Name = "ESP_"..p.Name
                                gui.Adornee = parte
                                gui.Size = UDim2.new(0, 160, 0, 60)
                                gui.AlwaysOnTop = true
                                gui.Parent = screenGui
                                local txt = Instance.new("TextLabel")
                                txt.Size = UDim2.new(1,0,1,0)
                                txt.BackgroundTransparency = 1
                                txt.TextColor3 = Color3.fromRGB(255,80,80)
                                txt.TextSize = 14
                                txt.Font = Enum.Font.GothamBold
                                txt.TextWrapped = true
                                txt.Text = ""
                                txt.Parent = gui
                                etiquetasESP[p] = txt
                            end
                            etiquetasESP[p].Text = string.format("👤 %s
❤️ %d/100 | 📏 %.0fm", p.Name, math.floor(p.Character.Humanoid.Health), dist)
                        else
                            if etiquetasESP[p] then etiquetasESP[p].Parent:Destroy() etiquetasESP[p] = nil end
                        end
                    else
                        if etiquetasESP[p] then etiquetasESP[p].Parent:Destroy() etiquetasESP[p] = nil end
                    end
                end
            end)
        else
            espBtn.Text = "ESP : OFF" espBtn.TextColor3 = Color3.fromRGB(255,90,90)
            if connections.esp then connections.esp:Disconnect() connections.esp = nil end
            for _,etq in pairs(etiquetasESP) do if etq then etq.Parent:Destroy() end end
            etiquetasESP = {}
        end
    end)

    -- ==================== ESP INVENTARIO ====================
    local espInvBtn = createToggle("ESP Inventario")
    espInvBtn.MouseButton1Click:Connect(function()
        espInventarioActivo = not espInventarioActivo
        if espInventarioActivo then
            espInvBtn.Text = "ESP Inventario : ON"
            espInvBtn.TextColor3 = Color3.fromRGB(80,255,120)
            connections.espInv = RunService.RenderStepped:Connect(function()
                for _,p in ipairs(Players:GetPlayers()) do
                    if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                        local parte = p.Character.HumanoidRootPart
                        local hum = p.Character:FindFirstChild("Humanoid")
                        if not hum or hum.Health <= 0 then
                            if etiquetasESP["Inv_"..p.UserId] then etiquetasESP["Inv_"..p.UserId].Parent:Destroy() etiquetasESP["Inv_"..p.UserId] = nil end
                            continue
                        end
                        local cam = Workspace.CurrentCamera
                        local vector, visible = cam:WorldToViewportPoint(parte.Position)
                        if visible then
                            local inventario = p.Backpack
                            local lista = {}
                            if inventario then
                                for _,obj in ipairs(inventario:GetChildren()) do
                                    if obj:IsA("Tool") or obj:IsA("HopperBin") then
                                        table.insert(lista, obj.Name)
                                    end
                                end
                            end
                            if hum and hum:FindFirstChild("Tool") then
                                table.insert(lista, "✅ "..hum.Tool.Name.." (Equipado)")
                            end
                            local textoInv = #lista > 0 and table.concat(lista, "
• ") or "Sin objetos"
                            if not etiquetasESP["Inv_"..p.UserId] then
                                local gui = Instance.new("BillboardGui")
                                gui.Name = "ESPInv_"..p.Name
                                gui.Adornee = parte
                                gui.Size = UDim2.new(0, 220, 0, 100)
                                gui.AlwaysOnTop = true
                                gui.Parent = screenGui
                                local txt = Instance.new("TextLabel")
                                txt.Size = UDim2.new(1,0,1,0)
                                txt.BackgroundTransparency = 1
                                txt.TextColor3 = Color3.fromRGB(120, 255, 120)
                                txt.TextSize = 13
                                txt.Font = Enum.Font.GothamBold
                                txt.TextWrapped = true
                                txt.Text = ""
                                txt.Parent = gui
                                etiquetasESP["Inv_"..p.UserId] = txt
                            end
                            etiquetasESP["Inv_"..p.UserId].Text = string.format("🎒 Inventario de %s:
• %s", p.Name, textoInv)
                        else
                            if etiquetasESP["Inv_"..p.UserId] then etiquetasESP["Inv_"..p.UserId].Parent:Destroy() etiquetasESP["Inv_"..p.UserId] = nil end
                        end
                    else
                        if etiquetasESP["Inv_"..p.UserId] then etiquetasESP["Inv_"..p.UserId].Parent:Destroy() etiquetasESP["Inv_"..p.UserId] = nil end
                    end
                end
            end)
        else
            espInvBtn.Text = "ESP Inventario : OFF"
            espInvBtn.TextColor3 = Color3.fromRGB(255,90,90)
            if connections.espInv then connections.espInv:Disconnect() connections.espInv = nil end
            for k,etq in pairs(etiquetasESP) do
                if k:sub(1,4) == "Inv_" then etq.Parent:Destroy() etiquetasESP[k] = nil end
            end
        end
    end)

    -- ==================== 🎯 AIMBOT ====================
    local aimbotBtn = createToggle("🎯 AIMBOT")
    aimbotBtn.MouseButton1Click:Connect(function()
        aimbotActivo = not aimbotActivo
        if aimbotActivo then
            aimbotBtn.Text = "🎯 AIMBOT : ON"
            aimbotBtn.TextColor3 = Color3.fromRGB(80,255,120)
            
            connections.aimbot = RunService.RenderStepped:Connect(function()
                if not humanoid or not root then return end
                
                local camera = Workspace.CurrentCamera
                local cameraPos = camera.Position
                local cameraDir = camera.CFrame.LookVector
                
                local bestTarget = nil
                local bestDistance = math.huge
                
                for _, p in ipairs(Players:GetPlayers()) do
                    if p == player then continue end
                    if not p.Character then continue end
                    if not p.Character:FindFirstChild("HumanoidRootPart") then continue end
                    if not p.Character:FindFirstChild("Humanoid") then continue end
                    if p.Character.Humanoid.Health <= 0 then continue end
                    
                    -- Ignorar teammates
                    if aimbotIgnoreTeammates then
                        if p.Team and player.Team and p.Team == player.Team then
                            continue
                        end
                    end
                    
                    -- Ignorar si está en la lista
                    if ignoreList[p.Name] then
                        continue
                    end
                    
                    local targetPart = p.Character.HumanoidRootPart
                    local targetPos = targetPart.Position
                    local distance = (cameraPos - targetPos).Magnitude
                    
                    -- Calcular FOV
                    local toTarget = (targetPos - cameraPos).Unit
                    local angle = math.acos(math.min(cameraDir:Dot(toTarget), 1))
                    local angleDegrees = angle * (180 / math.pi)
                    
                    if angleDegrees <= aimbotFOV / 2 then
                        if distance < bestDistance then
                            bestDistance = distance
                            bestTarget = {player = p, position = targetPos}
                        end
                    end
                end
                
                -- Apuntar al objetivo
                if bestTarget then
                    local targetPos = bestTarget.position
                    
                    -- Selección de parte
                    if aimbotPart == "Head" then
                        local head = bestTarget.player.Character:FindFirstChild("Head")
                        if head then targetPos = head.Position end
                    elseif aimbotPart == "Body" then
                        targetPos = bestTarget.player.Character.HumanoidRootPart.Position
                    end
                    
                    -- Suavizado
                    local screenPos = camera:WorldToScreenPoint(targetPos)
                    local centerX = camera.ViewportSize.X / 2
                    local centerY = camera.ViewportSize.Y / 2
                    
                    local offsetX = screenPos.X - centerX
                    local offsetY = screenPos.Y - centerY
                    
                    -- Simular click
                    UserInputService.SendMouse2Click(offsetX, offsetY)
                end
            end)
        else
            aimbotBtn.Text = "🎯 AIMBOT : OFF"
            aimbotBtn.TextColor3 = Color3.fromRGB(255,90,90)
            if connections.aimbot then 
                connections.aimbot:Disconnect() 
                connections.aimbot = nil 
            end
        end
    end)

    -- FOV
    local fovBtn = createToggle("FOV AIMBOT")
    local fovBox = Instance.new("TextBox")
    fovBox.Size = UDim2.new(0.45,0,0,35)
    fovBox.Position = UDim2.new(0.5,0,0,8)
    fovBox.BackgroundColor3 = Color3.fromRGB(25,25,35)
    fovBox.Text = aimbotFOV
    fovBox.TextColor3 = Color3.new(1,1,1)
    fovBox.TextSize = 16
    fovBox.Font = Enum.Font.GothamSemibold
    fovBox.Parent = fovBtn.Parent
    Instance.new("UICorner", fovBox).CornerRadius = UDim.new(0,8)
    Instance.new("UIStroke", fovBox).Thickness = 1
    Instance.new("UIStroke", fovBox).Color = Color3.fromRGB(90, 180, 255)
    
    fovBtn.Size = UDim2.new(0.45,0,0,35)
    fovBtn.Position = UDim2.new(0.03,0,0,8)
    fovBtn.Text = "FOV: 90"
    fovBtn.TextColor3 = Color3.new(1,1,1)

    -- Smooth
    local smoothBtn = createToggle("SMOOTH AIM")
    local smoothBox = Instance.new("TextBox")
    smoothBox.Size = UDim2.new(0.45,0,0,35)
    smoothBox.Position = UDim2.new(0.5,0,0,8)
    smoothBox.BackgroundColor3 = Color3.fromRGB(25,25,35)
    smoothBox.Text = aimbotSmooth
    smoothBox.TextColor3 = Color3.new(1,1,1)
    smoothBox.TextSize = 16
    smoothBox.Font = Enum.Font.GothamSemibold
    smoothBox.Parent = smoothBtn.Parent
    Instance.new("UICorner", smoothBox).CornerRadius = UDim.new(0,8)
    Instance.new("UIStroke", smoothBox).Thickness = 1
    Instance.new("UIStroke", smoothBox).Color = Color3.fromRGB(90, 180, 255)
    
    smoothBtn.Size = UDim2.new(0.45,0,0,35)
    smoothBtn.Position = UDim2.new(0.03,0,0,8)
    smoothBtn.Text = "SMOOTH: 15"
    smoothBtn.TextColor3 = Color3.new(1,1,1)

    -- Parte del cuerpo
    local partBtn = createToggle("PARTE AIMBOT")
    local partBox = Instance.new("TextBox")
    partBox.Size = UDim2.new(0.45,0,0,35)
    partBox.Position = UDim2.new(0.5,0,0,8)
    partBox.BackgroundColor3 = Color3.fromRGB(25,25,35)
    partBox.Text = aimbotPart
    partBox.TextColor3 = Color3.new(1,1,1)
    partBox.TextSize = 16
    partBox.Font = Enum.Font.GothamSemibold
    partBox.PlaceholderText = "Head, Body"
    partBox.Parent = partBtn.Parent
    Instance.new("UICorner", partBox).CornerRadius = UDim.new(0,8)
    Instance.new("UIStroke", partBox).Thickness = 1
    Instance.new("UIStroke", partBox).Color = Color3.fromRGB(90, 180, 255)
    
    partBtn.Size = UDim2.new(0.45,0,0,35)
    partBtn.Position = UDim2.new(0.03,0,0,8)
    partBtn.Text = "PARTE: Head"
    partBtn.TextColor3 = Color3.new(1,1,1)

    -- Ignorar teammates
    local teamBtn = createToggle("IGNORAR TEAMMATES")
    teamBtn.Text = aimbotIgnoreTeammates and "IGNORAR TEAMMATES : ON" or "IGNORAR TEAMMATES : OFF"
    teamBtn.TextColor3 = aimbotIgnoreTeammates and Color3.fromRGB(80,255,120) or Color3.fromRGB(255,90,90)
    
    teamBtn.MouseButton1Click:Connect(function()
        aimbotIgnoreTeammates = not aimbotIgnoreTeammates
        teamBtn.Text = aimbotIgnoreTeammates and "IGNORAR TEAMMATES : ON" or "IGNORAR TEAMMATES : OFF"
        teamBtn.TextColor3 = aimbotIgnoreTeammates and Color3.fromRGB(80,255,120) or Color3.fromRGB(255,90,90)
    end)

    -- ==================== 📋 LISTA DE IGNORADOS ====================
    local ignoreBtn = createToggle("📋 AÑADIR A IGNORADOS")
    local ignoreInput = Instance.new("TextBox")
    ignoreInput.Size = UDim2.new(0.6,0,0,35)
    ignoreInput.Position = UDim2.new(0.03,0,0,8)
    ignoreInput.BackgroundColor3 = Color3.fromRGB(25,25,35)
    ignoreInput.PlaceholderText = "Nombre del jugador..."
    ignoreInput.Text = ""
    ignoreInput.TextColor3 = Color3.new(1,1,1)
    ignoreInput.TextSize = 14
    ignoreInput.Font = Enum.Font.GothamSemibold
    ignoreInput.Parent = ignoreBtn.Parent
    Instance.new("UICorner", ignoreInput).CornerRadius = UDim.new(0,8)
    Instance.new("UIStroke", ignoreInput).Thickness = 1
    Instance.new("UIStroke", ignoreInput).Color = Color3.fromRGB(90, 180, 255)
    
    local ignoreAddBtn = Instance.new("TextButton")
    ignoreAddBtn.Size = UDim2.new(0.3,0,0,35)
    ignoreAddBtn.Position = UDim2.new(0.63,0,0,8)
    ignoreAddBtn.BackgroundColor3 = Color3.fromRGB(30,180,80)
    ignoreAddBtn.Text = "➕"
    ignoreAddBtn.TextColor3 = Color3.new(1,1,1)
    ignoreAddBtn.TextSize = 18
    ignoreAddBtn.Font = Enum.Font.GothamBold
    ignoreAddBtn.Parent = ignoreBtn.Parent
    Instance.new("UICorner", ignoreAddBtn).CornerRadius = UDim.new(0,8)
    Instance.new("UIStroke", ignoreAddBtn).Thickness = 1
    Instance.new("UIStroke", ignoreAddBtn).Color = Color3.fromRGB(120, 255, 180)
    
    ignoreBtn.Size = UDim2.new(1,0,0,58)
    ignoreBtn.Position = UDim2.new(0,0,0,0)
    ignoreBtn.Text = "📋 LISTA: " .. #ignoreList .. " jugadores"
    ignoreBtn.TextColor3 = Color3.new(1,1,1)

    ignoreAddBtn.MouseButton1Click:Connect(function()
        local nombre = ignoreInput.Text:gsub("^\\s+", ""):gsub("\\s+$", "")
        if nombre and #nombre > 0 then
            if not ignoreList[nombre] then
                ignoreList[nombre] = true
                ignoreInput.Text = ""
                ignoreBtn.Text = "📋 LISTA: " .. #ignoreList .. " jugadores"
                ignoreBtn.TextColor3 = Color3.fromRGB(80,255,120)
                print("✅ " .. nombre .. " agregado a ignorados")
            else
                ignoreBtn.TextColor3 = Color3.fromRGB(255,200,100)
                ignoreBtn.Text = "⚠️ " .. nombre .. " ya está en la lista"
                task.wait(2)
                ignoreBtn.Text = "📋 LISTA: " .. #ignoreList .. " jugadores"
                ignoreBtn.TextColor3 = Color3.new(1,1,1)
            end
        end
    end)

    -- Teleport
    local saveBtn = createToggle("Guardar Posición")
    local instantBtn = createToggle("Teleport Instantáneo")
    local smoothBtn2 = createToggle("Teleport Suave")

    saveBtn.TextColor3 = Color3.new(1,1,1)
    instantBtn.TextColor3 = Color3.new(1,1,1)
    smoothBtn2.TextColor3 = Color3.new(1,1,1)

    saveBtn.MouseButton1Click:Connect(function()
        if root then savedCFrame = root.CFrame saveBtn.Text = "✅ Guardado" task.delay(1.2, function() saveBtn.Text = "Guardar Posición" end) end
    end)
    instantBtn.MouseButton1Click:Connect(function() if savedCFrame and root then root.CFrame = savedCFrame end end)
    smoothBtn2.MouseButton1Click:Connect(function() if savedCFrame and root then TweenService:Create(root, TweenInfo.new(1.6, Enum.EasingStyle.Quint), {CFrame = savedCFrame}):Play() end end)

    minBtn.MouseButton1Click:Connect(function()
        content.Visible = not content.Visible
        mainFrame.Size = content.Visible and UDim2.new(0,450,0,680) or UDim2.new(0,450,0,75)
    end)

    -- ✅ BOTÓN CERRAR GUI ARREGLADO
    closeBtn.MouseButton1Click:Connect(function()
        for _, conn in pairs(connections) do
            if typeof(conn) == "RBXScriptConnection" then
                conn:Disconnect()
            end
        end
        Workspace.Gravity = normalGravity
        if humanoid then
            humanoid.WalkSpeed = velocidadNormal
            humanoid.JumpPower = 50
            humanoid.JumpHeight = 7.2
        end
        for _,etq in pairs(etiquetasESP) do
            if etq and etq.Parent then
                etq.Parent:Destroy()
            end
        end
        screenGui:Destroy()
    end)

    print("✅ EDER2302 PANEL CARGADO | Echo también por TOCINACIO23021")
    print("🎯 Aimbot integrado correctamente")
    print("📋 Lista de ignorados: " .. #ignoreList .. " jugadores")
                end
