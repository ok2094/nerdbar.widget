command: """echo 'tell application "System Events"
        set frontApp to first application process whose frontmost is true
        set frontAppName to name of frontApp
		end tell
		return {frontAppName}' | osascript
"""

refreshFrequency: 1000 # ms

render: (output) ->
  """
  <div class="foc">
    <span></span>
  </div>
  """

update: (output, el) ->
    $(".foc span:first-child", el).text("  #{output}")

style: """
  color: #f4f4f4
  font: 11px Envy Code R
  height: 16px
  left: 15px
  overflow: hidden
  white-space: nowrap
  text-overflow: ellipsis
  top: 4px
"""
