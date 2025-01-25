require("mason-nvim-dap").setup({
    ensure_installed = { "python" },
        handlers = {
        function(config)
          require('mason-nvim-dap').default_setup(config)
        end,
        python = function(config)
            config.adapters = {
	            type = "executable",
	            command = "/usr/bin/python3",
	            args = {
		            "-m",
		            "debugpy.adapter",
	            },
            }
            config.configurations.python = {
              {
                type = "python",
                request = "launch",
                name = "Launch file",
                program = "${file}", -- This configuration will launch the current file if used.
              },
              -- {
              --   type = 'python',
              --   pythonPath = "/home/alex/.pyenv/versions/3.8.18/envs/bizone-3.8.18/bin/python3",
              --   request = 'launch',
              --   name = 'Django',
              --   program = vim.fn.getcwd() .. '/portal_root/manage.py',
              --   args = {'runserver', '--noreload'},
              -- }
            }
            require('mason-nvim-dap').default_setup(config) -- don't forget this!
        end,
    },
})
