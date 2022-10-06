# sample usage: just run capture_headsetmic.sh
VOCALTRACT=$1

function enable_headset_mic
{
    echo "enabling headset mic"
    tinymix 'UL1_CH1 ADDA_UL_CH1' 1
    tinymix 'UL1_CH2 ADDA_UL_CH2' 1

    tinymix 'ADC L Mux' 'Left Preamplifier'
    tinymix 'ADC R Mux' 'Right Preamplifier'
    tinymix 'PGA L Mux' 'AIN1'
    tinymix 'PGA R Mux' 'AIN1'

    tinymix 'PGA1 Volume' 4
}

function disable_headset_mic
{
    echo "disabling headset mic"
    tinymix 'UL1_CH1 ADDA_UL_CH1' 0
    tinymix 'UL1_CH2 ADDA_UL_CH2' 0

    tinymix 'ADC L Mux' 'Idle'
    tinymix 'ADC R Mux' 'Idle'
    tinymix 'PGA L Mux' 'None'
    tinymix 'PGA R Mux' 'None'
}

# setup

enable_headset_mic

# start recording
tinycap /data/data/test1_${VOCALTRACT}.wav -D 0 -d 9 -c 1 -r 48000 -b 16 -p 1024 -n 8 -T 2

disable_headset_mic
