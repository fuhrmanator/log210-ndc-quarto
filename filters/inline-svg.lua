--- fr-nbsp.lua – add no-break spaces in French documents
---
--- Copyright: © 2022 Romain Lesur
--- License: MIT – see LICENSE for details

PANDOC_VERSION:must_be_at_least '2.9.2'

-- http://lua-users.org/wiki/FileInputOutput
-- Read an entire file.
-- Use "a" in Lua 5.3; "*a" in Lua 5.1 and 5.2
function readall(filename)
    local fh = assert(io.open(filename, "rb"))
    local contents = assert(fh:read(_VERSION <= "Lua 5.2" and "*a" or "a"))
    fh:close()
    return contents
end

-- Return true if file exists and is readable.
function file_exists(path)
    local file = io.open(path, "rb")
    if file then file:close() end
    return file ~= nil
end

local function ends_with(str, ending)
    return ending == "" or str:sub(-#ending) == ending
end

--- Copyright: © 2022 Christopher Fuhrman
--- License: MIT – see LICENSE for details

--- Inline SVG: find generated Images (in media bag) that are SVG
---   and replace them with the raw SVG from the file. 

if FORMAT:match 'html' then
    function Image (elem)
        if (ends_with(elem.src, '.svg')) then
            local path = elem.src
            local mime_type, svg_content
            if (file_exists(elem.src)) then
                -- could load the SVG from a file
                -- svg_content = readall(path)
            else
                -- print('Trying media bag')
                -- look in the media bag - these images use fonts (PlantUML)
                mime_type, svg_content = pandoc.mediabag.lookup(path)
                elem = pandoc.RawInline('html', svg_content)
                return {
                    elem
                }        
                end
        end
    end
end
