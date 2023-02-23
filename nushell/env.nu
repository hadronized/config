# Nushell Environment Config File

def create_left_prompt [] {
    let path_segment = if (is-admin) {
        $"(ansi red_bold)($env.PWD | str replace $"^($env.HOME)" ~)"
    } else {
        $"(ansi green_bold)($env.PWD | str replace $"^($env.HOME)" ~)"
    }

    $path_segment
}

def create_right_prompt [] {
    let git_segment = $'(do { git symbolic-ref --short HEAD } | complete | get stdout | str trim)'
    let git_segment = if ($git_segment | str length) > 0 {
      $'(ansi red)($git_segment)(ansi reset)'
    }

    let k8s_ctx = $'(do { kubectx -c } | complete | get stdout | str trim)'
    let k8s_segment = if ($k8s_ctx | str length) > 0 {
      let k8s_ns = $'(do { kubens -c } | complete | get stdout | str trim)'
      if ($k8s_ns | str length) > 0 {
        $'(ansi blue_bold)⎈ (ansi blue_dimmed)($k8s_ns)(ansi grey).(ansi blue)($k8s_ctx)(ansi reset)'

      } else {
        ''
      }
    } else {
      ''
    }

    let last_cmd = if $env.LAST_EXIT_CODE == 0 { $'(ansi green)✓(ansi reset)' } else { $'(ansi red)✕(ansi reset)'}
    let sep = $'(ansi grey) | (ansi reset)'

    [$k8s_segment $git_segment] | str join $sep | str trim
}

# Use nushell functions to define your right and left prompt
let-env PROMPT_COMMAND = { create_left_prompt }
let-env PROMPT_COMMAND_RIGHT = { create_right_prompt }

# The prompt indicators are environmental variables that represent
# the state of the prompt
let-env PROMPT_INDICATOR = { "〉" }
let-env PROMPT_INDICATOR_VI_INSERT = { ": " }
let-env PROMPT_INDICATOR_VI_NORMAL = { "〉" }
let-env PROMPT_MULTILINE_INDICATOR = { "::: " }

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
let-env ENV_CONVERSIONS = {
  "PATH": {
    from_string: { |s| $s | split row (char esep) | path expand -n }
    to_string: { |v| $v | path expand -n | str join (char esep) }
  }
  "Path": {
    from_string: { |s| $s | split row (char esep) | path expand -n }
    to_string: { |v| $v | path expand -n | str join (char esep) }
  }
}

# Directories to search for scripts when calling source or use
#
# By default, <nushell-config-dir>/scripts is added
let-env NU_LIB_DIRS = [
    ($nu.config-path | path dirname | path join 'scripts')
]

# Directories to search for plugin binaries when calling register
#
# By default, <nushell-config-dir>/plugins is added
let-env NU_PLUGIN_DIRS = [
    ($nu.config-path | path dirname | path join 'plugins')
]

# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
# let-env PATH = ($env.PATH | split row (char esep) | prepend '/some/path')
let-env PATH = ($env.PATH | split row ':' | prepend ['~.local/', '~/config/git/scripts', '~/.cargo/bin'])
