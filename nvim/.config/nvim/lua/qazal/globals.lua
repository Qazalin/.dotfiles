P = function(v)
	print(vim.inspect(v))
	return v
end

R = function(name)
	return require("plenary.reload").reload_module(name)
end
