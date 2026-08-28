local Config = {}

Config.Defaults = {
	WalkSpeed = 16,
	JumpPower = 50,
	DashPower = 80,
	AutoClickInterval = 0.1,
	FishingInterval = 2,
	FlySpeed = 50,

	Fly = false,
	Speed = false,
	JumpBoost = false,
	AutoClick = false,
	AutoFish = false,
	PerfectCast = false,
	ESP = false,
}

Config.Limits = {
	MaxWalkSpeed = 100,
	MaxJumpPower = 150,
	MaxDashPower = 200,
	MaxFlySpeed = 150,
}

return Config
