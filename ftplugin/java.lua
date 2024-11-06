local jdtls_dir = vim.fn.expand '$HOME/.local/share/nvim/mason/packages/jdtls'

local config = {
  cmd = {
    jdtls_dir .. '/bin/jdtls',
    '--jvm-args=-javaagent:' .. jdtls_dir .. '/lombok.jar',
  },
  capabilities = require('blink.cmp').get_lsp_capabilities(),
  root_dir = require('jdtls.setup').find_root { '.git', 'mvnw', 'gradlew' },
  settings = {
    java = {
      compile = {
        nullAnalysis = {
          mode = 'automatic',
        },
      },
      maven = {
        downloadSources = true,
      },
      implementationsCodeLens = {
        enabled = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
    },
  },
  init_options = {
    settings = {
      java = {
        imports = {
          gradle = {
            wrapper = {
              checksums = {
                {
                  sha256 = '7d3a4ac4de1c32b59bc6a4eb8ecb8e612ccd0cf1ae1e99f66902da64df296172',
                  allowed = true,
                },
              },
            },
          },
        },
      },
    },
  },
}

require('jdtls').start_or_attach(config)
