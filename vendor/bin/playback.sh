set -x
# $1: device for output
#     spk: speaker
#     left-one-spk: left one speaker
#     left-two-spk: left two speaker
#     right-one-spk: right one speaker
#     right-two-spk: right two speaker

# tinyplay file.wav [-D card] [-d device] [-p period_size] [-n n_periods]
# sample usage: playback.sh spk
# rcv.wav:-4.5dbfs   spk: -4.8dbfs  ultra: -4.5dbfs  spk_hp:-1.8dbfs

function enable_speaker
{
    echo "enabling speaker"
    tinymix 'ADDA_DL_CH1 DL1_CH1' 1
    tinymix 'ADDA_DL_CH2 DL1_CH2' 1
    tinymix 'ADDA_DL_CH1 DL2_CH1' 1
    tinymix 'ADDA_DL_CH2 DL2_CH2' 1

    tinymix 'Ext_Speaker_Amp Switch' 1

    tinymix 'DAC In Mux' 'Normal Path'
    tinymix 'LOL Mux' 'Playback'
    tinymix 'RCV Mux' 'Voice Playback'

    tinymix 'Lineout Volume' 5
    tinymix 'Handset Volume' 5

    tinymix 'SpkrRight Two Sipa Audio Scene' 'Playback'
    tinymix 'SpkrRight One Sipa Audio Scene' 'Playback'
    tinymix 'SpkrLeft Two Sipa Audio Scene' 'Playback'
    tinymix 'SpkrLeft One Sipa Audio Scene' 'Playback'

    tinymix 'SpkrRight Two Sipa Power' 'On'
    tinymix 'SpkrRight One Sipa Power' 'On'
    tinymix 'SpkrLeft Two Sipa Power' 'On'
    tinymix 'SpkrLeft One Sipa Power' 'On'

    sleep 1
}

function disable_speaker
{
    echo "disabling speaker"
    tinymix 'ADDA_DL_CH1 DL1_CH1' 0
    tinymix 'ADDA_DL_CH2 DL1_CH2' 0
    tinymix 'ADDA_DL_CH1 DL2_CH1' 0
    tinymix 'ADDA_DL_CH2 DL2_CH2' 0

    tinymix 'Ext_Speaker_Amp Switch' 0

    tinymix 'LOL Mux' 'Open'
    tinymix 'RCV Mux' 'Open'

    tinymix 'SpkrRight Two Sipa Power' 'Off'
    tinymix 'SpkrRight One Sipa Power' 'Off'
    tinymix 'SpkrLeft Two Sipa Power' 'Off'
    tinymix 'SpkrLeft One Sipa Power' 'Off'
}

function enable_speaker_left_one
{
    echo "enabling speaker left one"
    tinymix 'ADDA_DL_CH1 DL1_CH1' 1
    tinymix 'ADDA_DL_CH2 DL1_CH2' 1
    tinymix 'ADDA_DL_CH1 DL2_CH1' 1
    tinymix 'ADDA_DL_CH2 DL2_CH2' 1

    tinymix 'Ext_Speaker_Amp Switch' 1

    tinymix 'DAC In Mux' 'Normal Path'
    tinymix 'LOL Mux' 'Playback'
    tinymix 'RCV Mux' 'Voice Playback'

    tinymix 'Lineout Volume' 5
    tinymix 'Handset Volume' 5

    tinymix 'SpkrLeft One Sipa Audio Scene' 'Playback'

    tinymix 'SpkrLeft One Sipa Power' 'On'

    sleep 1
}

function disable_speaker_left_one
{
    echo "disabling speaker left one"
    tinymix 'ADDA_DL_CH1 DL1_CH1' 0
    tinymix 'ADDA_DL_CH2 DL1_CH2' 0
    tinymix 'ADDA_DL_CH1 DL2_CH1' 0
    tinymix 'ADDA_DL_CH2 DL2_CH2' 0

    tinymix 'Ext_Speaker_Amp Switch' 0

    tinymix 'LOL Mux' 'Open'
    tinymix 'RCV Mux' 'Open'

    tinymix 'SpkrLeft One Sipa Power' 'Off'
}

function enable_speaker_left_two
{
    echo "enabling speaker left two"
    tinymix 'ADDA_DL_CH1 DL1_CH1' 1
    tinymix 'ADDA_DL_CH2 DL1_CH2' 1
    tinymix 'ADDA_DL_CH1 DL2_CH1' 1
    tinymix 'ADDA_DL_CH2 DL2_CH2' 1

    tinymix 'Ext_Speaker_Amp Switch' 1

    tinymix 'DAC In Mux' 'Normal Path'
    tinymix 'LOL Mux' 'Playback'
    tinymix 'RCV Mux' 'Voice Playback'

    tinymix 'Lineout Volume' 5
    tinymix 'Handset Volume' 5

    tinymix 'SpkrLeft Two Sipa Audio Scene' 'Playback'

    tinymix 'SpkrLeft Two Sipa Power' 'On'

    sleep 1
}

function disable_speaker_left_two
{
    echo "disabling speaker left two"
    tinymix 'ADDA_DL_CH1 DL1_CH1' 0
    tinymix 'ADDA_DL_CH2 DL1_CH2' 0
    tinymix 'ADDA_DL_CH1 DL2_CH1' 0
    tinymix 'ADDA_DL_CH2 DL2_CH2' 0

    tinymix 'Ext_Speaker_Amp Switch' 0

    tinymix 'LOL Mux' 'Open'
    tinymix 'RCV Mux' 'Open'

    tinymix 'SpkrLeft Two Sipa Power' 'Off'
}

function enable_speaker_right_one
{
    echo "enable speaker right one"
    tinymix 'ADDA_DL_CH1 DL1_CH1' 1
    tinymix 'ADDA_DL_CH2 DL1_CH2' 1
    tinymix 'ADDA_DL_CH1 DL2_CH1' 1
    tinymix 'ADDA_DL_CH2 DL2_CH2' 1

    tinymix 'Ext_Speaker_Amp Switch' 1

    tinymix 'DAC In Mux' 'Normal Path'
    tinymix 'LOL Mux' 'Playback'
    tinymix 'RCV Mux' 'Voice Playback'

    tinymix 'Lineout Volume' 5
    tinymix 'Handset Volume' 5

    tinymix 'SpkrRight One Sipa Audio Scene' 'Playback'

    tinymix 'SpkrRight One Sipa Power' 'On'

    sleep 1
}

function disable_speaker_right_one
{
    echo "disable speaker right one"
    tinymix 'ADDA_DL_CH1 DL1_CH1' 0
    tinymix 'ADDA_DL_CH2 DL1_CH2' 0
    tinymix 'ADDA_DL_CH1 DL2_CH1' 0
    tinymix 'ADDA_DL_CH2 DL2_CH2' 0

    tinymix 'Ext_Speaker_Amp Switch' 0

    tinymix 'LOL Mux' 'Open'
    tinymix 'RCV Mux' 'Open'

    tinymix 'SpkrRight One Sipa Power' 'Off'
}

function enable_speaker_right_two
{
    echo "enable speaker right two"
    tinymix 'ADDA_DL_CH1 DL1_CH1' 1
    tinymix 'ADDA_DL_CH2 DL1_CH2' 1
    tinymix 'ADDA_DL_CH1 DL2_CH1' 1
    tinymix 'ADDA_DL_CH2 DL2_CH2' 1

    tinymix 'Ext_Speaker_Amp Switch' 1

    tinymix 'DAC In Mux' 'Normal Path'
    tinymix 'LOL Mux' 'Playback'
    tinymix 'RCV Mux' 'Voice Playback'

    tinymix 'Lineout Volume' 5
    tinymix 'Handset Volume' 5

    tinymix 'SpkrRight Two Sipa Audio Scene' 'Playback'

    tinymix 'SpkrRight Two Sipa Power' 'On'

    sleep 1
}

function disable_speaker_right_two
{
    echo "disable speaker right two"
    tinymix 'ADDA_DL_CH1 DL1_CH1' 0
    tinymix 'ADDA_DL_CH2 DL1_CH2' 0
    tinymix 'ADDA_DL_CH1 DL2_CH1' 0
    tinymix 'ADDA_DL_CH2 DL2_CH2' 0

    tinymix 'Ext_Speaker_Amp Switch' 0

    tinymix 'LOL Mux' 'Open'
    tinymix 'RCV Mux' 'Open'

    tinymix 'SpkrRight Two Sipa Power' 'Off'
}

if [ "$1" = "spk" ]; then
    enable_speaker
    filename=/vendor/etc/spk.wav
    pcm_id=0
elif [ "$1" = "left-one-spk" ]; then
    enable_speaker_left_one
    filename=/vendor/etc/left_one_spk.wav
    pcm_id=0
elif [ "$1" = "left-two-spk" ]; then
    enable_speaker_left_two
    filename=/vendor/etc/left_two_spk.wav
    pcm_id=0
elif [ "$1" = "right-one-spk" ]; then
    enable_speaker_right_one
    filename=/vendor/etc/right_one_spk.wav
    pcm_id=0
elif [ "$1" = "right-two-spk" ]; then
    enable_speaker_right_two
    filename=/vendor/etc/right_two_spk.wav
    pcm_id=0
else
    echo "Usage: playback.sh device; device: spk or spk_hp or rcv"
fi

echo "start playing"
tinyplay $filename -D 0 -d $pcm_id

if [ "$1" = "spk" ]; then
    disable_speaker
elif [ "$1" = "left-one-spk" ]; then
    disable_speaker_left_one
elif [ "$1" = "left-two-spk" ]; then
    disable_speaker_left_two
elif [ "$1" = "right-one-spk" ]; then
    disable_speaker_right_one
elif [ "$1" = "right-two-spk" ]; then
    disable_speaker_right_two
fi

exit 0
