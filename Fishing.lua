local Fishing = {}

function Fishing.Start(callback, interval)
	local running = true

	task.spawn(function()
		while running do
			if callback then
				callback()
			end

			task.wait(interval or 2)
		end
	end)

	return function()
		running = false
	end
end

function Fishing.CastPerfect(power)
	-- Sistema para o seu próprio jogo.
	-- "power" pode representar a força do lançamento.

	return {
		success = true,
		power = power or 100
	}
end

function Fishing.CatchPerfect()
	-- Resultado perfeito para o sistema
	-- de pesca do seu próprio jogo.

	return {
		success = true,
		quality = "Perfect"
	}
end

return Fishing
