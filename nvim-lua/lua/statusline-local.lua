local generator = function()
    local extensions = require('el.extensions')
    local builtin = require('el.builtin')
    local helper = require("el.helper")
    local el_segments = {}

    table.insert(el_segments, extensions.mode)
    table.insert(el_segments, extensions.git_changes)
    table.insert(el_segments, builtin.file)
    -- table.insert(el_segments, builtin.local)

    return el_segments
end

-- And then when you're all done, just call
require('el').setup({ generator = generator })
