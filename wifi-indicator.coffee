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
  color: #f4f4f4
  font: 11px Input
  right: 125px
  top: 4px
"""
