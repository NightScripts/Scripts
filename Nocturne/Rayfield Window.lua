local Window = Rayfield:CreateWindow({
   Name = "Nocturne | Open Source | ID:1",
   Icon = 0, 
   LoadingTitle = "Kamehameha Simulator",
   LoadingSubtitle = "by NightScripts",
   Theme = "Default",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = Nocturne, 
      FileName = "Nocturne"
   },

   Discord = {
      Enabled = false, 
      Invite = "noinvitelink", 
      RememberJoins = true 
    },

   KeySystem = false,
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", 
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"Hello"} 
    }
})
