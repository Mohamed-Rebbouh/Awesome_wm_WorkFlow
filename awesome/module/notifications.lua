local naughty = require('naughty')
-- local beautiful = require('beautiful')
-- local gears = require('gears')
-- local dpi = require('beautiful').xresources.apply_dpi
local awful = require('awful')
-- --Naughty presets
-- naughty.config.padding = 8
-- naughty.config.spacing = 8

-- naughty.config.defaults.timeout = 5
-- naughty.config.defaults.screen = 1
-- naughty.config.defaults.position = 'bottom_left'
-- naughty.config.defaults.margin = dpi(16)
-- naughty.config.defaults.ontop = true
-- naughty.config.defaults.font = 'Roboto Regular 10'
-- naughty.config.defaults.icon = nil
-- naughty.config.defaults.icon_size = dpi(32)
-- naughty.config.defaults.shape = gears.shape.rounded_rect
-- naughty.config.defaults.border_width = 0
-- naughty.config.defaults.hover_timeout = nil
naughty.notify = function(args)
  -- Call your custom callback function
  log_this1(args)

end

-- Error handling

if _G.awesome.startup_errors then
  naughty.notify(
    {
      preset = naughty.config.presets.critical,
      title = 'Oops, there were errors during startup!',
      text = _G.awesome.startup_errors
    }
  )

end

do
  local in_error = false
  _G.awesome.connect_signal(
    'debug::error',
    function(err)
      if in_error then
        return
      end
      in_error = true
      naughty.notify(
        {
          preset = naughty.config.presets.critical,
          title = 'Oops, an error happened!',
          text = tostring(err)
        }
      )
      in_error = false
    end
  )
end


function log_this1(args)
  local txt = args.text or ""
  local titl = args.title or "title"
  local command2 = 'echo -e "'.. titl .. ':'.. txt..'" | rofi -dmenu -i -p "notification" -config ~/.config/rofi/notification.rasi'
  
  -- Ensure previous rofi instances are terminated
  awful.spawn.with_shell('pkill rofi; sleep 0.1; ' .. command2)
end
