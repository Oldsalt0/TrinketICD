-- Main Frame
local TrinketFrame = CreateFrame("Frame", "TrinketFrame", UIParent)
TrinketFrame:SetPoint("CENTER")
TrinketFrame:SetWidth(77)
TrinketFrame:SetHeight(30)
TrinketFrame:SetClampedToScreen(true)

-- Movable Main Frame
TrinketFrame:SetMovable(true)
TrinketFrame:EnableMouse(true)
TrinketFrame:RegisterForDrag("LeftButton", "RightButton")
TrinketFrame:SetScript("OnDragStart", function() TrinketFrame:StartMoving() end)
TrinketFrame:SetScript("OnDragStop", function() TrinketFrame:StopMovingOrSizing() end)

-- Scalable Frame Script
TrinketFrame:EnableMouseWheel(true)
TrinketFrame:SetScript("OnMouseWheel", function(self, delta)
	if delta > 0 then
		if TrinketFrame:GetScale() < 1.5 then
			TrinketFrame:SetScale(TrinketFrame:GetScale() + 0.1)
			trinketFrameScale = TrinketFrame:GetScale()
		end
	else
		if TrinketFrame:GetScale() > 1 then
			TrinketFrame:SetScale(TrinketFrame:GetScale() - 0.1)
			trinketFrameScale = TrinketFrame:GetScale()
		end
	end
end)



-- TRINKET 1 FRAME

-- Texture Frame
local Trinket1Frame = CreateFrame("Frame", "Trinket1Frame", TrinketFrame)
Trinket1Frame:SetWidth(30)
Trinket1Frame:SetHeight(30)
Trinket1Frame:SetPoint("TOPLEFT", 0, 0)
Trinket1Texture = Trinket1Frame:CreateTexture(Trinket1Texture)
Trinket1Texture:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
Trinket1Texture:SetAllPoints()

-- Cooldown Frame
local Trinket1Cooldown = CreateFrame("Cooldown", "Trinket1Cooldown", Trinket1Frame, "CooldownFrameTemplate")
Trinket1Cooldown:SetAllPoints()

-- Cooldown Font
local Trinket1FontFrame = CreateFrame("Frame", "Trinket1FontFrame", TrinketFrame)
Trinket1FontFrame:SetWidth(30)
Trinket1FontFrame:SetHeight(30)
Trinket1FontFrame:SetPoint("TOPLEFT", 0, 0)
Trinket1FontFrame:SetFrameLevel(4)
local Trinket1Font = Trinket1FontFrame:CreateFontString("Trinket1Font", "ARTWORK", "GameFontNormal")
Trinket1Font:SetFont("Fonts\\FRIZQT__.TTF", 16)
Trinket1Font:SetAllPoints()
Trinket1Font:SetTextColor(1, 1, 0)
local Trinket1HiddenFont = CreateFrame("Button")
Trinket1HiddenFont:SetText("")
Trinket1HiddenFont:Hide()

-- Heroic Mark
local Trinket1HeroicFont = Trinket1Frame:CreateFontString("Trinket1HeroicFont", "ARTWORK", "GameFontNormal")
Trinket1HeroicFont:SetFont("Fonts\\FRIZQT__.TTF", 8, "OUTLINE")
Trinket1HeroicFont:SetPoint("TOPLEFT", 19, -20)
Trinket1HeroicFont:SetTextColor(0, 1, 0)
Trinket1HeroicFont:SetText("H")
Trinket1HeroicFont:Hide()

-- OnUpdate Function
local Trinket1UpdateFrame = CreateFrame("Frame")
local function Trinket1Updater(self, elapsed)
	if (Trinket1HiddenFont:GetText() - elapsed) > 0 then
		Trinket1HiddenFont:SetText(Trinket1HiddenFont:GetText() - elapsed)
		Trinket1Font:SetText(floor(Trinket1HiddenFont:GetText()))
	else
		Trinket1Font:SetText("")
		Trinket1HiddenFont:SetText("")
		Trinket1UpdateFrame:SetScript("OnUpdate", nil)
	end
end



-- TRINKET 2 FRAME

-- Texture Frame
local Trinket2Frame = CreateFrame("Frame", "Trinket2Frame", TrinketFrame)
Trinket2Frame:SetWidth(30)
Trinket2Frame:SetHeight(30)
Trinket2Frame:SetPoint("TOPLEFT", 30, 0)
Trinket2Texture = Trinket2Frame:CreateTexture(Trinket2Texture)
Trinket2Texture:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
Trinket2Texture:SetAllPoints()

-- Cooldown Frame
local Trinket2Cooldown = CreateFrame("Cooldown", "Trinket2Cooldown", Trinket2Frame, "CooldownFrameTemplate")
Trinket1Cooldown:SetAllPoints()

-- Cooldown Font
local Trinket2FontFrame = CreateFrame("Frame", "Trinket2FontFrame", TrinketFrame)
Trinket2FontFrame:SetWidth(30)
Trinket2FontFrame:SetHeight(30)
Trinket2FontFrame:SetPoint("TOPLEFT", 30, 0)
Trinket2FontFrame:SetFrameLevel(4)
local Trinket2Font = Trinket2FontFrame:CreateFontString("Trinket2Font", "ARTWORK", "GameFontNormal")
Trinket2Font:SetFont("Fonts\\FRIZQT__.TTF", 16)
Trinket2Font:SetAllPoints()
Trinket2Font:SetTextColor(1, 1, 0)
local Trinket2HiddenFont = CreateFrame("Button")
Trinket2HiddenFont:SetText("")
Trinket2HiddenFont:Hide()

-- Heroic Mark
local Trinket2HeroicFont = Trinket2Frame:CreateFontString("Trinket2HeroicFont", "ARTWORK", "GameFontNormal")
Trinket2HeroicFont:SetFont("Fonts\\FRIZQT__.TTF", 8, "OUTLINE")
Trinket2HeroicFont:SetPoint("TOPLEFT", 19, -20)
Trinket2HeroicFont:SetTextColor(0, 1, 0)
Trinket2HeroicFont:SetText("H")
Trinket2HeroicFont:Hide()

-- OnUpdate Second Function
local Trinket2UpdateFrame = CreateFrame("Frame")
local function Trinket2Updater(self, elapsed)
	if (Trinket2HiddenFont:GetText() - elapsed) > 0 then
		Trinket2HiddenFont:SetText(Trinket2HiddenFont:GetText() - elapsed)
		Trinket2Font:SetText(floor(Trinket2HiddenFont:GetText()))
	else
		Trinket2Font:SetText("")
		Trinket2HiddenFont:SetText("")
		Trinket2UpdateFrame:SetScript("OnUpdate", nil)
	end
end



-- SETTINGS FRAMES

-- Settings Button
local TrinketSettingsButton = CreateFrame("Button", "TrinketSettingsButton", TrinketFrame)
TrinketSettingsButton:SetWidth(17)
TrinketSettingsButton:SetHeight(17)
TrinketSettingsButton:SetPoint("TOPLEFT", TrinketFrame, 60, -13)
local TrinketSettingsButtonTexture = TrinketSettingsButton:CreateTexture()
TrinketSettingsButtonTexture:SetAllPoints()
TrinketSettingsButtonTexture:SetTexture("Interface\\AddOns\\TrinketICD\\icon-config.tga")
TrinketSettingsButton:SetScript("OnClick", function()
	if not TrinketSettingsFrame:IsShown() then
		TrinketSettingsFrame:Show()
		PlaySound("UChatScrollButton")
	end
end)
TrinketFrame:SetScript("OnEnter", function() TrinketSettingsButton:Show() end)
TrinketSettingsButton:SetScript("OnEnter", function() TrinketSettingsButton:Show() end)
TrinketFrame:SetScript("OnLeave", function() TrinketSettingsButton:Hide() end)
TrinketSettingsButton:SetScript("OnLeave", function() TrinketSettingsButton:Hide() end)

-- Settings Frame
local TrinketSettingsFrame = CreateFrame("Frame", "TrinketSettingsFrame", UIParent)
TrinketSettingsFrame:SetPoint("CENTER")
TrinketSettingsFrame:SetClampedToScreen(true)
TrinketSettingsFrame:SetWidth(180)
TrinketSettingsFrame:SetHeight(400)
TrinketSettingsFrame:SetBackdrop({
	bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
	edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
	tile = false,
	edgeSize = 16
})
TrinketSettingsFrame:SetBackdropBorderColor(0, 0, 0)
TrinketSettingsFrame:SetMovable(true)
TrinketSettingsFrame:EnableMouse(true)
TrinketSettingsFrame:CreateTitleRegion():SetAllPoints()
TrinketSettingsFrame:SetUserPlaced(true)
TrinketSettingsFrame:Hide()

-- Save Button
local TrinketSaveButton = CreateFrame("Button", "TrinketSaveButton", TrinketSettingsFrame)
TrinketSaveButton:SetPoint("TOPLEFT", TrinketSettingsFrame, 65, -370)
TrinketSaveButton:SetWidth(52)
TrinketSaveButton:SetHeight(20)

-- Save Text
local TrinketSaveFont = TrinketSettingsFrame:CreateFontString("TrinketSaveFont", "ARTWORK", "GameFontNormal")
TrinketSaveFont:SetPoint("TOPLEFT", TrinketSettingsFrame, 68, -373)
TrinketSaveFont:SetFont("Fonts\\FRIZQT__.TTF", 15)
TrinketSaveFont:SetJustifyH("LEFT")
TrinketSaveFont:SetText("|cff349d34Save")

-- Save Button Script
TrinketSaveButton:SetScript("OnClick", function()
	PlaySound("UChatScrollButton")
	trinket1Table[2] = Trinket1IconName:GetText()
	Trinket1Texture:SetTexture("Interface\\Icons\\"..Trinket1IconName:GetText())
	trinket1Table[3] = Trinket1ICDValue:GetText()
	trinket1Table[4] = Trinket1Aura1:GetText()
	trinket1Table[5] = Trinket1Aura2:GetText()
	trinket1Table[6] = Trinket1Aura3:GetText()
	trinket1Table[7] = Trinket1Aura4:GetText()
	trinket2Table[2] = Trinket2IconName:GetText()
	Trinket2Texture:SetTexture("Interface\\Icons\\"..Trinket2IconName:GetText())
	trinket2Table[3] = Trinket2ICDValue:GetText()
	trinket2Table[4] = Trinket2Aura1:GetText()
	trinket2Table[5] = Trinket2Aura2:GetText()
	trinket2Table[6] = Trinket2Aura3:GetText()
	trinket2Table[7] = Trinket2Aura4:GetText()
	TrinketSettingsFrame:Hide()
end)


-- TRINKET 1 SETTINGS

-- Title Check Button
local Trinket1TitleButton = CreateFrame("CheckButton", "Trinket1TitleButton", TrinketSettingsFrame, "InterfaceOptionsCheckButtonTemplate")
Trinket1TitleButton:SetPoint("TOPLEFT", TrinketSettingsFrame, 10, -10)
Trinket1TitleButton:SetHitRectInsets(0, -100, 0, 0)
Trinket1TitleButton:SetWidth(30)
Trinket1TitleButton:SetHeight(30)

-- Title
local Trinket1TitleFont = TrinketSettingsFrame:CreateFontString("Trinket1TitleFont", "ARTWORK", "GameFontNormal")
Trinket1TitleFont:SetPoint("TOPLEFT", TrinketSettingsFrame, 43, -15)
Trinket1TitleFont:SetFont("Fonts\\FRIZQT__.TTF", 20)
Trinket1TitleFont:SetJustifyH("LEFT")
Trinket1TitleFont:SetText("Trinket 1:")

-- Title Check Script
Trinket1TitleButton:SetScript("OnClick", function()
	if Trinket1TitleButton:GetChecked() then
		trinket1Table[1] = 1
		Trinket1Frame:Show()
		Trinket1FontFrame:Show()
	else
		trinket1Table[1] = 0
		Trinket1Frame:Hide()
		Trinket1FontFrame:Hide()
	end
end)

-- Icon Text
local Trinket1IconFont = TrinketSettingsFrame:CreateFontString("Trinket1IconFont", "ARTWORK", "GameFontNormal")
Trinket1IconFont:SetPoint("TOPLEFT", TrinketSettingsFrame, 10, -45)
Trinket1IconFont:SetFont("Fonts\\FRIZQT__.TTF", 12)
Trinket1IconFont:SetJustifyH("LEFT")
Trinket1IconFont:SetText("Icon\nname:")

-- Icon Input Box
local Trinket1IconName = CreateFrame("EditBox", "Trinket1IconName", TrinketSettingsFrame, "InputBoxTemplate")
Trinket1IconName:SetPoint("TOPLEFT", TrinketSettingsFrame, 60, -50)
Trinket1IconName:SetWidth(100)
Trinket1IconName:SetHeight(25)
Trinket1IconName:SetAutoFocus(false)
Trinket1IconName:SetScript("OnEnter", function()
	GameTooltip:SetOwner(Trinket1IconName, "ANCHOR_TOPLEFT", 0, -5)
	GameTooltip:SetText("You can click on its icon on Wowhead to get it")
	GameTooltip:Show()
	GameTooltip:FadeOut()
end)

-- ICD Text
local Trinket1ICDFont = TrinketSettingsFrame:CreateFontString("Trinket1ICDFont", "ARTWORK", "GameFontNormal")
Trinket1ICDFont:SetPoint("TOPLEFT", TrinketSettingsFrame, 10, -80)
Trinket1ICDFont:SetFont("Fonts\\FRIZQT__.TTF", 12)
Trinket1ICDFont:SetJustifyH("LEFT")
Trinket1ICDFont:SetText("ICD (value in s.):")

-- ICD Input Box
local Trinket1ICDValue = CreateFrame("EditBox", "Trinket1ICDValue", TrinketSettingsFrame, "InputBoxTemplate")
Trinket1ICDValue:SetPoint("TOPLEFT", TrinketSettingsFrame, 125, -75)
Trinket1ICDValue:SetWidth(35)
Trinket1ICDValue:SetHeight(25)
Trinket1ICDValue:SetAutoFocus(false)
Trinket1ICDValue:SetNumeric(true)
Trinket1ICDValue:SetMaxLetters(3)

-- Aura(s) Text
local Trinket1AuraFont = TrinketSettingsFrame:CreateFontString("Trinket1AuraFont", "ARTWORK", "GameFontNormal")
Trinket1AuraFont:SetPoint("TOPLEFT", TrinketSettingsFrame, 10, -112)
Trinket1AuraFont:SetFont("Fonts\\FRIZQT__.TTF", 12)
Trinket1AuraFont:SetJustifyH("LEFT")
Trinket1AuraFont:SetText("Aura(s):")

-- Aura 1 Input Box
local Trinket1Aura1 = CreateFrame("EditBox", "Trinket1Aura1", TrinketSettingsFrame, "InputBoxTemplate")
Trinket1Aura1:SetPoint("TOPLEFT", TrinketSettingsFrame, 65, -100)
Trinket1Aura1:SetWidth(45)
Trinket1Aura1:SetHeight(25)
Trinket1Aura1:SetAutoFocus(false)
Trinket1Aura1:SetNumeric(true)
Trinket1Aura1:SetMaxLetters(5)

-- Aura 2 Input Box
local Trinket1Aura2 = CreateFrame("EditBox", "Trinket1Aura2", TrinketSettingsFrame, "InputBoxTemplate")
Trinket1Aura2:SetPoint("TOPLEFT", TrinketSettingsFrame, 115, -100)
Trinket1Aura2:SetWidth(45)
Trinket1Aura2:SetHeight(25)
Trinket1Aura2:SetAutoFocus(false)
Trinket1Aura2:SetNumeric(true)
Trinket1Aura2:SetMaxLetters(5)

-- Aura 3 Input Box
local Trinket1Aura3 = CreateFrame("EditBox", "Trinket1Aura3", TrinketSettingsFrame, "InputBoxTemplate")
Trinket1Aura3:SetPoint("TOPLEFT", TrinketSettingsFrame, 65, -120)
Trinket1Aura3:SetWidth(45)
Trinket1Aura3:SetHeight(25)
Trinket1Aura3:SetAutoFocus(false)
Trinket1Aura3:SetNumeric(true)
Trinket1Aura3:SetMaxLetters(5)

-- Aura 4 Input Box
local Trinket1Aura4 = CreateFrame("EditBox", "Trinket1Aura4", TrinketSettingsFrame, "InputBoxTemplate")
Trinket1Aura4:SetPoint("TOPLEFT", TrinketSettingsFrame, 115, -120)
Trinket1Aura4:SetWidth(45)
Trinket1Aura4:SetHeight(25)
Trinket1Aura4:SetAutoFocus(false)
Trinket1Aura4:SetNumeric(true)
Trinket1Aura4:SetMaxLetters(5)

-- Heroic Mark Check Button
local Trinket1HeroicMarkButton = CreateFrame("CheckButton", "Trinket1HeroicMarkButton", TrinketSettingsFrame, "InterfaceOptionsCheckButtonTemplate")
Trinket1HeroicMarkButton:SetPoint("TOPLEFT", TrinketSettingsFrame, 10, -145)
Trinket1HeroicMarkButton:SetHitRectInsets(0, -90, 0, 0)

-- Heroic Mark Text
local Trinket1HeroicMarkFont = TrinketSettingsFrame:CreateFontString("Trinket1HeroicMarkFont", "ARTWORK", "GameFontNormal")
Trinket1HeroicMarkFont:SetPoint("TOPLEFT", TrinketSettingsFrame, 37, -151)
Trinket1HeroicMarkFont:SetFont("Fonts\\FRIZQT__.TTF", 12)
Trinket1HeroicMarkFont:SetJustifyH("LEFT")
Trinket1HeroicMarkFont:SetText("Heroic trinket")

-- Heroic Mark Check Script
Trinket1HeroicMarkButton:SetScript("OnClick", function()
	if Trinket1HeroicMarkButton:GetChecked() then
		trinket1Table[8] = 1
		Trinket1HeroicFont:Show()
	else
		trinket1Table[8] = 0
		Trinket1HeroicFont:Hide()
	end
end)


-- TRINKET 2 SETTINGS

-- Title Check Button
local Trinket2TitleButton = CreateFrame("CheckButton", "Trinket2TitleButton", TrinketSettingsFrame, "InterfaceOptionsCheckButtonTemplate")
Trinket2TitleButton:SetPoint("TOPLEFT", TrinketSettingsFrame, 10, -190)
Trinket2TitleButton:SetHitRectInsets(0, -100, 0, 0)
Trinket2TitleButton:SetWidth(30)
Trinket2TitleButton:SetHeight(30)

-- Title
local Trinket2TitleFont = TrinketSettingsFrame:CreateFontString("Trinket2TitleFont", "ARTWORK", "GameFontNormal")
Trinket2TitleFont:SetPoint("TOPLEFT", TrinketSettingsFrame, 43, -195)
Trinket2TitleFont:SetFont("Fonts\\FRIZQT__.TTF", 20)
Trinket2TitleFont:SetJustifyH("LEFT")
Trinket2TitleFont:SetText("Trinket 2:")

-- Title Check Script
Trinket2TitleButton:SetScript("OnClick", function()
	if Trinket2TitleButton:GetChecked() then
		trinket2Table[1] = 1
		Trinket2Frame:Show()
		Trinket2FontFrame:Show()
		TrinketFrame:SetWidth(77)
		TrinketSettingsButton:SetPoint("TOPLEFT", TrinketFrame, 60, -13)
	else
		trinket2Table[1] = 0
		Trinket2Frame:Hide()
		Trinket2FontFrame:Hide()
		TrinketSettingsButton:SetPoint("TOPLEFT", TrinketFrame, 30, -13)
		TrinketFrame:SetWidth(47)
	end
end)

-- Icon Text
local Trinket2IconFont = TrinketSettingsFrame:CreateFontString("Trinket2IconFont", "ARTWORK", "GameFontNormal")
Trinket2IconFont:SetPoint("TOPLEFT", TrinketSettingsFrame, 10, -225)
Trinket2IconFont:SetFont("Fonts\\FRIZQT__.TTF", 12)
Trinket2IconFont:SetJustifyH("LEFT")
Trinket2IconFont:SetText("Icon\nname:")

-- Icon Input Box
local Trinket2IconName = CreateFrame("EditBox", "Trinket2IconName", TrinketSettingsFrame, "InputBoxTemplate")
Trinket2IconName:SetPoint("TOPLEFT", TrinketSettingsFrame, 60, -230)
Trinket2IconName:SetWidth(100)
Trinket2IconName:SetHeight(25)
Trinket2IconName:SetAutoFocus(false)
Trinket2IconName:SetScript("OnEnter", function()
	GameTooltip:SetOwner(Trinket2IconName, "ANCHOR_TOPLEFT", 0, -5)
	GameTooltip:SetText("You can click on its icon on Wowhead to get it")
	GameTooltip:Show()
	GameTooltip:FadeOut()
end)

-- ICD Text
local Trinket2ICDFont = TrinketSettingsFrame:CreateFontString("Trinket2ICDFont", "ARTWORK", "GameFontNormal")
Trinket2ICDFont:SetPoint("TOPLEFT", TrinketSettingsFrame, 10, -260)
Trinket2ICDFont:SetFont("Fonts\\FRIZQT__.TTF", 12)
Trinket2ICDFont:SetJustifyH("LEFT")
Trinket2ICDFont:SetText("ICD (value in s.):")

-- ICD Input Box
local Trinket2ICDValue = CreateFrame("EditBox", "Trinket2ICDValue", TrinketSettingsFrame, "InputBoxTemplate")
Trinket2ICDValue:SetPoint("TOPLEFT", TrinketSettingsFrame, 125, -255)
Trinket2ICDValue:SetWidth(35)
Trinket2ICDValue:SetHeight(25)
Trinket2ICDValue:SetAutoFocus(false)
Trinket2ICDValue:SetNumeric(true)
Trinket2ICDValue:SetMaxLetters(3)

-- Aura(s) Text
local Trinket2AuraFont = TrinketSettingsFrame:CreateFontString("Trinket2AuraFont", "ARTWORK", "GameFontNormal")
Trinket2AuraFont:SetPoint("TOPLEFT", TrinketSettingsFrame, 10, -292)
Trinket2AuraFont:SetFont("Fonts\\FRIZQT__.TTF", 12)
Trinket2AuraFont:SetJustifyH("LEFT")
Trinket2AuraFont:SetText("Aura(s):")

-- Aura 1 Input Box
local Trinket2Aura1 = CreateFrame("EditBox", "Trinket2Aura1", TrinketSettingsFrame, "InputBoxTemplate")
Trinket2Aura1:SetPoint("TOPLEFT", TrinketSettingsFrame, 65, -280)
Trinket2Aura1:SetWidth(45)
Trinket2Aura1:SetHeight(25)
Trinket2Aura1:SetAutoFocus(false)
Trinket2Aura1:SetNumeric(true)
Trinket2Aura1:SetMaxLetters(5)

-- Aura 2 Input Box
local Trinket2Aura2 = CreateFrame("EditBox", "Trinket2Aura2", TrinketSettingsFrame, "InputBoxTemplate")
Trinket2Aura2:SetPoint("TOPLEFT", TrinketSettingsFrame, 115, -280)
Trinket2Aura2:SetWidth(45)
Trinket2Aura2:SetHeight(25)
Trinket2Aura2:SetAutoFocus(false)
Trinket2Aura2:SetNumeric(true)
Trinket2Aura2:SetMaxLetters(5)

-- Aura 3 Input Box
local Trinket2Aura3 = CreateFrame("EditBox", "Trinket2Aura3", TrinketSettingsFrame, "InputBoxTemplate")
Trinket2Aura3:SetPoint("TOPLEFT", TrinketSettingsFrame, 65, -300)
Trinket2Aura3:SetWidth(45)
Trinket2Aura3:SetHeight(25)
Trinket2Aura3:SetAutoFocus(false)
Trinket2Aura3:SetNumeric(true)
Trinket2Aura3:SetMaxLetters(5)

-- Aura 4 Input Box
local Trinket2Aura4 = CreateFrame("EditBox", "Trinket2Aura4", TrinketSettingsFrame, "InputBoxTemplate")
Trinket2Aura4:SetPoint("TOPLEFT", TrinketSettingsFrame, 115, -300)
Trinket2Aura4:SetWidth(45)
Trinket2Aura4:SetHeight(25)
Trinket2Aura4:SetAutoFocus(false)
Trinket2Aura4:SetNumeric(true)
Trinket2Aura4:SetMaxLetters(5)

-- Heroic Mark Check Button
local Trinket2HeroicMarkButton = CreateFrame("CheckButton", "Trinket2HeroicMarkButton", TrinketSettingsFrame, "InterfaceOptionsCheckButtonTemplate")
Trinket2HeroicMarkButton:SetPoint("TOPLEFT", TrinketSettingsFrame, 10, -325)
Trinket2HeroicMarkButton:SetHitRectInsets(0, -90, 0, 0)

-- Heroic Mark Text
local Trinket2HeroicMarkFont = TrinketSettingsFrame:CreateFontString("Trinket2HeroicMarkFont", "ARTWORK", "GameFontNormal")
Trinket2HeroicMarkFont:SetPoint("TOPLEFT", TrinketSettingsFrame, 37, -331)
Trinket2HeroicMarkFont:SetFont("Fonts\\FRIZQT__.TTF", 12)
Trinket2HeroicMarkFont:SetJustifyH("LEFT")
Trinket2HeroicMarkFont:SetText("Heroic trinket")

-- Heroic Mark Check Script
Trinket2HeroicMarkButton:SetScript("OnClick", function()
	if Trinket2HeroicMarkButton:GetChecked() then
		trinket2Table[8] = 1
		Trinket2HeroicFont:Show()
	else
		trinket2Table[8] = 0
		Trinket2HeroicFont:Hide()
	end
end)



-- OnEvent Script
TrinketFrame:RegisterEvent("UNIT_AURA")
TrinketFrame:RegisterEvent("PLAYER_LOGIN")
TrinketFrame:SetScript("OnEvent", function(self, event, arg1)
	if event == "PLAYER_LOGIN" then
		if not trinketFrameScale then
			trinketFrameScale = 1
		else
			TrinketFrame:SetScale(trinketFrameScale)
		end
		if not trinket1Table then
			trinket1Table = {}
			Trinket1TitleButton:SetChecked()
			trinket1Table[1] = 1
		else
			if trinket1Table[1] == 1 then
				Trinket1TitleButton:SetChecked()
			else
				Trinket1Frame:Hide()
				Trinket1FontFrame:Hide()
			end
			if trinket1Table[2] then
				Trinket1IconName:SetText(trinket1Table[2])
				Trinket1Texture:SetTexture("Interface\\Icons\\"..Trinket1IconName:GetText())
			end
			if trinket1Table[3] then
				Trinket1ICDValue:SetText(trinket1Table[3])
			end
			if trinket1Table[4] then
				Trinket1Aura1:SetText(trinket1Table[4])
			end
			if trinket1Table[5] then
				Trinket1Aura2:SetText(trinket1Table[5])
			end
			if trinket1Table[6] then
				Trinket1Aura3:SetText(trinket1Table[6])
			end
			if trinket1Table[7] then
				Trinket1Aura4:SetText(trinket1Table[7])
			end
			if trinket1Table[8] == 1 then
				Trinket1HeroicMarkButton:SetChecked()
				Trinket1HeroicFont:Show()
			end
		end
		if not trinket2Table then
			trinket2Table = {}
			Trinket2TitleButton:SetChecked()
			trinket2Table[1] = 1
		else
			if trinket2Table[1] == 1 then
				Trinket2TitleButton:SetChecked()
			else
				Trinket2Frame:Hide()
				Trinket2FontFrame:Hide()
				TrinketSettingsButton:SetPoint("TOPLEFT", TrinketFrame, 30, -13)
				TrinketFrame:SetWidth(47)
			end
			if trinket2Table[2] then
				Trinket2IconName:SetText(trinket2Table[2])
				Trinket2Texture:SetTexture("Interface\\Icons\\"..Trinket2IconName:GetText())
			end
			if trinket2Table[3] then
				Trinket2ICDValue:SetText(trinket2Table[3])
			end
			if trinket2Table[4] then
				Trinket2Aura1:SetText(trinket2Table[4])
			end
			if trinket2Table[5] then
				Trinket2Aura2:SetText(trinket2Table[5])
			end
			if trinket2Table[6] then
				Trinket2Aura3:SetText(trinket2Table[6])
			end
			if trinket2Table[7] then
				Trinket2Aura4:SetText(trinket2Table[7])
			end
			if trinket2Table[8] == 1 then
				Trinket2HeroicMarkButton:SetChecked()
				Trinket2HeroicFont:Show()
			end
		end
		TrinketFrame:UnregisterEvent("PLAYER_LOGIN")
	end
	if Trinket1Frame:IsShown() and event == "UNIT_AURA" and arg1 == "player" and (Trinket1HiddenFont:GetText() == "" or Trinket1HiddenFont:GetText() == nil) then
		for i=1,40 do
			if select(1, UnitBuff("player", i)) == nil then
				break
			else
				local _, _, _, _, _, _, _, _, _, _, spellID = UnitBuff("player", i)
				if spellID == tonumber(Trinket1Aura1:GetText()) or spellID == tonumber(Trinket1Aura2:GetText()) or spellID == tonumber(Trinket1Aura3:GetText()) or spellID == tonumber(Trinket1Aura4:GetText()) then
					Trinket1HiddenFont:SetText(Trinket1ICDValue:GetText())
					Trinket1Cooldown:SetCooldown(GetTime(), Trinket1ICDValue:GetText())
					Trinket1UpdateFrame:SetScript("OnUpdate", Trinket1Updater)
				end
			end
		end
	end
	if Trinket2Frame:IsShown() and event == "UNIT_AURA" and arg1 == "player" and (Trinket2HiddenFont:GetText() == "" or Trinket2HiddenFont:GetText() == nil) then
		for i=1,40 do
			if select(1, UnitBuff("player", i)) == nil then
				break
			else
				local _, _, _, _, _, _, _, _, _, _, spellID = UnitBuff("player", i)
				if spellID == tonumber(Trinket2Aura1:GetText()) or spellID == tonumber(Trinket2Aura2:GetText()) or spellID == tonumber(Trinket2Aura3:GetText()) or spellID == tonumber(Trinket2Aura4:GetText()) then
					Trinket2HiddenFont:SetText(Trinket2ICDValue:GetText())
					Trinket2Cooldown:SetCooldown(GetTime(), Trinket2ICDValue:GetText())
					Trinket2UpdateFrame:SetScript("OnUpdate", Trinket2Updater)
				end
			end
		end
	end
end)