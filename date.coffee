command: "date +\"%a %d %b\""

refreshFrequency: 10000

render: (output) ->
  """
  <link rel="stylesheet" href="nerdbar.widget/assets/font-awesome/css/font-awesome.min.css" />
  <div class="cal"
    <span></span>
    <span class="icon"></span>
  </div>
  """

update: (output, el) ->
    $(".cal span:first-child", el).text("  #{output}")
    $icon = $(".cal span.icon", el)
    $icon.removeClass().addClass("icon")
    $icon.addClass("fa fa-calendar")

style: """
  -webkit-font-smoothing: antialiased
  color: #c0c0c0
  font: 12px Input
  right: 85px
  width: 85px
  top: 6px
"""
