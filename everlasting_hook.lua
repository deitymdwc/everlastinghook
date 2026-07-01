local player = game:GetService("Players").LocalPlayer
local userInputService = game:GetService("UserInputService")
local tweenService = game:GetService("TweenService")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "EverlastingHook"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = player:WaitForChild("PlayerGui")

local font = Enum.Font.GothamSemibold
local bgColor = Color3.fromRGB(0, 0, 0)
local darkerBg = Color3.fromRGB(5, 5, 5)
local accentColor = Color3.fromRGB(255, 255, 255)
local textColor = Color3.fromRGB(255, 255, 255)
local mutedColor = Color3.fromRGB(160, 160, 160)
local tabBg = Color3.fromRGB(5, 5, 5)
local contentBg = Color3.fromRGB(8, 8, 10)

local tweenInfo = TweenInfo.new(0.15, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)


-- LOADING SCREEN

local loadingFrame = Instance.new("Frame")
loadingFrame.Size = UDim2.new(0, 280, 0, 140)
loadingFrame.Position = UDim2.new(0.5, -140, 0.5, -70)
loadingFrame.BackgroundColor3 = bgColor
loadingFrame.BorderSizePixel = 0
loadingFrame.Parent = screenGui

local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 22)
titleBar.BackgroundColor3 = darkerBg
titleBar.BorderSizePixel = 0
titleBar.Parent = loadingFrame

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 1, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "everlasting.hook"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 11
titleLabel.Parent = titleBar

-- Progress bar container
local progressContainer = Instance.new("Frame")
progressContainer.Size = UDim2.new(0, 200, 0, 4)
progressContainer.Position = UDim2.new(0.5, -100, 0, 55)
progressContainer.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
progressContainer.BorderSizePixel = 0
progressContainer.Parent = loadingFrame

local progressFill = Instance.new("Frame")
progressFill.Size = UDim2.new(0, 0, 1, 0)
progressFill.BackgroundColor3 = accentColor
progressFill.BorderSizePixel = 0
progressFill.Parent = progressContainer

-- Percentage text
local percentLabel = Instance.new("TextLabel")
percentLabel.Size = UDim2.new(1, -40, 0, 14)
percentLabel.Position = UDim2.new(0, 20, 0, 65)
percentLabel.BackgroundTransparency = 1
percentLabel.Text = "0%"
percentLabel.TextColor3 = textColor
percentLabel.Font = font
percentLabel.TextSize = 13
percentLabel.TextScaled = true
percentLabel.TextXAlignment = Enum.TextXAlignment.Center
percentLabel.Parent = loadingFrame

-- Footer text
local footerLabel = Instance.new("TextLabel")
footerLabel.Size = UDim2.new(1, -20, 0, 14)
footerLabel.Position = UDim2.new(0, 10, 1, -18)
footerLabel.BackgroundTransparency = 1
footerLabel.Text = "everlasting.hook. All rights reversed."
footerLabel.TextColor3 = mutedColor
footerLabel.Font = Enum.Font.Gotham
footerLabel.TextSize = 10
footerLabel.TextScaled = true
footerLabel.TextXAlignment = Enum.TextXAlignment.Center
footerLabel.Parent = loadingFrame

-- MAIN GUI

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 520, 0, 360)
mainFrame.Position = UDim2.new(0.5, -260, 0.5, -180)
mainFrame.BackgroundColor3 = bgColor
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false
mainFrame.Parent = screenGui

-- Main title bar
local mainTitleBar = Instance.new("Frame")
mainTitleBar.Size = UDim2.new(1, 0, 0, 22)
mainTitleBar.BackgroundColor3 = darkerBg
mainTitleBar.BorderSizePixel = 0
mainTitleBar.Parent = mainFrame

local mainTitleLabel = Instance.new("TextLabel")
mainTitleLabel.Size = UDim2.new(1, -80, 1, 0)
mainTitleLabel.Position = UDim2.new(0, 10, 0, 0)
mainTitleLabel.BackgroundTransparency = 1
mainTitleLabel.RichText = true
mainTitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
mainTitleLabel.Text = "everlasting.hook <font color=\"#A0A0A0\">/</font> <font color=\"#FFFFFF\">" .. player.DisplayName .. "</font>"
mainTitleLabel.Font = Enum.Font.GothamBold
mainTitleLabel.TextSize = 11
mainTitleLabel.TextXAlignment = Enum.TextXAlignment.Left
mainTitleLabel.Parent = mainTitleBar

-- Unload button
local unloadBtn = Instance.new("TextButton")
unloadBtn.Size = UDim2.new(0, 60, 1, 0)
unloadBtn.Position = UDim2.new(1, -65, 0, 0)
unloadBtn.BackgroundTransparency = 1
unloadBtn.Text = "Unload"
unloadBtn.TextColor3 = Color3.fromRGB(200, 80, 80)
unloadBtn.Font = Enum.Font.GothamBold
unloadBtn.TextSize = 10
unloadBtn.TextXAlignment = Enum.TextXAlignment.Center
unloadBtn.BorderSizePixel = 0
unloadBtn.AutoButtonColor = false
unloadBtn.Parent = mainTitleBar

-- Tabs container (left sidebar)
local tabsContainer = Instance.new("Frame")
tabsContainer.Size = UDim2.new(0, 110, 1, -22)
tabsContainer.Position = UDim2.new(0, 0, 0, 22)
tabsContainer.BackgroundColor3 = tabBg
tabsContainer.BorderSizePixel = 0
tabsContainer.Parent = mainFrame

local tabListLayout = Instance.new("UIListLayout")
tabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
tabListLayout.Padding = UDim.new(0, 2)
tabListLayout.Parent = tabsContainer

-- Content area (right side)
local contentArea = Instance.new("Frame")
contentArea.Size = UDim2.new(1, -110, 1, -22)
contentArea.Position = UDim2.new(0, 110, 0, 22)
contentArea.BackgroundColor3 = contentBg
contentArea.BorderSizePixel = 0
contentArea.Parent = mainFrame

local contentTitle = Instance.new("TextLabel")
contentTitle.Size = UDim2.new(1, -20, 0, 20)
contentTitle.Position = UDim2.new(0, 10, 0, 8)
contentTitle.BackgroundTransparency = 1
contentTitle.Text = "Select a tab"
contentTitle.TextColor3 = mutedColor
contentTitle.Font = font
contentTitle.TextSize = 12
contentTitle.TextXAlignment = Enum.TextXAlignment.Left
contentTitle.TextYAlignment = Enum.TextYAlignment.Top
contentTitle.Parent = contentArea

local contentContainer = Instance.new("ScrollingFrame")
contentContainer.Size = UDim2.new(1, -20, 1, -35)
contentContainer.Position = UDim2.new(0, 10, 0, 30)
contentContainer.BackgroundTransparency = 1
contentContainer.BorderSizePixel = 0
contentContainer.ScrollBarThickness = 3
contentContainer.ScrollBarImageColor3 = Color3.fromRGB(60, 60, 70)
contentContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
contentContainer.Parent = contentArea

local contentListLayout = Instance.new("UIListLayout")
contentListLayout.SortOrder = Enum.SortOrder.LayoutOrder
contentListLayout.Padding = UDim.new(0, 4)
contentListLayout.Parent = contentContainer

local function clearContent()
	contentContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
	for _, child in ipairs(contentContainer:GetChildren()) do
		if child:IsA("GuiObject") then
			child:Destroy()
		end
	end
end

-- Toggle helper (checkbox style)
local function createToggle(parent, name, callback)
	local row = Instance.new("Frame")
	row.Size = UDim2.new(1, 0, 0, 24)
	row.BackgroundTransparency = 1
	row.Parent = parent

	local checkbox = Instance.new("Frame")
	checkbox.Size = UDim2.new(0, 14, 0, 14)
	checkbox.Position = UDim2.new(0, 0, 0.5, -7)
	checkbox.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
	checkbox.BorderSizePixel = 0
	checkbox.Parent = row

	local checkmark = Instance.new("TextLabel")
	checkmark.Size = UDim2.new(1, 0, 1, 0)
	checkmark.BackgroundTransparency = 1
	checkmark.Text = "✓"
	checkmark.TextColor3 = Color3.fromRGB(255, 255, 255)
	checkmark.Font = Enum.Font.Gotham
	checkmark.TextSize = 12
	checkmark.TextTransparency = 1
	checkmark.TextXAlignment = Enum.TextXAlignment.Center
	checkmark.TextYAlignment = Enum.TextYAlignment.Center
	checkmark.Parent = checkbox

	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(1, -24, 1, 0)
	label.Position = UDim2.new(0, 20, 0, 0)
	label.BackgroundTransparency = 1
	label.Text = name
	label.RichText = true
	label.TextColor3 = Color3.fromRGB(190, 190, 190)
	label.Font = font
	label.TextSize = 13
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.TextYAlignment = Enum.TextYAlignment.Center
	label.Parent = row

	local enabled = false
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, 0, 1, 0)
	btn.BackgroundTransparency = 1
	btn.Text = ""
	btn.BorderSizePixel = 0
	btn.Parent = row

	btn.MouseButton1Click:Connect(function()
		enabled = not enabled
		checkbox.BackgroundColor3 = enabled and Color3.fromRGB(50, 50, 55) or Color3.fromRGB(25, 25, 30)
		tweenService:Create(checkmark, TweenInfo.new(0.12), {TextTransparency = enabled and 0 or 1}):Play()
		if callback then callback(enabled) end
	end)

	return row
end

-- ESP system
local espSettings = {}
local espGuis = {}
local espEnabled = false

local function getPlayerRole(p)
	if p:FindFirstChild("Murderer") then return "Murderer" end
	if p:FindFirstChild("Sheriff") then return "Sheriff" end

	local char = p.Character
	if char then
		if char:FindFirstChild("Murderer") then return "Murderer" end
		if char:FindFirstChild("Sheriff") then return "Sheriff" end

		local hum = char:FindFirstChildOfClass("Humanoid")
		if hum then
			if hum:FindFirstChild("Murderer") then return "Murderer" end
			if hum:FindFirstChild("Sheriff") then return "Sheriff" end
		end

		local function checkTool(obj)
			if obj and obj:IsA("Tool") then
				local n = obj.Name:lower()
				if n:find("knife") or n:find("murder") then return "Murderer" end
				if n:find("gun") or n:find("sheriff") or n:find("revolver") or n:find("pistol") then return "Sheriff" end
			end
		end

		for _, v in ipairs(char:GetChildren()) do
			local r = checkTool(v)
			if r then return r end
		end

		local backpack = p:FindFirstChildOfClass("Backpack")
		if backpack then
			for _, v in ipairs(backpack:GetChildren()) do
				local r = checkTool(v)
				if r then return r end
			end
		end
	end

	return "Innocent"
end

local function createESP(p)
	if espGuis[p] then
		espGuis[p].gui:Destroy()
		espGuis[p] = nil
	end

	local bg = Instance.new("BillboardGui")
	bg.Name = "EverlastingESP_" .. p.Name
	bg.AlwaysOnTop = true
	bg.ResetOnSpawn = false
	bg.Size = UDim2.new(0, 500, 0, 600)
	bg.StudsOffsetWorldSpace = Vector3.new(0, 0, 0)
	bg.Adornee = nil
	bg.Parent = player:WaitForChild("PlayerGui")

	local nameLabel = Instance.new("TextLabel")
	nameLabel.BackgroundTransparency = 1
	nameLabel.Text = ""
	nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	nameLabel.Font = Enum.Font.GothamBold
	nameLabel.TextSize = 13
	nameLabel.TextStrokeTransparency = 0.3
	nameLabel.Visible = false
	nameLabel.Parent = bg

	local box = Instance.new("Frame")
	box.BackgroundTransparency = 1
	box.BorderSizePixel = 0
	box.Visible = false
	box.Parent = bg

	local boxStroke = Instance.new("UIStroke")
	boxStroke.Thickness = 1
	boxStroke.Color = Color3.fromRGB(255, 255, 255)
	boxStroke.Transparency = 0.2
	boxStroke.Parent = box

	local healthBarBg = Instance.new("Frame")
	healthBarBg.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	healthBarBg.BorderSizePixel = 0
	healthBarBg.Visible = false
	healthBarBg.Parent = bg

	local healthBarFill = Instance.new("Frame")
	healthBarFill.Size = UDim2.new(1, 0, 0, 0)
	healthBarFill.Position = UDim2.new(0, 0, 1, 0)
	healthBarFill.AnchorPoint = Vector2.new(0, 1)
	healthBarFill.BackgroundColor3 = Color3.fromRGB(80, 200, 80)
	healthBarFill.BorderSizePixel = 0
	healthBarFill.Parent = healthBarBg

	local distanceLabel = Instance.new("TextLabel")
	distanceLabel.BackgroundTransparency = 1
	distanceLabel.Text = ""
	distanceLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
	distanceLabel.Font = font
	distanceLabel.TextSize = 11
	distanceLabel.Visible = false
	distanceLabel.Parent = bg

	local roleLabel = Instance.new("TextLabel")
	roleLabel.BackgroundTransparency = 1
	roleLabel.Text = ""
	roleLabel.TextColor3 = Color3.fromRGB(255, 200, 200)
	roleLabel.Font = font
	roleLabel.TextSize = 11
	roleLabel.Visible = false
	roleLabel.Parent = bg

	espGuis[p] = {
		gui = bg,
		box = box,
		boxStroke = boxStroke,
		name = nameLabel,
		healthBg = healthBarBg,
		healthFill = healthBarFill,
		distance = distanceLabel,
		role = roleLabel,
	}
end

local function destroyESP(p)
	if espGuis[p] then
		pcall(espGuis[p].gui.Destroy, espGuis[p].gui)
		espGuis[p] = nil
	end
end

local function updateESP()
	if not espEnabled then
		local toDestroy = {}
		for p in pairs(espGuis) do
			table.insert(toDestroy, p)
		end
		for _, p in ipairs(toDestroy) do
			destroyESP(p)
		end
		return
	end

	local camera = workspace.CurrentCamera
	local viewportSize = camera and camera.ViewportSize or Vector2.new(1920, 1080)
	local fov = camera and camera.FieldOfView or 70

	for _, p in ipairs(game:GetService("Players"):GetPlayers()) do
		if p == player then continue end
		local char = p.Character
		local hrp = char and char:FindFirstChild("HumanoidRootPart")
		local hum = char and char:FindFirstChildOfClass("Humanoid")
		local head = char and char:FindFirstChild("Head")

		if hrp and hum and hum.Health > 0 and head and camera then
			if not espGuis[p] then createESP(p) end
			local data = espGuis[p]

			data.gui.Adornee = hrp

			local charHeight = (head.Position - hrp.Position).Magnitude * 2 + 2.5
			local dist = (camera.CFrame.Position - hrp.Position).Magnitude
			local pixelsPerStud = (viewportSize.Y / 2) / (dist * math.tan(math.rad(fov / 2)))

			local screenH = math.clamp(charHeight * pixelsPerStud * 1.2, 30, viewportSize.Y * 0.9)
			local boxH = screenH
			local boxW = boxH * 0.45
			local nameH = math.clamp(16 * (boxH / 100), 12, 32)

			local padX = (500 - boxW) / 2
			local padY = (600 - boxH) / 2
			local nameTop = padY - nameH - 3

			data.box.Size = UDim2.new(0, boxW, 0, boxH)
			data.box.Position = UDim2.new(0, padX, 0, padY)

			data.boxStroke.Thickness = math.clamp(boxH / 80, 1, 3)

			data.name.Size = UDim2.new(0, boxW, 0, nameH)
			data.name.Position = UDim2.new(0, padX, 0, nameTop)
			data.name.TextSize = nameH * 0.85

			data.healthBg.Size = UDim2.new(0, 3, 0, boxH)
			data.healthBg.Position = UDim2.new(0, padX - 5, 0, padY)

			local infoY = padY + boxH + 3
			data.distance.Size = UDim2.new(0, boxW, 0, 14)
			data.distance.Position = UDim2.new(0, padX, 0, infoY)
			data.distance.TextSize = math.clamp(11 * (boxH / 100), 9, 16)

			data.role.Size = UDim2.new(0, boxW, 0, 14)
			data.role.Position = UDim2.new(0, padX, 0, infoY + 15)

			local isMM2 = game.PlaceId == 142823291
			local on = espSettings["ESP"] == true
			data.box.Visible = on and espSettings["ESP Box"] == true
			data.name.Visible = on and espSettings["ESP Name"] == true
			data.healthBg.Visible = on and espSettings["ESP HealthBar"] == true
			data.distance.Visible = on and espSettings["ESP Distance"] == true
			data.role.Visible = on and espSettings["ESP Role"] == true and isMM2

			if data.name.Visible then
				data.name.Text = p.DisplayName
			end
			if data.healthBg.Visible then
				local hp = math.clamp(hum.Health / hum.MaxHealth, 0, 1)
				data.healthFill.Size = UDim2.new(1, 0, hp, 0)
				data.healthFill.BackgroundColor3 = Color3.new(1 - hp, hp, 0)
			end
			if data.distance.Visible then
				local myHrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
				if myHrp then
					local d = math.floor((hrp.Position - myHrp.Position).Magnitude)
					data.distance.Text = d .. " studs"
				end
			end
			if data.role.Visible then
				local role = getPlayerRole(p)
				data.role.Text = role
				if role == "Sheriff" then
					data.role.TextColor3 = Color3.fromRGB(60, 140, 255)
				elseif role == "Murderer" then
					data.role.TextColor3 = Color3.fromRGB(220, 60, 60)
				else
					data.role.TextColor3 = Color3.fromRGB(60, 200, 80)
				end
			end
		else
			if espGuis[p] then destroyESP(p) end
		end
	end

	for p in pairs(espGuis) do
		if not game:GetService("Players"):FindFirstChild(p.Name) then
			destroyESP(p)
		end
	end
end

task.spawn(function()
	while screenGui.Parent do
		pcall(updateESP)
		task.wait()
	end
end)

-- Populate content for each tab
local function populateContent(tabName)
	clearContent()
	if tabName == "Visuals" then
		local espToggles = {"ESP", "ESP Box", "ESP Name", "ESP HealthBar", "ESP Skeleton", "ESP Distance"}
		for _, name in ipairs(espToggles) do
			createToggle(contentContainer, name, function(state)
				if name == "ESP" then
					espEnabled = state
				end
				espSettings[name] = state
			end)
		end
		if game.PlaceId == 142823291 then
			createToggle(contentContainer, 'ESP Role  <font color="#C84040">MM2</font>', function(state)
				espSettings["ESP Role"] = state
			end)
		end
	end
end

-- Tab indicator (parented to mainFrame to avoid UIListLayout)
local tabIndicator = Instance.new("Frame")
tabIndicator.Size = UDim2.new(0, 2, 0, 20)
tabIndicator.BackgroundColor3 = accentColor
tabIndicator.BorderSizePixel = 0
tabIndicator.Visible = false
tabIndicator.Parent = mainFrame

-- Tab buttons
local tabs = {"Combat", "Movement", "Visuals", "Other"}
local tabButtons = {}
local selectedTab = nil

local function animateIndicator(btn)
	local btnPos = btn.AbsolutePosition
	local framePos = mainFrame.AbsolutePosition
	local offsetY = btnPos.Y - framePos.Y

	tabIndicator.Visible = true
	tweenService:Create(tabIndicator, tweenInfo, {
		Position = UDim2.new(0, 0, 0, offsetY),
		Size = UDim2.new(0, 2, 0, btn.AbsoluteSize.Y),
	}):Play()
end

local function createTabButton(name)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, -6, 0, 28)
	btn.Position = UDim2.new(0, 3, 0, 0)
	btn.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
	btn.BackgroundTransparency = 1
	btn.Text = ""
	btn.BorderSizePixel = 0
	btn.AutoButtonColor = false
	btn.Parent = tabsContainer

	local btnLabel = Instance.new("TextLabel")
	btnLabel.Size = UDim2.new(1, -14, 1, 0)
	btnLabel.Position = UDim2.new(0, 10, 0, 0)
	btnLabel.BackgroundTransparency = 1
	btnLabel.Text = name
	btnLabel.TextColor3 = mutedColor
	btnLabel.Font = font
	btnLabel.TextSize = 14
	btnLabel.TextXAlignment = Enum.TextXAlignment.Left
	btnLabel.TextYAlignment = Enum.TextYAlignment.Center
	btnLabel.BorderSizePixel = 0
	btnLabel.Parent = btn

	local function select()
		if selectedTab then
			local prev = tabButtons[selectedTab]
			prev.label.TextColor3 = mutedColor
			tweenService:Create(prev.label, tweenInfo, {Position = UDim2.new(0, 10, 0, 0)}):Play()
		end
		selectedTab = name
		btnLabel.TextColor3 = textColor
		tweenService:Create(btnLabel, tweenInfo, {Position = UDim2.new(0, 16, 0, 0)}):Play()

		animateIndicator(btn)
		contentTitle.Text = name
		populateContent(name)
	end

	tabButtons[name] = {
		button = btn,
		label = btnLabel,
		select = select,
	}

	btn.MouseButton1Click:Connect(select)

	return btn
end

for _, tabName in ipairs(tabs) do
	createTabButton(tabName)
end

-- Dragging
local function makeDraggable(frame, bar)
	local dragging, dragInput, startPos, startMousePos
	bar.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			startPos = frame.Position
			startMousePos = input.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	bar.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement then
			dragInput = input
		end
	end)
	userInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			local delta = input.Position - startMousePos
			frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		end
	end)
end

makeDraggable(loadingFrame, titleBar)
makeDraggable(mainFrame, mainTitleBar)

-- Unload
unloadBtn.MouseButton1Click:Connect(function()
	for p in pairs(espGuis) do
		pcall(espGuis[p].gui.Destroy, espGuis[p].gui)
	end
	table.clear(espGuis)
	if inputConnection then
		inputConnection:Disconnect()
	end
	screenGui:Destroy()
end)

-- Visibility toggle
local guiOpen = false

local inputConnection = userInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	if input.KeyCode == Enum.KeyCode.Delete then
		guiOpen = not guiOpen
		mainFrame.Visible = guiOpen
		if not guiOpen and loadingFrame.Visible then
			loadingFrame.Visible = false
		end
	end
end)

-- Loading animation
local steps = 20
local stepTime = 0.08
local currentStep = 0

local function runLoading()
	loadingFrame.Visible = true
	currentStep = 0
	while currentStep <= steps do
		local progress = currentStep / steps
		progressFill.Size = UDim2.new(progress, 0, 1, 0)
		percentLabel.Text = math.floor(progress * 100) .. "%"

		if progress >= 1 then
			percentLabel.Text = "100%"
			progressFill.Size = UDim2.new(1, 0, 1, 0)

			task.wait(0.3)
			loadingFrame.Visible = false
			mainFrame.Visible = true
			guiOpen = true

			if tabButtons["Combat"] then
				tabButtons["Combat"].select()
			end
			break
		end

		currentStep += 1
		task.wait(stepTime)
	end
end

task.wait(0.1)
runLoading()
