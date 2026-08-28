local Combat = {}

function Combat.FindTarget(character, targets, range)
	if not character then
		return nil
	end

	local root = character:FindFirstChild("HumanoidRootPart")

	if not root then
		return nil
	end

	local closest = nil
	local closestDistance = range or 50

	for _, target in ipairs(targets) do
		local targetRoot =
			target:FindFirstChild("HumanoidRootPart")

		local humanoid =
			target:FindFirstChildOfClass("Humanoid")

		if targetRoot and humanoid and humanoid.Health > 0 then
			local distance =
				(root.Position - targetRoot.Position).Magnitude

			if distance <= closestDistance then
				closest = target
				closestDistance = distance
			end
		end
	end

	return closest
end

function Combat.DamageTarget(target, damage)
	if not target then
		return
	end

	local humanoid =
		target:FindFirstChildOfClass("Humanoid")

	if humanoid then
		humanoid:TakeDamage(damage or 10)
	end
end

return Combat
