local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

return Rayfield:CreateWindow({
   Name = "Nocturne | Open Source | ID:" .. tostring(game.PlaceId),
   Icon = 0,
   LoadingTitle = "Kamehameha Simulator",
   LoadingSubtitle = "by NightScripts",
   Theme = "Default",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = true,
      FolderName = Nocturne,
      FileName = "Nocturne",
   },

   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true,
   },

   KeySystem = false,
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"Hello"},
   },
})
