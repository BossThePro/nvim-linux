-- Set path here:
path = "/mnt/927A-68F7/projects/manim/"

local manimRender = function(manimRender)
	-- Grabbing the current working directory and removing everything but the last part (current folder)
	local class = manimRender.args
	local a = vim.fn.system("! pwd")
	-- If path is not set then we do nothing
	if path == "" then
		finalPath = a
	-- Else we remove everything as specified above
	else 
		a = a.gsub(a,".*/","")
		a = a.gsub(a, "\n", "")
		finalPath = path .. a .. "/"
	end
	local bufName = vim.fn.expand("%")
	print(finalPath)
	-- Creates the file for previewing manim output
	local startTime = os.time()
	local timer = vim.loop.new_timer()
	timer:start(0, 1000, vim.schedule_wrap(function()
		local elapsed = os.time() - startTime
		vim.api.nvim_command('echo "Manim running... ' .. elapsed .. 's"')
	end))
	local cmd = "manim -qk " .. bufName .. " " .. class .. " --media_dir " .. finalPath
	bufName = bufName.gsub(bufName, ".py", "")
	local finalVideoLocation = finalPath .. "videos/" .. bufName .. "/2160p60/"
	vim.fn.jobstart(cmd, {
		on_exit = function(_, exit_code)
		timer:stop()
		timer:close()
		print("Manim finished outputting to folder " .. finalVideoLocation)
	end
	})
	return 0
end

local manimPreview = function (manimPreview)
	-- Grabbing the current working directory and removing everything but the last part (current folder)
	local class = manimPreview.args
	local a = vim.fn.system("! pwd")
	-- If path is not set then we do nothing
	if path == "" then
		finalPath = a
	-- Else we remove everything as specified above
	else 
		a = a.gsub(a,".*/","")
		a = a.gsub(a, "\n", "")
		finalPath = path .. a .. "/"
	end
	local bufName = vim.fn.expand("%")
	print(finalPath)
	-- Creates the file for previewing manim output
	local startTime = os.time()
	local timer = vim.loop.new_timer()
	timer:start(0, 1000, vim.schedule_wrap(function()
		local elapsed = os.time() - startTime
		vim.api.nvim_command('echo "Manim running... ' .. elapsed .. 's"')
	end))
	local cmd = "manim -pqm " .. bufName .. " " .. class .. " --media_dir " .. finalPath
	vim.fn.jobstart(cmd, {
		on_exit = function(_, exit_code)
		timer:stop()
		timer:close()
		print("Manim finished outputting")
	end
	})
	return 0
end


vim.api.nvim_create_user_command("ManimPreview", manimPreview, 
{
	nargs = 1,
	desc = "Outputs a Manim Preview File and plays it back",
})
vim.api.nvim_create_user_command("ManimRender", manimRender, 
{
	nargs = 1,
	desc = "Outputs a Manim Render File",
})
