--- 🌈 Rainbow
--------------------------------------------------------------------
local function Rainbow(speed)
    return Color3.fromHSV((tick() * speed) % 1, 1, 1)
end

--------------------------------------------------------------------
-- 🌈 Notify
--------------------------------------------------------------------
local CoreGui = game:GetService("CoreGui")
local notify = Instance.new("ScreenGui", CoreGui)

local frame = Instance.new("Frame", notify)
frame.Size = UDim2.new(0, 280, 0, 60)
frame.Position = UDim2.new(1, -290, 0, 20)
frame.BackgroundTransparency = 0.3

local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0, 10)

local label = Instance.new("TextLabel", frame)
label.Size = UDim2.new(1, 0, 1, 0)
label.BackgroundTransparency = 1
label.Font = Enum.Font.GothamBold
label.TextSize = 18
label.Text = "🔥 Fix Lag Pro Max Loaded!"

task.spawn(function()
    while frame and frame.Parent do
        frame.BackgroundColor3 = Rainbow(0.25)
        label.TextColor3 = Rainbow(1)
        task.wait(0.03)
    end
end)

task.spawn(function()
    task.wait(3)
    for i = 0, 1, 0.1 do
        frame.BackgroundTransparency = i
        label.TextTransparency = i
        task.wait(0.03)
    end
    notify:Destroy()
end)

--------------------------------------------------------------------
-- 📈 FPS + Ping draggable
--------------------------------------------------------------------
local gui = Instance.new("ScreenGui", CoreGui)
local Text = Instance.new("TextLabel", gui)
Text.Size = UDim2.new(0, 200, 0, 50)
Text.Position = UDim2.new(0, 10, 0, 10)
Text.BackgroundTransparency = 1
Text.Font = Enum.Font.GothamBold
Text.TextSize = 20

local UIS = game:GetService("UserInputService")
local dragging = false
local dragStart, startPos, dragInput

Text.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = i.Position
        startPos = Text.Position

        i.Changed:Connect(function()
            if i.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)

Text.InputChanged:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseMovement then dragInput = i end
end)

UIS.InputChanged:Connect(function(i)
    if dragging and i == dragInput then
        local delta = i.Position - dragStart
        Text.Position = UDim2.new(0, startPos.X.Offset + delta.X, 0, startPos.Y.Offset + delta.Y)
    end
end)

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local fps, frames, last = 0, 0, tick()

RunService.RenderStepped:Connect(function()
    frames += 1
    if tick() - last >= 1 then
        fps = frames
        frames = 0
        last = tick()
    end
end)

task.spawn(function()
    while task.wait(0.3) do
        local ping = math.floor(LocalPlayer:GetNetworkPing() * 1000)
        Text.TextColor3 = Rainbow(0.6)
        Text.Text = "⚡ FPS: " .. fps .. "\n📡 Ping: " .. ping .. " ms"
    end
end)

--------------------------------------------------------------------
-- 🎯 V10 Reduce Effects Engine
--------------------------------------------------------------------
local Workspace = game:GetService("Workspace")

local function ReduceParticle(p)
    p.Rate = math.clamp(p.Rate * 0.15, 3, p.Rate)
    p.Lifetime = NumberRange.new(p.Lifetime.Min * 0.4, p.Lifetime.Max * 0.4)
    p.Speed = NumberRange.new(p.Speed.Min * 0.5, p.Speed.Max * 0.5)
    p.LightEmission = p.LightEmission * 0.2
end

local function ReduceBeam(b)
    b.Width0 = b.Width0 * 0.4
    b.Width1 = b.Width1 * 0.4
    b.Brightness = b.Brightness * 0.3
end

local function ReduceTrail(t)
    t.Lifetime = 0.15
    t.Transparency = NumberSequence.new(0.7)
end

local function ReduceLight(l)
    l.Brightness = l.Brightness * 0.4
end

local function ReduceMesh(m)
    m.RenderFidelity = Enum.RenderFidelity.Performance
end

local function ReduceDecal(d)
    d.Transparency = 0.5
end

local function ReduceObject(obj)
    pcall(function()
        if obj:IsA("ParticleEmitter") then ReduceParticle(obj) end
        if obj:IsA("Beam") then ReduceBeam(obj) end
        if obj:IsA("Trail") then ReduceTrail(obj) end
        if obj:IsA("PointLight") or obj:IsA("SpotLight") then ReduceLight(obj) end
        if obj:IsA("MeshPart") then ReduceMesh(obj) end
        if obj:IsA("Texture") or obj:IsA("Decal") then ReduceDecal(obj) end

        if obj:IsA("BasePart") then
            obj.CastShadow = false
            obj.Reflectance = 0
        end
    end)
end

-- Initial pass
for _, v in ipairs(Workspace:GetDescendants()) do
    ReduceObject(v)
end

-- Auto reduce new objects
Workspace.DescendantAdded:Connect(function(v)
    task.wait(0.02)
    ReduceObject(v)
end)

--------------------------------------------------------------------
-- 👕 Reduce Outfit
--------------------------------------------------------------------
local function ReduceChar(char)
    for _, o in ipairs(char:GetDescendants()) do
        if o:IsA("Shirt") then o.ShirtTemplate = "" end
        if o:IsA("Pants") then o.PantsTemplate = "" end
        if o:IsA("Accessory") then o:Destroy() end
        if o:IsA("Decal") and o.Name == "face" then o.Texture = "" end
    end
end

for _, plr in ipairs(Players:GetPlayers()) do
    if plr.Character then ReduceChar(plr.Character) end
end

Players.PlayerAdded:Connect(function(p)
    p.CharacterAdded:Connect(function(c)
        task.wait(0.3)
        ReduceChar(c)
    end)
end)

--------------------------------------------------------------------
-- 🌐 Network Boost
--------------------------------------------------------------------
pcall(function()
    local s = settings()
    s.Network.IncomingReplicationLag = 0
    s.Network.PhysicsThrottle = Enum.PhysicsThrottle.Default
end)

--------------------------------------------------------------------
-- 🧹 RAM Cleaner
--------------------------------------------------------------------
task.spawn(function()
    while task.wait(600) do
        collectgarbage("collect")
    end
end)

print("🔥 Fix Lag Pro Max Loaded")
d")
O ANTI-AFK)")
O ANTI-AFK)")
sicsThrottle = Enum.PhysicsThrottle.Default
end)

--------------------------------------------------------------------
-- 🧹 RAM Cleaner (NO Anti-AFK)
--------------------------------------------------------------------
task.spawn(function()
    while task.wait(600) do
        collectgarbage("collect")
    end
end)

print("🔥 Fix Lag Pro Max V10 Loaded (NO ANTI-AFK)")
