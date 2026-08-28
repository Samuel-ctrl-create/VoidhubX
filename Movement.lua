local Movement = {}

function Movement.SetSpeed(humanoid, speed)
	if not humanoid then
		return
	end

	humanoid.WalkSpeed = speed
end

function Movement.SetJumpPower(humanoid, power)
	if not humanoid then
		return
	end

	humanoid.UseJumpPower = true
	humanoid.JumpPower = power
end

function Movement.Dash(root, power)
	if not root then
		return
	end

	root.AssemblyLinearVelocity =
		root.CFrame.LookVector * power
end

function Movement.Reset(humanoid)
	if not humanoid then
		return
	end

	humanoid.WalkSpeed = 16
	humanoid.UseJumpPower = true
	humanoid.JumpPower = 50
end

return Movement
