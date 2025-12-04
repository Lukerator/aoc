-- Advent of Code 2025 Day 4

local file = io.open('input.txt', 'r')
if not file then
  return 1
end
local input = file:read '*a'
file:close()

local filetest = io.open('inputtest.txt', 'r')
if not filetest then
  return 1
end
local inputtest = filetest:read '*a'
filetest:close()

local current = inputtest

local lines = 0
local list = {}
for item in current:gmatch '[^\n]+' do
  table.insert(list, item)
  lines = lines + 1
end

-- variables
local r1, r2 = 0, 0
local columns = 0
local matrix = {}
local dv = { -1, -1, -1, 0, 0, 1, 1, 1 }
local dh = { -1, 0, 1, -1, 1, -1, 0, 1 }

-- Part 1
for _, line in pairs(list) do
  local chars = {}
  for char in tostring(line):gmatch '.' do
    table.insert(chars, char)
    columns = columns + 1
  end
  table.insert(matrix, chars)
end
for iv, line in pairs(matrix) do
  for ih, char in pairs(line) do
    local neighbors = 0
    if char == '@' then
      if (iv > 1 and ih > 1) and (iv < lines - 1 and ih < columns - 1) then
        print(matrix[iv - 1][ih - 1])
        print(matrix[iv - 1][ih])
        print(matrix[iv - 1][ih + 1])
        print(matrix[iv][ih - 1])
        print(matrix[iv][ih])
        print(matrix[iv][ih + 1])
        print(matrix[iv + 1][ih - 1])
        print(matrix[iv + 1][ih])
        print(matrix[iv + 1][ih + 1])
      end
      for i = 1, 8, 1 do
        local nv = iv + dv[i]
        local nh = ih + dh[i]
        if (nv > 0 and nh > 0) and (nv < lines and nh < columns) then
          if matrix[nv][nh] == '@' then
            neighbors = neighbors + 1
          end
        end
      end
    end
    print(neighbors)
    if neighbors < 4 then
      r1 = r1 + 1
    end
  end
end

-- reset variables

-- Part 2

-- final
print(r1)
print(r2)
