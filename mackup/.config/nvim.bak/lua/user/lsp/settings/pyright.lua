return {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
        diagnosticMode = "workspace",
        inlayHints = {
          variableTypes = true,
          functionReturnTypes = true,
        },
        diagnosticSeverityOverrides = {
          reportPrivateImportUsage = "none",
          analyzeUnannotatedFunctions = "false",

          reportOptionalMemberAccess = "none",
          reportOptionalSubscript = "none",
          reportOptionalCall = "none",
          reportOptionalIterable = "none",
          reportOptionalOperand = "none",
          reportOptionalContextManager = "none",
        },
      },
      -- pythonPath = "/usr/local/bin/python3",
    },
  },
}
