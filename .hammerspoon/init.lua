k = hs.hotkey.modal.new('ctrl-shift', 'n')
function k:entered() hs.alert'Virtual Numpad Enabled' end
function k:exited() hs.alert'Virtual Numpad Disabled' end
k:bind('ctrl-shift', 'n', function() k:exit() end)

hs.fnutils.each({
  { key='down', padkey='pad2'},
  { key='left', padkey='pad4'},
  { key='right', padkey='pad6'},
  { key='up', padkey='pad8'},
}, function(vmap)
  k:bind({}, vmap.key,
    function() hs.eventtap.keyStroke({}, vmap.padkey, 20) end,
    nil,
    function() hs.eventtap.keyStroke({}, vmap.padkey, 20) end)
  end
)
