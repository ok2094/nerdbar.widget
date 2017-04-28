command: "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | \
egrep 'state: *' | \
sed -E 's/.*(: )//'"

refreshFrequency: 10000 # ms

render: (output) ->
  """
  <link rel="stylesheet" href="nerdbar.widget/assets/font-awesome/css/font-awesome.min.css" />
  <div class="wifi"
    <span></span>
    <span class="icon"></span>
  </div>
  """

update: (output, el) ->
    $(".wifi span:first-child", el).text("  ")
    $icon = $(".wifi span.icon", el)
    $icon.removeClass().addClass("icon")
    $icon.addClass("fa #{@icon(output)}")

icon: (status) =>
    return if status.substring(0, 7) == "running"
        "fa-wifi"
    else
        "fa-times"

style: """
  -webkit-font-smoothing: antialiased
  color: #c0c0c0
  font: 12px Input
  right: 10px
  top: 6px
"""
