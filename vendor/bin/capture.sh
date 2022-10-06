# $1: audio source
#     main-mic: main mic(left mic)
#     top-mic: top mic(right mic)

# $2: sample rate(Hz)
# $3: sample bit
# $4: channel number
# $5: capture duration(s)
# tinycap file.wav [-D card] [-d device] [-c channels] [-r rate] [-b bits] [-p period_size] [-n n_periods] [-t duration]
# sample usage: capture.sh main-mic 48000 16 2 1.5
# sample usage: capture.sh top-mic 48000 16 2 1.5

rate=KHZ_48
filename=/sdcard/unknown_mic.wav

case "$2" in
    "48000" )
        rate=KHZ_48
        ;;
    "96000" )
        rate=KHZ_96
        ;;
    "192000" )
        rate=KHZ_192
        ;;
esac

function enable_main_mic
{
    echo "enabling main mic"
    tinymix 'UL1_CH1 ADDA_UL_CH1' 1
    tinymix 'UL1_CH2 ADDA_UL_CH2' 1

    tinymix 'ADC L Mux' 'Left Preamplifier'
    tinymix 'ADC R Mux' 'Right Preamplifier'

    tinymix 'PGA1 Volume' 0
    tinymix 'PGA2 Volume' 0

    tinymix 'PGA L Mux' 'AIN0'
    tinymix 'PGA R Mux' 'AIN0'
}

function disable_main_mic
{
    echo "disabling main mic"
    tinymix 'UL1_CH1 ADDA_UL_CH1' 0
    tinymix 'UL1_CH2 ADDA_UL_CH2' 0

    tinymix 'ADC L Mux' 'Idle'
    tinymix 'ADC R Mux' 'Idle'

    tinymix 'PGA L Mux' 'None'
    tinymix 'PGA R Mux' 'None'
}

function enable_top_mic
{
    echo "enabling top mic"
    tinymix 'UL1_CH1 ADDA_UL_CH1' 1
    tinymix 'UL1_CH2 ADDA_UL_CH2' 1

    tinymix 'ADC L Mux' 'Left Preamplifier'
    tinymix 'ADC R Mux' 'Right Preamplifier'

    tinymix 'PGA1 Volume' 0
    tinymix 'PGA2 Volume' 0

    tinymix 'PGA L Mux' 'AIN2'
    tinymix 'PGA R Mux' 'AIN2'
}

function disable_top_mic
{
    echo "disabling top mic"
    tinymix 'UL1_CH1 ADDA_UL_CH1' 0
    tinymix 'UL1_CH2 ADDA_UL_CH2' 0

    tinymix 'ADC L Mux' 'Idle'
    tinymix 'ADC R Mux' 'Idle'

    tinymix 'PGA L Mux' 'None'
    tinymix 'PGA R Mux' 'None'
}



case "$1" in
    "main-mic" )
        enable_main_mic
        filename=/sdcard/main_mic.wav
        pcm_id=9
        ;;
    "top-mic" )
        enable_top_mic
        filename=/sdcard/top_mic.wav
        pcm_id=9
        ;;
    *)
        echo "Usage: capture.sh main-mic 48000 16 2 10"
        ;;
esac

if [ -z "$6" ]; then
    period_size=1024
else
    period_size=$6
fi

if [ -z "$7" ]; then
    n_periods=4
else
    n_periods=$7
fi


# start recording
echo "start recording"
tinycap $filename -D 0 -d $pcm_id -r $2 -b $3 -c $4 -T $5 -p $period_size -n $n_periods
ret=$?
if [ $ret -ne 0 ]; then
    echo "tinycap done, return $ret"
fi

# tear down
case "$1" in
    "main-mic" )
        disable_main_mic
        ;;
    "top-mic" )
        disable_top_mic
        ;;
esac
