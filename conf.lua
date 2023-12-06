function love.conf(t)
  -- reduces load time
  t.modules.joystick = false
  t.identity = "Ludo"
  t.window.title = "Ludo"
  t.window.resizable = true
  --t.window.highdpi = true
  t.window.usedpiscale = false
  -- for saving data this is necessary
  t.externalstorage = true

  t.window.width = 720
  t.window.height = 1280
end
