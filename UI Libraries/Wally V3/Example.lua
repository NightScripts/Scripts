-- Load the Library
local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/N1GHTLY/Script-File/main/UI%20Libraries/Wally%20V3/Source.lua')))()

-- Create a Window
local window = library:CreateWindow("Window")

-- Add Folder (Basically a Tab)
local main = window:CreateFolder("Tab 1")

-- Add Label
main:Label("i got no maidens",{ -- Self Explaining
    TextSize = 19; -- Self Explaining
    TextColor = Color3.fromRGB(420,420,420); -- Self Explaining
    BgColor = Color3.fromRGB(69,69,69); -- Self Explaining

}) 

-- Add Button
main:Button("Button",function()
    print("i am maidenless") -- remove = gay
end)

-- Add Toggle
main:Toggle("Toggle",function(bool)
    shared.toggle = bool
    print(shared.toggle)
end)

-- Add Slider
main:Slider("Slider",{
    min = 10; -- min value of the slider
    max = 50; -- max value of the slider
    precise = true; -- max 2 decimals
},function(value)
    print(value)
end)

-- Add Dropdown
main:Dropdown("Dropdown",{"English","or","Spanish"},true,function(choose) --true/false, replaces the current title "Dropdown" with the option that t
    print(choose)
end)

-- Add Key/Bind
main:Bind("Bind",Enum.KeyCode.C,function() --Default bind
    print("i love femboys")
end)

-- Add Colorpicker
main:ColorPicker("ColorPicker",Color3.fromRGB(69,69,69),function(color) --Default color
    print(color)
end)

-- Add textbox | Parameters: {"Name","string/number"}
main:Box("Box","number",function(value) 
    print(value)
end)

-- One line delete
main:DestroyGui()

--[[
How to refresh a dropdown 101 tutorial updated 2032
1)Create the dropdown and save it in a variable
local yourvariable = b:Dropdown("Hi",yourtable,function(a)
    print(a)
end)
2)Refresh it using the function
yourvariable:Refresh(yourtable)
How to refresh a label:
1)Create your label and save it in a variable
local yourvariable = b:Label("Pretty Useless NGL",{
    TextSize = 25; -- Self Explaining
    TextColor = Color3.fromRGB(255,255,255);
    BgColor = Color3.fromRGB(69,69,69);
})
2)Refresh it using the function
yourvariable:Refresh("Hello") It will only change the text ofc
]]

-- I didn't copy this shit
