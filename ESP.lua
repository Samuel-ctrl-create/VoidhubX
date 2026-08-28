local ESP = {}

function ESP.CreateHighlight(object)
	if not object then
		return nil
	end

	local highlight = object:FindFirstChild("VoidESP")

	if highlight then
		return highlight
	end

	highlight = Instance.new("Highlight")
	highlight.Name = "VoidESP"
	highlight.FillTransparency = 0.7
	highlight.OutlineTransparency = 0
	highlight.Parent = object

	return highlight
end

function ESP.RemoveHighlight(object)
	if not object then
		return
	end

	local highlight = object:FindFirstChild("VoidESP")

	if highlight then
		highlight:Destroy()
	end
end

function ESP.Clear(folder)
	if not folder then
		return
	end

	for _, object in ipairs(folder:GetChildren()) do
		ESP.RemoveHighlight(object)
	end
end

function ESP.ApplyToFolder(folder)
	if not folder then
		return
	end

	for _, object in ipairs(folder:GetChildren()) do
		if object:IsA("Model") then
			ESP.CreateHighlight(object)
		end
	end
end

return ESP
