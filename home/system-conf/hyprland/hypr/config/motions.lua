hl.gesture({
	fingers = 3, -- Number of fingers for the swipe
	direction = "horizontal", -- Swipe left or right
	action = "workspace", -- Switches workspaces
})

-- Optional: Add a 4-finger swipe for special workspace toggling
hl.gesture({
	fingers = 4,
	direction = "vertical",
	action = "special",
	workspace_name = "magic", -- Toggles the special workspace named "magic"
})

-- @param direction (string) "next" or "prev"
local function cycle_occupied_workspace(direction)
	-- Get the monitor that currently has focus
	local active_monitor = hl.get_active_monitor()
	if not active_monitor then
		return
	end -- Safety check

	local monitor_workspaces = {}
	for _, ws in ipairs(hl.get_workspaces()) do
		if ws.monitor and ws.monitor.id == active_monitor.id and not ws.special then
			table.insert(monitor_workspaces, ws)
		end
	end

	if #monitor_workspaces <= 1 then
		return
	end

	table.sort(monitor_workspaces, function(a, b)
		return a.id < b.id
	end)

	local active_workspace = hl.get_active_workspace()
	local current_index = nil
	for i, ws in ipairs(monitor_workspaces) do
		if ws.id == active_workspace.id then
			current_index = i
			break
		end
	end

	if not current_index then
		return
	end

	local target_index
	if direction == "next" then
		target_index = current_index + 1
		if target_index > #monitor_workspaces then
			target_index = 1
		end
	elseif direction == "prev" then
		target_index = current_index - 1
		if target_index < 1 then
			target_index = #monitor_workspaces
		end
	else
		return
	end

	-- Focus the target workspace
	local target_workspace = monitor_workspaces[target_index]
	hl.dispatch(hl.dsp.focus({ workspace = target_workspace.id }))
end

hl.bind("ALT + LEFT", function()
	cycle_occupied_workspace("prev")
end)
hl.bind("ALT + RIGHT", function()
	cycle_occupied_workspace("next")
end)

hl.bind("SUPER + TAB", function()
	cycle_occupied_workspace("next")
end)
hl.bind("SUPER + SHIFT + TAB", function()
	cycle_occupied_workspace("prev")
end)
