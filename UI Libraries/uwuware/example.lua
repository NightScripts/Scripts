-- Load the Library 
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/NightScripts/Script-File/main/UI%20Libraries/uwuware/src/OriginalSource.lua", true))()
-- Create a Window
local window = library:CreateWindow("Window")

-- Add Folder (Basically a Tab)
local main = window:AddFolder("Folder")

-- Add Label
main:AddLabel({
	text = "Truth",
	type = "i got no maidens"
})

-- Add Button
main:AddButton({
	text = "Button",
	flag = "button",
	callback = function()
	print("i am maidenless")
end
})

-- Add Toggle
main:AddToggle({
	text = "Toggle",
	flag = "toggle",
	callback = function(value)
	print(value)
end
})

-- Add Slider
main:AddSlider({
  text = "Slider",
	min = 34,
	max = 69,
	dual = true,
	type = "slider",
	callback = function(value)
	print(value)
end
})

-- Add Dropdown
main:AddList({
    text = "Color",
    values = {"English", "or", "Spanish"},
    callback = function(value)
        print("Selected option:", value)
    end,
    open = false,
    flag = "color_option"
})

-- Add Key/Bind
main:AddBind({
    text = "bind",
    key = "X",
    hold = false,
    callback = function(value)
        print("i love femboys")
    end
})
-- library:Close() -- Close the Library
library:Init() -- Loads the Library
