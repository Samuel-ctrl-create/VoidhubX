local Teleport = {}

function Teleport.ToPart(character, part)
	if not character or not part then
		return false
	end

	local root = character:FindFirstChild("HumanoidRootPart")

	if not root then
		return false
	end

	root.CFrame = part.CFrame + Vector3.new(0, 3, 0)

	return true
end

function Teleport.ToPosition(character, position)
	if not character then
		return false
	end

	local root = character:FindFirstChild("HumanoidRootPart")

	if not root then
		return false
	end

	root.CFrame = CFrame.new(position)

	return true
end

function Teleport.GetTeleportPoints(folder)
	if not folder then
		return {}
	end

	local points = {}

	for _, object in ipairs(folder:GetChildren()) do
		if object:IsA("BasePart") then
			table.insert(points, object)
		end
	end

	return points
end

return Teleport
