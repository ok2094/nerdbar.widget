command: "pmset -g batt | egrep '([0-9]+\%).*' -o --colour=auto | cut -f1 -d';'"

refreshFrequency: 15000 # ms

render: (output) ->
  """
  <link rel="stylesheet" href="nerdbar.widget/assets/font-awesome/css/font-awesome.min.css" />
  <div class="battery">
    <span class="icon"></span>
    <span class="text"></span>
  </div>
  """

update: (output, el) ->
    bat = parseInt(output)
    $(".battery span.text", el).text("  #{output}")
    $icon = $(".battery span.icon", el)
    $icon.removeClass().addClass("icon")
    $icon.addClass("fa #{@icon(bat)}")

icon: (output) =>
  return if output > 90
    "fa-battery-full"
  else if output > 70
    "fa-battery-three-quarters"
  else if output > 40
    "fa-battery-half"
  else if output > 20
    "fa-battery-quarter"
  else
    "fa-battery-empty"

style: """
  font: 12px Input
  top: 3px
  right: 65px
  color: #f4f4f4

  .battery span.icon
    margin-right: 3px

  .battery span.text
    font: 11px Envy Code R
"""
