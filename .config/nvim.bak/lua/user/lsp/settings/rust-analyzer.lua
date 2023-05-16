return {
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        command = "clippy"
      },
      inlayHints = {
        typeHints = true,
        parameterHints = true
      },
    }

  }
}
