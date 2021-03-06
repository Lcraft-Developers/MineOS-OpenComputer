local function file_check(file_name)
  if fs.exists(tostring(file_name)) then
    return true
  else
     return false
  end
end

local function tbl2file(file,tbl)
  local file = fs.open(file,"w")
  for k,v in pairs(tbl) do
    file.writeLine(v)
  end
  file.close()
end

local function printCentered( y,s )
  local w,h = term.getSize()
  term.setCursorPos(w/2 - #s/2, y)
  term.write(s)
end

shell.run("clear")
term.setTextColor(colors.white)
printCentered(3, "LWindow - Register")
printCentered(6, "Username: ")
local username = read()
printCentered(8, "Password: ")
local passwort = read("*")
printCentered(9, "S-Key: ")
local skey = read("*")

root = "disk/lwindow/users/"..username

if file_check(tostring(root).. "/infos.lua") then
  print("\n\nThis username already exists!")
  sleep(2)
else
  shell.run("mkdir ".. tostring(root))
  local x = {tostring(username),tostring(passwort),tostring(skey),tostring(false)}
  tbl2file(tostring(root).. "/infos.lua", x)
  print("\n\nAccount has been created.")
  sleep(2)
end
shell.run("disk/lwindow/menu")
