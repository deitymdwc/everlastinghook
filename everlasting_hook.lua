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

	tabButtons[name] = {
		button = btn,
		label = btnLabel,
	}

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
	end

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
	screenGui:Destroy()
end)

-- Visibility toggle
local guiOpen = false

userInputService.InputBegan:Connect(function(input, gameProcessed)
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
				tabButtons["Combat"].button.MouseButton1Click:Fire()
			end
			break
		end

		currentStep += 1
		task.wait(stepTime)
	end
end

task.wait(0.1)
runLoading()
