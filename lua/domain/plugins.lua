local packer = nil
local function init()
	if packer == nil then
		packer = require('packer')
		packer.init({
			disable_commands = true,
			max_jobs = 50,
		})
	end
	local use = packer.use
	packer.reset()

	-- === load on startup and config in lua/plugin or none ===
	use {
		'nvim-lua/popup.nvim'        , 'nvim-lua/plenary.nvim'    , 'tjdevries/astronauta.nvim'    ,
		'junegunn/vim-peekaboo'      , 'kshenoy/vim-signature'    , 'romainl/vim-qf'               ,
		'junegunn/fzf.vim'           , 'tpope/vim-commentary'     , 'tpope/vim-eunuch'             ,
		'godlygeek/tabular'          , 'tpope/vim-surround'       , 'tpope/vim-repeat'             ,
		'tpope/vim-fugitive'         , 'tpope/vim-rhubarb'        , 'junegunn/gv.vim'              ,
		'tpope/vim-scriptease'       , 'monaqa/dial.nvim'         , 'kyazdani42/nvim-web-devicons' ,
		'tjdevries/colorbuddy.nvim'  , 'liuchengxu/vim-which-key' , 'lervag/wiki.vim'              ,
		'rhysd/clever-f.vim'         , 'lewis6991/gitsigns.nvim'  , 'norcalli/nvim-colorizer.lua'  ,
		'glepnir/indent-guides.nvim' , 'Raimondi/delimitMate'     ,
	} -- 'mhinz/vim-signify' 'psliwka/vim-smoothie'

	--    === apparatuses ===
	use {'wbthomason/packer.nvim', opt = true}
	use {'kyazdani42/nvim-tree.lua', cmd = 'NvimTreeToggle',
		config = function() require('ploog.nvtree') end
	}
	use {
		{'neomake/neomake', cmd = 'Neomake'},
		{'bfredl/nvim-luadev', cmd = 'Luadev'}
	}
	use {'gyim/vim-boxdraw', opt = true}
	use {'pechorin/any-jump.vim', config = function() require('ploog.anyjump') end,
		cmd = {'AnyJump', 'AnyJumpVisual', 'AnyJumpBack', 'AnyJumpLastResults'}
	}

	--    === SCOUR ===
	use {'nvim-lua/telescope.nvim', config = function() require('klooj.telescope') end,
		requires = {'nvim-telescope/telescope-fzy-native.nvim', 'brooth/far.vim',
			'nvim-telescope/telescope-github.nvim', 'nvim-telescope/telescope-symbols.nvim',
			'nvim-telescope/telescope-fzf-writer.nvim',
			{'nvim-telescope/telescope-frecency.nvim', requires = 'tami5/sql.nvim'}
		}
	}

	--   === treating text like objects ===
	use {'ntpeters/vim-better-whitespace', event = 'InsertLeavePre *',
		config = function() require('ploog.whitespace') end
	}
	use {'AndrewRadev/sideways.vim', cmd = {'SidewaysLeft', 'SidewaysRight'}}

	--   === setup, startup, syntax, session ===
	use {'dhruvasagar/vim-prosession', cmd = 'Prosession',
		requires = {'tpope/vim-obsession', opt = true},
		config = function() require('ploog.prosession') end
	}
	use {'mbbill/undotree', cmd = 'UndotreeToggle',
		config = function() require('ploog.undotree') end
	}

	--   === debug ===
	use {'dstein64/vim-startuptime', cmd = 'StartupTime'}
	use {'puremourning/vimspector', opt = true,
		requires = {'nvim-telescope/telescope-vimspector.nvim', opt = true}
	}

	--   ===  treesitter, ===
	use {'nvim-treesitter/nvim-treesitter',
		requires = {'nvim-treesitter/nvim-treesitter-textobjects', 'p00f/nvim-ts-rainbow',
			'nvim-treesitter/nvim-treesitter-refactor', 'romgrk/nvim-treesitter-context',
		}
	}

	-- === completion, lsp, & snippets ===
	use {'SirVer/ultisnips', requires = 'honza/vim-snippets'}
	use {'neovim/nvim-lspconfig',
		requires = {'tjdevries/nlua.nvim', 'nvim-lua/lsp-status.nvim'}
	}
	use {'nvim-lua/completion-nvim', requires = 'aca/completion-tabnine'}

	--    === ui accoutrement ===
	use {
		{'glepnir/zephyr-nvim', opt = true},
		{'ishan9299/modus-theme-vim', opt = true},
		{'Th3Whit3Wolf/spacebuddy', opt = true},
	}
	use {'glepnir/galaxyline.nvim', 'romgrk/barbar.nvim'}

	-- === filetype/syntax specific ===
	-- |> ansible
	use {'pearofducks/ansible-vim', config = function() require('ploog.ansible') end,
		ft = {'yaml', 'yaml.ansible', 'yml'}
	}
	use {'Glench/Vim-Jinja2-Syntax', ft = {'html', 'jinja', 'yaml', 'yaml.ansible'}}
	-- |>  R
	use {'jalvesaq/Nvim-R', ft = {'R'}}
	-- |>  python
	use {'psf/black', ft = {'python'},
		requires = {'tjdevries/py_package.nvim', 'tjdevries/apyrori.nvim'}
	}
	-- |> markdown
	use {'dkarter/bullets.vim', config = function() require('ploog.bullets') end}
	use {'reedes/vim-pencil', config = function() require('ploog.markdown') end,
		ft = {'markdown', 'wiki'}, requires = {'itspriddle/vim-marked', 'plasticboy/vim-markdown'}
	}
	-- |> json
	use {'prettier/vim-prettier', requires = 'elzr/vim-json',
		ft = {'javascript', 'typescript', 'less', 'css', 'json', 'graphql', 'markdown'}
	}
end

local plugins = setmetatable({}, {
	__index = function(_, key)
		init()
		return packer[key]
	end
})

return plugins

---------------------------
-- treesitter
-- 'nvim-treesitter/nvim-treesitter-textobjects',
-- {'nvim-treesitter/playground', cmd = 'TSPlaygroundToggle', config = 'require("klooj.tsPlayground")'}}

-- === git ===
-- use {'will133/vim-dirdiff', cmd = 'DirDiff',
-- config = function()
-- vim.cmd[[ let g:DirDiffExcludes = ".netrwhist, CVS,*.class,*.exe,*.swp,*.git,git*,*.DS_Store" ]]
-- end}
--  https://github.com/stsewd/fzf-checkout.vim

-- use {'tpope/vim-dispatch', cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

-- use 'SidOfc/mkdx'
-- use {'SidOfc/mkdx', ft = {'markdown'}}

-- moved configs to lua/plugin
-- use {'', config = function() require("ploog.wiki") end}
-- use {'', config = function() require('ploog.cleverf') end}
-- use {'', config = function() require('ploog.anyjump') end}


-- use {'neoclide/coc.nvim', branch = 'release', ft = {'markdown'},
-- config = 'vim.g.coc_global_extensions = {"coc-markdownlint", "coc-json"}'}

-- mess from before switching back to ultisnips:
-- use {'nvim-lua/completion-nvim', event = 'InsertEnter *', config = function()
--   vim.cmd [[ augroup comps ]]
--   vim.cmd [[ au BufRead,BufNewFile * if (&buftype != "prompt") && (&buftype != "nofile") | lua require'completion'.on_attach() ]]
--   vim.cmd [[ augroup END ]]
--   require('klooj.completion')
--   require('completion').on_attach()
--   vim.cmd [[ doautoall FileType ]]
-- end, requires = {
--   {'aca/completion-tabnine', after = 'completion-nvim'}
-- }}
-- use {'hrsh7th/vim-vsnip', requires = 'hrsh7th/vim-vsnip-integ', config = 'require("ploog.vsnip")'}
-- use {'SirVer/ultisnips', requires = 'honza/vim-snippets', config = 'require("ploog.ultisnips")'}
-- use {'norcalli/snippets.nvim', config = 'require("snippets").use_suggested_mappings()'}
-- use {'ojroques/nvim-lspfuzzy', config = 'require("lspfuzzy").setup{}}'

-- for fixing the completion in prompt issue
-- vim.cmd [[au BufEnter * if &filetype !='TelescopePrompt' | lua require('klooj.completion').imply() ]]
-- use 'nvim-treesitter/completion-treesitter'


--[[
'cespare/vim-toml', ft = {'toml'}
'andymass/vim-matchup'
'chaoren/vim-wordmotion''
'junegunn/vim-easy-align',
'justinmk/vim-dirvish'
'kristijanhusak/vim-dirvish-git'
'machakann/vim-sandwich'             -- replacement for surround, eh
'hrsh7th/vim-vsnip', 'hrsh7th/vim-vsnip-integ'
'mattn/vim-sonictemplate'
'nvim-lua/lsp_extensions.nvim',
'Olical/vim-enmasse'
'rhysd/vim-clang-format', opt = true, rocks = {'lua-cjson', 'lpeg', 'asdf'}
'steelsojka/completion-buffers'
'tjdevries/express_line.nvim', opt = true
'tjdevries/gruvbuddy.nvim', opt = true
'tjdevries/vim-inyoface',
'tpope/vim-abolish'                   -- search, substitute, or abbreviate words variants
'tpope/vim-sexp-mappings-for-regular-people'
'wellle/targets.vim'
'justinmk/vim-sneak',
'airblade/vim-rooter', config = 'require("klooj.rooter")'}
'mharington/formatter.nvim', cmd = 'Format', config = 'require("klooj.formatter")'}
'AndrewRadev/splitjoin.vim', 'preservim/nerdcommenter',
use {'mfussenegger/nvim-dap', opt = true, requires = {'theHamsta/nvim-dap-virtual-text',
'mfussenegger/nvim-dap-python', 'nvim-telescope/telescope-dap.nvim'}}
use {'tjdevries/conf.vim', opt = true, requires = {'tjdevries/standard.vim','skywind3000/quickmenu.vim'}}
use {'voldikss/vim-floaterm', opt = true, config = 'require("ploog.floaterm")',
requires = 'voldikss/fzf-floaterm'}
{'romgrk/doom-one.vim', opt = true}

]]
