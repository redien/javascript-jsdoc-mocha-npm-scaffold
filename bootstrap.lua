#!/usr/bin/env lua

function replaceVariableInFile(pattern, substitution, filepath)
    local file = io.open(filepath)
    local contents
    if _VERSION == "Lua 5.3" then
        contents = file:read("a")
    else
        contents = file:read("*a")
    end
    file:close()

    contents = contents:gsub(pattern, substitution)

    file = io.open(filepath, "w")
    file:write(contents)
    file:close()
end

function replaceVariableInFiles(pattern, substitution)
    replaceVariableInFile(pattern, substitution, "./README.md")
    replaceVariableInFile(pattern, substitution, "./package.json")
    replaceVariableInFile(pattern, substitution, "./subsystem/module.js")
    replaceVariableInFile(pattern, substitution, "./subsystem/module.unit.js")
end

io.write("Enter project name: ")
local PROJECT_NAME = io.read()
replaceVariableInFiles("PROJECT_NAME", PROJECT_NAME)

io.write("Enter short description: ")
local PROJECT_SHORT_DESCRIPTION = io.read()
replaceVariableInFiles("PROJECT_SHORT_DESCRIPTION", PROJECT_SHORT_DESCRIPTION)

io.write("Enter author name: ")
local PROJECT_AUTHOR = io.read()
replaceVariableInFiles("PROJECT_AUTHOR", PROJECT_AUTHOR)

io.write("Enter contact email: ")
local PROJECT_CONTACT_EMAIL = io.read()
replaceVariableInFiles("PROJECT_CONTACT_EMAIL", PROJECT_CONTACT_EMAIL)

io.write("Enter copyright year: ")
local PROJECT_COPY_YEAR = io.read()
replaceVariableInFiles("PROJECT_COPY_YEAR", PROJECT_COPY_YEAR)

io.write("Enter SPDX license code: ")
local PROJECT_COPY_LICENSE = io.read()
replaceVariableInFiles("PROJECT_COPY_LICENSE", PROJECT_COPY_LICENSE)

os.remove("./bootstrap.lua")
