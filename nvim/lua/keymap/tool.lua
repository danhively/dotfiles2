local bind = require 'keymap.bind'
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
local map_callback = bind.map_callback
require 'keymap.helpers'

local plug_map = {
  -- Plugin: vim-fugitive
  ['n|<leader>gp'] = map_cr('G push'):with_noremap():with_silent():with_desc 'git: Push',
  ['n|<leader>gl'] = map_cr('G pull'):with_noremap():with_silent():with_desc 'git: Pull',
  ['n|<leader>G'] = map_cu('Git'):with_noremap():with_silent():with_desc 'git: Open git-fugitive',
  ['n|<leader>gb'] = map_cu('Git blame'):with_noremap():with_silent():with_desc 'git: Blame',
  ['n|<leader>gc'] = map_cu('Git commit'):with_noremap():with_silent():with_desc 'git: Commit',
  ['n|<leader>gC'] = map_cu('Git commit --amend'):with_noremap():with_silent():with_desc 'git: Modify prev commit msg',
  ['n|<leader>gg'] = map_cu('Git commit -S'):with_noremap():with_silent():with_desc 'git: Commit with gpg',
  ['n|<leader>gG'] = map_cu('Git commit --amend -S')
    :with_noremap()
    :with_silent()
    :with_desc 'git: Modify prev commit gpg msg',

  -- Plugin: nvim-tree
  ['n|<leader>e'] = map_cr('NvimTreeToggle'):with_noremap():with_silent():with_desc 'filetree: Toggle',
  ['n|<leader>nf'] = map_cr('NvimTreeFindFile'):with_noremap():with_silent():with_desc 'filetree: Find file',
  ['n|<leader>nr'] = map_cr('NvimTreeRefresh'):with_noremap():with_silent():with_desc 'filetree: Refresh',

  -- Plugin: sniprun
  ['v|<leader>r'] = map_cr('SnipRun'):with_noremap():with_silent():with_desc 'tool: Run code by range',
  ['n|<leader>r'] = map_cu([[%SnipRun]]):with_noremap():with_silent():with_desc 'tool: Run code by file',

  -- Plugin: toggleterm
  ['t|<Esc><Esc>'] = map_cmd([[<C-\><C-n>]]):with_noremap():with_silent(), -- switch to normal mode in terminal.
  ['t|JK'] = map_cmd([[<C-\><C-n>]]):with_noremap():with_silent(), -- switch to normal mode in terminal.
  ['n|<C-l>'] = map_cr([[execute v:count . "ToggleTerm direction=horizontal"]])
    :with_noremap()
    :with_silent()
    :with_desc 'terminal: Toggle horizontal',
  ['i|<C-\\>'] = map_cmd('<Esc><Cmd>ToggleTerm direction=horizontal<CR>')
    :with_noremap()
    :with_silent()
    :with_desc 'terminal: Toggle horizontal',
  ['t|<C-l>'] = map_cmd('<Cmd>ToggleTerm<CR>'):with_noremap():with_silent():with_desc 'terminal: Toggle horizontal',
  ['n|<A-\\>'] = map_cr([[execute v:count . "ToggleTerm direction=vertical"]])
    :with_noremap()
    :with_silent()
    :with_desc 'terminal: Toggle vertical',
  ['i|<A-\\>'] = map_cmd('<Esc><Cmd>ToggleTerm direction=vertical<CR>')
    :with_noremap()
    :with_silent()
    :with_desc 'terminal: Toggle vertical',
  ['t|<A-\\>'] = map_cmd('<Cmd>ToggleTerm<CR>'):with_noremap():with_silent():with_desc 'terminal: Toggle vertical',
  ['n|<F5>'] = map_cr([[execute v:count . "ToggleTerm direction=vertical"]])
    :with_noremap()
    :with_silent()
    :with_desc 'terminal: Toggle vertical',
  ['i|<F5>'] = map_cmd('<Esc><Cmd>ToggleTerm direction=vertical<CR>')
    :with_noremap()
    :with_silent()
    :with_desc 'terminal: Toggle vertical',
  ['t|<F5>'] = map_cmd('<Cmd>ToggleTerm<CR>'):with_noremap():with_silent():with_desc 'terminal: Toggle vertical',
  ['n|<A-d>'] = map_cr([[execute v:count . "ToggleTerm direction=float"]])
    :with_noremap()
    :with_silent()
    :with_desc 'terminal: Toggle float',
  ['i|<A-d>'] = map_cmd('<Esc><Cmd>ToggleTerm direction=float<CR>')
    :with_noremap()
    :with_silent()
    :with_desc 'terminal: Toggle float',
  ['t|<A-d>'] = map_cmd('<Cmd>ToggleTerm<CR>'):with_noremap():with_silent():with_desc 'terminal: Toggle float',

  -- Plugin: trouble
  ['n|gt'] = map_cr('TroubleToggle'):with_noremap():with_silent():with_desc 'Trouble: Toggle trouble list',
  ['n|<leader>tr'] = map_cr('TroubleToggle lsp_references')
    :with_noremap()
    :with_silent()
    :with_desc 'trouble: Show lsp references',
  ['n|<leader>td'] = map_cr('TroubleToggle document_diagnostics')
    :with_noremap()
    :with_silent()
    :with_desc 'trouble: Show document diagnostics',
  ['n|<leader>tw'] = map_cr('TroubleToggle workspace_diagnostics')
    :with_noremap()
    :with_silent()
    :with_desc 'trouble: Show workspace diagnostics',
  ['n|<leader>tq'] = map_cr('TroubleToggle quickfix')
    :with_noremap()
    :with_silent()
    :with_desc 'trouble: Show quickfix list',
  ['n|<leader>tl'] = map_cr('TroubleToggle loclist'):with_noremap():with_silent():with_desc 'trouble: Show loclist',

  -- Plugin: telescope
  ['n|<C-p>'] = map_callback(function()
      --  selene: allow(undefined_variable)
      _command_panel()
    end)
    :with_noremap()
    :with_silent()
    :with_desc 'tool: Toggle command panel',
  ['n|<leader>u'] = map_callback(function()
      require('telescope').extensions.undo.undo()
    end)
    :with_noremap()
    :with_silent()
    :with_desc 'edit: Show undo history',
  ['n|<leader>fp'] = map_callback(function()
      require('telescope').extensions.projects.projects {}
    end)
    :with_noremap()
    :with_silent()
    :with_desc 'find: Project',
  ['n|<leader>fr'] = map_callback(function()
      require('telescope').extensions.frecency.frecency()
    end)
    :with_noremap()
    :with_silent()
    :with_desc 'find: File by frecency',
  ['n|<leader>fw'] = map_callback(function()
      require('telescope').extensions.live_grep_args.live_grep_args()
    end)
    :with_noremap()
    :with_silent()
    :with_desc 'find: Word in project',
  ['n|<leader>fe'] = map_cu('Telescope oldfiles'):with_noremap():with_silent():with_desc 'find: File by history',
  ['n|<leader>ff'] = map_cu('Telescope find_files'):with_noremap():with_silent():with_desc 'find: File in project',
  ['n|<leader>fc'] = map_cu('Telescope colorscheme')
    :with_noremap()
    :with_silent()
    :with_desc 'ui: Change colorscheme for current session',
  ['n|<leader>fn'] = map_cu(':enew'):with_noremap():with_silent():with_desc 'buffer: New',
  ['n|<leader>fg'] = map_cu('Telescope git_files'):with_noremap():with_silent():with_desc 'find: file in git project',
  ['n|<leader>fz'] = map_cu('Telescope zoxide list')
    :with_noremap()
    :with_silent()
    :with_desc 'edit: Change current direrctory by zoxide',
  ['n|<leader>fb'] = map_cu('Telescope buffers'):with_noremap():with_silent():with_desc 'find: Buffer opened',
  ['n|<leader>fs'] = map_cu('Telescope grep_string'):with_noremap():with_silent():with_desc 'find: Current word',

  -- Plugin: dap
  ['n|<F6>'] = map_callback(function()
      require('dap').continue()
    end)
    :with_noremap()
    :with_silent()
    :with_desc 'debug: Run/Continue',
  ['n|<F7>'] = map_callback(function()
      require('dap').terminate()
      require('dapui').close()
    end)
    :with_noremap()
    :with_silent()
    :with_desc 'debug: Stop',
  ['n|<F8>'] = map_callback(function()
      require('dap').toggle_breakpoint()
    end)
    :with_noremap()
    :with_silent()
    :with_desc 'debug: Toggle breakpoint',
  ['n|<F9>'] = map_callback(function()
      require('dap').step_into()
    end)
    :with_noremap()
    :with_silent()
    :with_desc 'debug: Step into',
  ['n|<F10>'] = map_callback(function()
      require('dap').step_out()
    end)
    :with_noremap()
    :with_silent()
    :with_desc 'debug: Step out',
  ['n|<F11>'] = map_callback(function()
      require('dap').step_over()
    end)
    :with_noremap()
    :with_silent()
    :with_desc 'debug: Step over',
  ['n|<leader>db'] = map_callback(function()
      require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    end)
    :with_noremap()
    :with_silent()
    :with_desc 'debug: Set breakpoint with condition',
  ['n|<leader>dc'] = map_callback(function()
      require('dap').run_to_cursor()
    end)
    :with_noremap()
    :with_silent()
    :with_desc 'debug: Run to cursor',
  ['n|<leader>dl'] = map_callback(function()
      require('dap').run_last()
    end)
    :with_noremap()
    :with_silent()
    :with_desc 'debug: Run last',
  ['n|<leader>do'] = map_callback(function()
      require('dap').repl.open()
    end)
    :with_noremap()
    :with_silent()
    :with_desc 'debug: Open REPL',
}

bind.nvim_load_mapping(plug_map)
