local fn = {}

NVNoNeckPain = {
	"shortcuts/no-neck-pain.nvim",
	opts = {
		width = 150,
		autocmds = {
			enableOnVimEnter = true,
			skipEnteringNoNeckPainBuffer = true,
		},
	},
}

return { NVNoNeckPain }
