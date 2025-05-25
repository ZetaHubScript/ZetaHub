local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🌸 ZETA HUB 🌸",
   LoadingTitle = "🌸 ZETA HUB 🌸",
   LoadingSubtitle = "by exx",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil,
      FileName = "ZETA HUB"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },
   KeySystem = true,
   KeySettings = {
   Title = "",
   Subtitle = "Enter your key",
   Note = "",
   FileName = "ZETA HUB",
   SaveKey = true,
   GrabKeyFromSite = true,
   Key = {"<V0fL)bSdI10"},
    }
})

local MainTab = Window:CreateTab("🏠 Home", nil)
local MainSection = MainTab:CreateSection("Main")

Rayfield:Notify({
   Title = "GL",
   Content = "have fun",
   Duration = 5,
   Image = 13047715178,
   Actions = {
      Ignore = {
         Name = "Okay!",
         Callback = function()
            print("The user tapped Okay!")
         end
      },
   },
})

local ButtonDupe = MainTab:CreateButton({
   Name = "Dupe",
   Callback = function()
       local player = game.Players.LocalPlayer
       local character = player.Character
       if character then
           local tool = character:FindFirstChildOfClass("Tool")
           if tool then
               local clone = tool:Clone()
               clone:SetAttribute("IsDupe", true)  -- Отмечаем как дюпнутый
               clone.Parent = player.Backpack
               print("Item visually duplicated!")
           else
               print("Hold an item in your hands!")
           end
       end
   end,
})
local MainSection = MainTab:CreateSection("Other")

local Button = MainTab:CreateButton({
   Name = "Infinite Jump Toggle",
   Callback = function()
       _G.infinjump = not _G.infinjump
       if _G.infinJumpStarted == nil then
           _G.infinJumpStarted = true
           game.StarterGui:SetCore("SendNotification", {Title="Zeta"; Text="Infinite Jump Activated!"; Duration=5;})
           local plr = game:GetService('Players').LocalPlayer
           local m = plr:GetMouse()
           m.KeyDown:connect(function(k)
               if _G.infinjump then
                   if k:byte() == 32 then
                       humanoid = game:GetService'Players'.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
                       humanoid:ChangeState('Jumping')
                       wait()
                       humanoid:ChangeState('Seated')
                   end
               end
           end)
       end
   end,
})

local Slider = MainTab:CreateSlider({
   Name = "JumpPower Slider",
   Range = {1, 350},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "sliderjp",
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = (Value)
   end,
})

local Input = MainTab:CreateInput({
   Name = "Walkspeed",
   PlaceholderText = "1-500",
   RemoveTextAfterFocusLost = true,
   Callback = function(Text)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Text)
   end,
})

local TeleportTab = Window:CreateTab("🏝 Teleports", nil)

local ButtonGear = TeleportTab:CreateButton({
   Name = "Gear Shop",
   Callback = function()
       local player = game.Players.LocalPlayer
       local character = player.Character
       if character and character:FindFirstChild("HumanoidRootPart") then
           character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-284.61, 2.99, -32.78)) -- Замените на реальные координаты
       else
           print("Cord not found!")
       end
   end,
})

local ButtonPetSeller = TeleportTab:CreateButton({
   Name = "Pet Seller",
   Callback = function()
       local player = game.Players.LocalPlayer
       local character = player.Character
       if character and character:FindFirstChild("HumanoidRootPart") then
           character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-281.23, 2.99, 9.024)) -- Замените на реальные координаты
       else
           print("Cord not found!")
       end
   end,
})

local ButtonOwl = TeleportTab:CreateButton({
   Name = "Owl",
   Callback = function()
       local player = game.Players.LocalPlayer
       local character = player.Character
       if character and character:FindFirstChild("HumanoidRootPart") then
           character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-101.53, 4.40, -9.13)) -- Замените на реальные координаты
       else
           print("Cord not found!")
       end
   end,
})

local MiscTab = Window:CreateTab("🎲 Misc", nil)

local ButtonClearDupe = MiscTab:CreateButton({
   Name = "Clear Duped Items",
   Callback = function()
       local player = game.Players.LocalPlayer
       local backpack = player.Backpack
       for _, item in pairs(backpack:GetChildren()) do
           if item:GetAttribute("IsDupe") == true then
               item:Destroy()
           end
       end
       print("Duped items cleared!")
   end,
})
