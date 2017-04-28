command: """echo 'tell application "System Events"
        set frontApp to first application process whose frontmost is true
        set frontAppName to name of frontApp
		end tell
		return {frontAppName}' | osascript
"""

refreshFrequency: 1000 # ms

render: (output) ->
  """
  <div class="foc"
    <span></span>
  </div>
  """

update: (output, el) ->
    $(".foc span:first-child", el).text("  #{output}")

style: """
  -webkit-font-smoothing: antialiased
  color: #c0c0c0
  font: 12px Input
  height: 16px
  left: 10px
  overflow: hidden
  white-space: nowrap
  text-overflow: ellipsis
  top: 6px
  width: 498px
"""
