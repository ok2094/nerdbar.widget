command: "date +\"%H:%M\""

refreshFrequency: 10000 # ms

render: (output) ->
  """
  <div class="time">
    <span></span>
  </div>
  """

update: (output, el) ->
    $(".time span:first-child", el).text("  #{output}")

style: """
  color: #f4f4f4
  font: 11px Envy Code R
  right: 20px
  top: 4px
"""
