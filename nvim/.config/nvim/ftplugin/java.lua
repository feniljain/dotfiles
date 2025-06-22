local workspace_dir = "/Users/feniljain/.jdtls_data/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ':h:h:t') .. "/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ':h:t') .. "/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ':t')

local config = {
    cmd = {
        "java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xmx1g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens",
        "java.base/java.util=ALL-UNNAMED",
        "--add-opens",
        "java.base/java.lang=ALL-UNNAMED",
        "-jar",
        "/Users/feniljain/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar",
        "-configuration",
        "/Users/feniljain/.local/share/nvim/mason/packages/jdtls/config_mac",
        "-data",
        workspace_dir,
    },
    settings = {
        java = {
            format = {
                settings = {
                    url = "/Users/feniljain/Projects/work/e6data/misc/e6_style.xml",
                    profile = "e6-style",
                },
            },
        },
    },
    root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),
}

require("jdtls").start_or_attach(config)
