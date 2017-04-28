###
Heavily modified to support spotify
###


command: """echo 'tell application "Spotify"
        set cTrack to current track
        set sArtist to artist of cTrack
        set sName to name of cTrack
        set pState to player state
        return pState & sArtist & sName
    end tell' | osascript
"""

refreshFrequency: 5000 # ms

render: (output) ->
  """
  <link rel="stylesheet" href="nerdbar.widget/assets/font-awesome/css/font-awesome.min.css" />
  <div class="np"
    <span></span>
    <span class="icon"></span>
  </div>
  """

update: (output, el) ->
    info = output.split(", ");
    $(".np span:first-child", el).text("  #{info[1] + " - " + info[2]}")
    $icon = $(".np span.icon", el)
    $icon.removeClass().addClass("icon")
    $icon.addClass("fa #{@icon(info[0])}")

icon: (status) =>
    return if status.substring(0, 6) == "paused"
        "fa-pause-circle-o"
    else
        "fa-play-circle-o"

style: """
  -webkit-font-smoothing: antialiased
  text-align: center
  color: #c0c0c0
  font: 12px Input
  height: 16px
  left: 25%
  overflow: hidden
  text-overflow: ellipsis
  top: 6px
  width: 50%
"""
