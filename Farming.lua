local Farming = {}

function Farming.GetTargets(folder)
	if not folder then
		return {}
	end

	local targets = {}

	for _, object in ipairs(folder:GetChildren()) do
		local humanoid = object:FindFirstChildOfClass("Humanoid")

		if humanoid and humanoid.Health > 0 then
			table.insert(targets, object)
		end
	end

	return targets
end

function Farming.GetNearestTarget(character, folder, maxDistance)
	if not character or not folder then
		return nil
	end

	local root = character:FindFirstChild("HumanoidRootPart")

	if not root then
		return nil
	end

	local nearest = nil
	local nearestDistance = maxDistance or 100

	for _, target in ipairs(Farming.GetTargets(folder)) do
		local targetRoot = target:FindFirstChild("HumanoidRootPart")

		if targetRoot then
			local distance =
				(root.Position - targetRoot.Position).Magnitude

			if distance <= nearestDistance then
				nearest = target
				nearestDistance = distance
			end
		end
	end

	return nearest
end

function Farming.Start(callback, interval)
	local running = true

	task.spawn(function()
		while running do
			if callback then
				callback()
			end

			task.wait(interval or 1)
		end
	end)

	return function()
		running = false
	end
end

return Farming
