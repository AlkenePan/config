function no_sleep
    xset -dpms
    xset s noblank
    xset s off
end

function thinkvision
    xrandr --output DP1 --off --output HDMI1 --mode 2560x1440 --pos 0x0 --rotate normal --output HDMI2 --off --output HDMI3 --off --output VIRTUAL1 --off --dpi 120
end


function hp
    xrandr --newmode "2560x1440_60.00"  311.83  2560 2744 3024 3488  1440 1441 1444 1490  -HSync +Vsync
    xrandr --addmode DisplayPort-0 2560x1440_60.00
    xrandr --output DisplayPort-0 --mode 2560x1440_60.00
    xrandr --dpi 109
end

function yellow
    redshift -l 22.5455:114.0683 &
    disown $last_pid
end

