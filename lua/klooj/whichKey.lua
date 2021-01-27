local opts = {
  fallback_to_native_key = 1,
  timeout                = 100,
  ignore_invalid_key     = 1,
  run_map_on_popup       = 1,
  sep                    = '→',
  display_names          = {['<CR>'] = '↵', ['<TAB>'] = '⇆'},
  hspace                 = 2,
  flatten                = 1,
  align_by_seperator     = 1,
  use_floating_win       = 1,
  position               = 'botright',
}

VG("which_key_", opts)

-- alias foo.pack="cds ~/.local/share/nvim/site/pack/packer"
vim.g.which_key_map = {
  [',']       = 'comment'              ,
  ['.']       = 'vimrc'                ,
  ['<Left>']  = 'move buffer next'     ,
  ['<Right>'] = 'move buffer previous' ,
  ['=']       = 'balance windows'      ,
  ['h']       = 'split below'          ,
  ['H']       = 'treesitter highlight' ,
  ['j']       = 'any jump'             ,
  ['k']       = 'pick buffer'          ,
  ['v']       = 'split right'          ,
  ['V']       = 'vsplit open file'     ,
  ['z']       = 'edit zshrc'           ,

  ['a']  = {
    ['name'] = '+actions'      ,
    ['#'] = 'Random number'    ,
    ['c'] = 'colorizer'        ,
    ['h'] = 'help tags'        ,
    ['r'] = 'reload a lua module' ,
    ['u'] = 'undo tree'        ,
    ['w'] = 'strip whitespace' ,
    ['p'] = {
      ['name'] = '+packer' ,
      ['c'] = 'clean'      ,
      ['i'] = 'install'    ,
      ['p'] = 'compile'    ,
      ['s'] = 'sync'       ,
      ['u'] = 'update'     ,
    },
  },
  ['A'] = {
    ['name'] = '+Add Package' ,
    ['c'] = 'load conf plug'  ,
    ['d'] = 'load DAP'        ,
    ['l'] = 'load lua repl'   ,
    ['v'] = 'load vimspector' ,
  },
  ['b'] = {
    ['name'] = '+buffer'          ,
    ['b'] = 'bind scroll'         ,
    ['c'] = 'blackhole c'         ,
    ['d'] = 'blackhole d'         ,
    ['h'] = 'switch split V -> H' ,
    ['O'] = 'order by dir'        ,
    ['p'] = 'pick buffer'         ,
    ['R'] = 'close to the right'  ,
    ['s'] = 'swap windows'        ,
    ['v'] = 'switch split H -> V' ,
    ['w'] = 'wipeout'             ,
    ['x'] = 'close buffer'        ,
    ['X'] = 'close all others'    ,
    ['o'] = {
      ['name'] = '+buffer options' ,
      ['c'] = 'hl cursor col'      ,
      ['C'] = 'no hl cursor'       ,
      ['n'] = 'no line-numbers'  ,
      ['N'] = 'line numbers'     ,
      ['w'] = 'grey col 80'        ,
      ['W'] = 'cyan col 80'        ,
    },
  },
  ['d'] = {
    ['name'] = '+debug' ,
    ['a'] = 'code actions'              ,
    ['L'] = 'send REPL line'            ,
    ['l'] = 'show line diag'            ,
    ['M'] = 'neomake'                   ,
    ['n'] = 'next'                      ,
    ['p'] = 'previous'                  ,
    ['r'] = 'references'                ,
    ['R'] = 'rename'                    ,
    ['S'] = 'send REPL selection'       ,
    ['s'] = 'sign func with its result' ,
    ['w'] = 'workspace_symbols'         ,
  },
  ['e'] = {
    ['name'] = '+edit'           ,
    ['.'] = 'nvimrc'              ,
    [';'] = 'open last jump file' ,
    ['c'] = 'completions'         ,
    ['e'] = 'insert emojis'       ,
    ['i'] = 'lua/init'            ,
    ['k'] = 'keymaps'             ,
    ['l'] = 'my snipptets'        ,
    ['L'] = 'lsp_config'          ,
    ['p'] = 'lua plugins'         ,
    ['w'] = 'which-key maps'      ,
  },
  ['f'] = {
    ['name'] = '+find' ,
    ['/'] = 'fuzzy buffer'        ,
    [';'] = 'reopen last search'  ,
    ['a'] = 'autocommands'        ,
    ['A'] = 'all files'           ,
    ['B'] = 'list builtins'       ,
    ['b'] = 'open_buffers'        ,
    ['c'] = 'select colorscheme'  ,
    ['d'] = 'fd'                  ,
    ['f'] = 'rg | fzf'            ,
    ['g'] = 'live_grep'           ,
    ['G'] = {
      ['name'] = '+Git'           ,
      ['b'] = 'ls branches w/log preview'      ,
      ['c'] = 'ls buff commits w/diff preview' ,
      ['C'] = 'ls commits w/diff preview'      ,
      ['s'] = 'per files changes'              ,
      ['g'] = 'find in git files'              ,
    },
    ['h'] = 'command_history'     ,
    ['H'] = 'help_tags'           ,
    ['i'] = {
      ['name'] = '+in .../',
        ['d'] = 'dotfiles/'      ,
        ['k'] = 'klooj/'         ,
        ['n'] = 'FOONV/'         ,
        ['p'] = 'packer plugins/' ,
        ['v'] = 'nvim runtime/'   ,
        ['z'] = 'zdots/'         ,
    },
    ['l'] = {
      ['name'] = '+list',
      ['h'] = 'highlights'        ,
      ['k'] = 'keymaps'             ,
      ['m'] = 'marks'             ,
      ['o'] = 'old_files'         ,
      ['r'] = 'registers'         ,
      ['t'] = 'buffer tags'       ,
      ['v'] = 'vim options'       ,
    },
    ['L'] = {
      ['name'] = '+LSP',
      ['a'] = 'code actions'       ,
      ['A'] = 'range code actions' ,
      ['d'] = 'document symbols'   ,
      ['r'] = 'references'         ,
      ['w'] = 'workspace symbols'  ,
    },
    ['p'] = 'project search'   ,
    ['q'] = 'quickfix'         ,
    ['R'] = 'grepper_replace?' ,
    ['s'] = 'staged_search'    ,
    ['t'] = 'treesitter'       ,
    ['T'] = 'recursive tags'   ,
    ['w'] = 'grep_cursor'      ,
    ['W'] = 'grepper_word?'    ,
  },
  ['g'] = {
    ['name'] = '+git'             ,
    ['a'] = 'add all'             ,
    ['b'] = 'browse'              ,
    ['c'] = 'commit'              ,
    ['d'] = 'diff current file'   ,
    ['f'] = 'diff get left'       ,
    ['j'] = 'diff get right'      ,
    ['L'] = 'lazy git'            ,
    ['l'] = 'log'                 ,
    ['m'] = 'merge tool'          ,
    ['p'] = 'pull'                ,
    ['P'] = 'push'                ,
    ['S'] = 'status'              ,
    ['s'] = 'status'              ,
    ['V'] = 'view buffer commits' ,
    ['v'] = 'view commits'        ,
  },
  ['m'] = {
    ['name'] = '+markdown',
    ['-'] = 'checkbox previous'     ,
    ['='] = 'checkbox next'         ,
    [','] = 'CSV to table'          ,
    ['/'] = 'italicize'             ,
    ['`'] = 'wrap with inline code' ,
    ['\''] = 'toggle quote'         ,
    ['['] = 'promote header'        ,
    [']'] = 'demote header'         ,
    ['b'] = 'bold'                  ,
    ['i'] = 'generate/update TOC'   ,
    ['I'] = 'quickfix TOC'          ,
    ['j'] = 'jump to header'        ,
    ['k'] = 'toggle kbd shortcut'   ,
    ['L'] = 'quickfix deadlinks'    ,
    ['t'] = 'toggle checkBOX'       ,
    ['lt'] = 'toggle checkLIST'     ,
    ['ll'] = 'toggle list'          ,
    ['ln'] = 'wrap link'            ,
    ['O'] = 'Obsidian'              ,
    ['s'] = 'strikethrough'         ,
    ['p'] = {
      ['name'] = '+preview' ,
      ['o'] = 'open'        ,
      ['q'] = 'quit'        ,
      ['t'] = 'toggle'      ,
    },
  },
  ['t'] = {
    ['name'] = '+tabularize'    ,
    ['f'] = { ['name'] = '+first' },
    ['R'] = { ['name'] = '+replace' },
  },
  ['q'] = {
    ['name'] = '+quickfix'    ,
    ['p'] = 'qf_previous'     ,
    ['n'] = 'qf_next'         ,
    ['['] = 'loc_previous'    ,
    [']'] = 'loc_next'        ,
    ['j'] = 'qf_switch'       ,
    ['t'] = 'qf_toggle'       ,
    ['s'] = 'qf_toggle_stay'  ,
    ['T'] = 'loc_toggle'      ,
    ['S'] = 'loc_toggle_stay' ,
    ['o'] = 'older'           ,
    ['r'] = 'newer'           ,
    ['b'] = 'previous_file'   ,
    ['f'] = 'next_file'       ,
  },
}

vim.g.lo_key_map = {
--   ['l'] = 'file info'           ,
--   ['t'] = 'right align keyword' ,
--   ['d'] = {
--     ['name']= '+lsp_&_diagnostic'       ,
--     ['a'] = 'code action'               ,
--     ['d'] = 'definition'                ,
--     ['i'] = 'implementation'            ,
--     ['l'] = 'line'                      ,
--     ['n'] = 'go to next diagnostic'     ,
--     ['p'] = 'go to previous diagnostic' ,
--     ['r'] = 'references'                ,
--     ['R'] = 'rename'                    ,
--     ['t'] = 'type'                      ,
--     ['T'] = 'plenary test file'         ,
--   },
}

-- vim.b.md_key_map = {
--   ['-'] = 'checkbox previous'     ,
--   ['='] = 'checkbox next'         ,
--   [','] = 'CSV to table'          ,
--   ['/'] = 'italicize'             ,
--   ['`'] = 'wrap with inline code' ,
--   ['\''] = 'toggle quote'         ,
--   ['['] = 'promote header'        ,
--   [']'] = 'demote header'         ,
--   ['b'] = 'bold'                      ,
--   ['i'] = 'generate/update TOC'       ,
--   ['I'] = 'quickfix TOC'              ,
--   ['j'] = 'jump to header'            ,
--   ['k'] = 'toggle kbd shortcut'       ,
--   ['L'] = 'quickfix deadlinks'        ,
--   ['t'] = 'toggle checkBOX'           ,
--   ['lt'] = 'toggle checkLIST'         ,
--   ['ll'] = 'toggle list'              ,
--   ['ln'] = 'wrap link'                ,
--   ['O'] = 'Obsidian'                  ,
--   ['s'] = 'strikethrough'             ,
--   ['p'] = {
--     ['name'] = '+preview'         ,
--     ['o'] = 'open'                    ,
--     ['q'] = 'quit'                    ,
--     ['t'] = 'toggle'                  ,
--   },
-- }
