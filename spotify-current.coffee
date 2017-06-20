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

refreshFrequency: 3000 # ms

render: (output) ->
  """
  <link rel="stylesheet" href="nerdbar.widget/assets/font-awesome/css/font-awesome.min.css" />
  <div class="np">
    <span class="icon"></span>
    <span class="text"></span>
  </div>
  """

update: (output, el) ->
    info = output.split(", ");
    $(".np span.text", el).text("  #{info[1] + " - " + info[2]}")
    $icon = $(".np span.icon", el)
    $icon.removeClass().addClass("icon")
    $icon.addClass("fa #{@icon(info[0])}")

icon: (status) =>
    return if status.substring(0, 6) == "paused"
        "fa-pause"
    else
        "fa-play"

style: """
  text-align: center
  color: #f4f4f4
  font: 11px Input
  height: 16px
  left: 25%
  overflow: hidden
  text-overflow: ellipsis
  top: 4px
  width: 50%

  .np span.icon
    margin-right: 4px

  .np span.text
    font: 11px Envy Code R
"""
