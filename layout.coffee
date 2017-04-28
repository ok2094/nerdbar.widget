command: """defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | \
egrep -w 'KeyboardLayout Name' | \
sed -E 's/.*( = )//;s/\"//;s/\\.//;s/(.{2}).*/\\1/'"""

refreshFrequency: 10000 # ms

render: (output) ->
  """
  <link rel="stylesheet" href="nerdbar.widget/assets/font-awesome/css/font-awesome.min.css" />
  <div class="cpu"
    <span></span>
    <span class="icon"></span>
  </div>
  """

update: (output, el) ->
    $(".cpu span:first-child", el).text("  #{output}")
    $icon = $(".cpu span.icon", el)
    $icon.removeClass().addClass("icon")
    $icon.addClass("fa fa-keyboard-o")

style: """
  -webkit-font-smoothing: antialiased
  color: #c0c0c0
  font: 12px Input
  right: 176px
  width: 35px
  top: 6px
"""
