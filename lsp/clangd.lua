return {
    cmd = { "clangd" },
    filetyps = { "cpp", "c", "h", "hpp" },
    settings = {
        clangd = {
            completion = {
                AllScopes = true,
                CodePatterns = None,
            },
            InlayHints = {
                Enabled = true,
                Designators = true,
                ParameterNames = true,
            },
        }
    }
}
