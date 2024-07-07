-- Load the Library
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/N1GHTLY/Script-File/main/UI Libraries/Unknown UI/Source.lua"))()

-- Create a Window
local example = library:CreateWindow({
    text = "Window"
})

-- Add Label
example:AddLabel("Label", function(a, ss)
end)

-- Add Button
example:AddButton("Button", function()
	print("I am maidenless")
end)

-- Add Toggle
example:AddToggle("Toggle", function(value)
  print(value)
end)

-- Add Dropdown
example:AddDropdown({"Hello!","Hi!"},function(state)
   print(state)
end)

-- Add Textbox
example:AddBox("Box", function(txt, bool)
	if bool then
		getgenv().speed = tonumber(txt.Text)
	end
end)
