import * as React from "/opt/oni/resources/app/node_modules/react"
import * as Oni from "/opt/oni/resources/app/node_modules/oni-api"

export const activate = (oni: Oni.Plugin.Api) => {
  console.log("config activated")

  const isNormalMode = () => oni.editors.activeEditor.mode === "normal"
  const isMenuOpen = () => oni.menu.isMenuOpen()

  // Input
  //
  // Add input bindings here:
  //
  oni.input.bind("<c-enter>", () => console.log("Control+Enter was pressed"))
  oni.input.bind(",f", "quickOpen.show", () => isNormalMode() && !isMenuOpen())
  oni.input.bind(",n", "sidebar.toggle", () => isNormalMode() && !isMenuOpen())
  oni.input.bind(",t", "language.symbols.workspace", () => isNormalMode() && !isMenuOpen())
  oni.input.bind(",d", "language.symbols.document", () => isNormalMode() && !isMenuOpen())

  //
  // Or remove the default bindings here by uncommenting the below line:
  //
  // oni.input.unbind("<c-p>")

}

export const deactivate = (oni: Oni.Plugin.Api) => {
  console.log("config deactivated")
}

export const configuration = {
  "oni.useDefaultConfig": false,
  "oni.loadInitVim": true,
  "oni.hideMenu": true,

  "editor.fontSize": "12px",
  "editor.fontFamily": "DejaVu Sans Mono",
  "editor.linePadding": 1,
  "editor.textMateHighlighting.enabled": true,

  "sidebar.marks.enabled": true,
  "sidebar.plugins.enabled": true,
  "sidebar.enabled": true,

  "tabs.mode": "hidden",
  "tabs.highlight": true,
  "tabs.maxWidth": "30em",

  "ui.animations.enabled": true,
  "ui.colorscheme": "gruvbox",
  "ui.iconTheme": "theme-icons-seti",
  "ui.fontFamily": "BlinkMacSystemFont, 'Lucida Grande', 'Segoe UI', Ubuntu, Cantarell, sans-serif",
  "ui.fontSize": "13px",

  "language.rust.languageServer.command": "rustup",
  "language.rust.languageServer.arguments": ["run", "nightly", "rls"],
  "language.rust.languageServer.rootFiles": ["Cargo.toml"],
}
