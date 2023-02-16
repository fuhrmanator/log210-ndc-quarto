--- fr-nbsp.lua – add no-break spaces in French documents
---
--- Copyright: © 2022 Romain Lesur
--- License: MIT – see LICENSE for details

--- Copyright: © 2022 Christopher Fuhrman
--- License: MIT – see LICENSE for details

PANDOC_VERSION:must_be_at_least '2.9.2'

local THIN_SPACE_PATTERN_ASCII = '[;!%?]'
local WIDE_SPACE_PATTERN_ASCII = '[%%:]'
local ALL_SPACE_PATTERN_ASCII = '[;!%?%%:]'
local THIN_NBSP = '\u{202f}'
local NBSP = '\u{00A0}'

local function determine_space_type(character)
    local space = NBSP
    if (string.match(character, THIN_SPACE_PATTERN_ASCII)) then
        space = THIN_NBSP
    end
    return space
end

local function insert_nonbreaking_space_before_last_char(text)
    local space = determine_space_type(text:sub( -1))
    return text:sub(1, -2) .. space .. text:sub( -1)
end

local function string_already_has_nbsp(text)
    return string.find(text, THIN_NBSP)
        or string.find(text, NBSP)
end

--- add non-breaking spaces according to high punctuation rules, similar to babel-french
local function space_high_punctuation_and_quotes(inlines)
    local i = 1
    -- local already_spaced = false
    while inlines[i] do
        -- print(i, '//', inlines[i], '//', i+1,  '//', inlines[i+1], '//')
        if inlines[i].t == 'Str' and not string_already_has_nbsp(inlines[i].text) then
            if string.len(inlines[i].text) > 1 and string.match(inlines[i].text:sub( -1), ALL_SPACE_PATTERN_ASCII) then
                -- print(inlines[i].text:sub(-1))
                -- print(i, 'fixing (2):', inlines[i])
                inlines[i].text = insert_nonbreaking_space_before_last_char(
                    inlines[i].text)
            end
            -- unicode is a problem in patterns, so we just brute force it?
            inlines[i].text = string.gsub(inlines[i].text, "€", NBSP .. "€")
            inlines[i].text = string.gsub(inlines[i].text, "»", NBSP .. "»")
            inlines[i].text = string.gsub(inlines[i].text, "«", "«" .. NBSP)
        end

        --
        -- special cases where punctuation can follow
        --

        if inlines[i + 1] and inlines[i + 1].t == 'Str' and not string.find(inlines[i + 1].text, THIN_NBSP) -- didn't already insert THIN_NBSP
            and (inlines[i].t == 'Quoted' or inlines[i].t == 'Cite' or inlines[i].t == 'Link' or inlines[i].t == 'Emph' or inlines[i].t == 'Strong' or inlines[i].t == 'Strikeout' or inlines[i].t == 'Code' or inlines[i].t == 'RawInline')
            and string.match(inlines[i + 1].text:sub( -1), ALL_SPACE_PATTERN_ASCII) then
            if (string.len(inlines[i + 1].text) == 1) then
                -- print(i, 'fixing (3):', inlines[i+1])
                inlines[i + 1].text = determine_space_type(inlines[i + 1].text) .. inlines[i + 1].text
            else
                -- print(i, 'fixing (4) -- should be parens:', inlines[i+1])
                inlines[i + 1].text = insert_nonbreaking_space_before_last_char(inlines[i + 1].text)
            end
            -- skip the item we just spaced
            i = i + 1
        end

        --- special case where string is terminated by parentheses, e.g., "Bonjour!)"

        if inlines[i].t == 'Str' and string.find(inlines[i].text, '.*' .. ALL_SPACE_PATTERN_ASCII .. '%)') then
            -- print("Found: ", inlines[i].text)
            -- capture what's in the parens
            _, _, inside = string.find(inlines[i].text,
                '(.*' .. ALL_SPACE_PATTERN_ASCII .. ')%)')
            inside = inside:sub(1, -2) .. THIN_NBSP .. inside:sub( -1)
            inlines[i].text = inside .. ')'
        end
        i = i + 1
    end
    return inlines
end

--- For HTML output, since the Narrow No-Break Spaces (U+202F) are not well supported
--- by browsers (they are breakable), use this solution: https://stackoverflow.com/a/1570664
--- We replace nnbsp with &thinsp; and embed them in spans with white-space:nowrap styling.
--- Detecting U+202F in Lua is tricky bc of its unicode support in string matching.
--- We must detect bytes corresponding to U+202F encoded in UTF8 (226 128 175 in decimals)
local function wrap_nnbsp_in_span(inlines)
    for i = 1, #inlines, 1 do
        if inlines[i].t == 'Str' and string.match(inlines[i].text, '\226\128\175') then
            inlines[i] = pandoc.RawInline('html',
                "<span style='white-space:nowrap'>" ..
                string.gsub(inlines[i].text, '\226\128\175', '&thinsp;') ..
                '</span>')
        end
    end
    return inlines
end


if FORMAT:match 'html' or FORMAT:match 'html5' then
    return {
        {
            Inlines = function(inlines)
                inlines = space_high_punctuation_and_quotes(inlines)
                inlines = wrap_nnbsp_in_span(inlines)
                return inlines
            end
        }
    }
else
    return {
        {
            Inlines = function(inlines)
                inlines = space_high_punctuation_and_quotes(inlines)
                return inlines
            end
        }
    }
end
