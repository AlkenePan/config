function no_sleep
    xset -dpms
    xset s noblank
    xset s off
end

function thinkvision
    xrandr --output DP1 --off --output HDMI1 --mode 2560x1440 --pos 0x0 --rotate normal --output HDMI2 --off --output HDMI3 --off --output VIRTUAL1 --off --dpi 120
end

