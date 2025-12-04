-- Advent of Code 2025 Day 3

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

local current = input

local list = {}
for item in current:gmatch '[^\n]+' do
  table.insert(list, item)
end

-- variables
local r = 0
local size = 12

for _, line in pairs(list) do
  local s = 0
  local max = {}
  local chars = {}
  local oldindex = {}
  for _ = 1, size, 1 do
    table.insert(max, 0)
    table.insert(oldindex, 0)
  end
  for char in line:gmatch '%d' do
    table.insert(chars, char)
  end
  for i = 1, size, 1 do
    if i > 1 then
      for index, char in pairs(chars) do
        if tonumber(char) > tonumber(max[i]) and index < string.len(line) - size + i + 1 and index > oldindex[i - 1] then
          max[i] = tonumber(char)
          oldindex[i] = index
        end
      end
    else
      for index, char in pairs(chars) do
        if tonumber(char) > tonumber(max[i]) and index < string.len(line) - size + i + 1 then
          max[i] = tonumber(char)
          oldindex[i] = index
        end
      end
    end
  end
  for i = 1, size, 1 do
    local a = size - i + 1
    s = s + tonumber(max[a]) * 10 ^ i
  end
  local a = tostring(s):gsub('0%.0', '')
  r = r + tonumber(a)
end

-- final
print(r)
