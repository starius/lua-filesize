package = "lua-filesize"
version = "dev-1"
source = {
    url = "git://github.com/starius/lua-filesize.git"
}
description = {
    summary = "Generate a human readable string describing the file size",
    license = "MIT",
    homepage = "https://github.com/starius/lua-filesize",
}
dependencies = {
    "lua >= 5.1",
}
build = {
    type = "builtin",
    modules = {
        ['filesize'] = 'src/filesize/filesize.lua',
    },
}
