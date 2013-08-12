#
# status-left
#

## Declare the variable of each segment
#
#   tmux-powerline segments path: ${segments_path}
#
#   tmux-powerline-wrapper segments path: ${wrapper_segments_path}
#
declare -A tmux_session_info
tmux_session_info+=(["script"]="${segments_path}/tmux_session_info.sh")
tmux_session_info+=(["foreground"]="colour234")
tmux_session_info+=(["background"]="colour148")
tmux_session_info+=(["separator"]="${separator_right_bold}")

declare -A hostname
hostname+=(["script"]="${segments_path}/hostname.sh")
hostname+=(["foreground"]="white")
hostname+=(["background"]="colour63")
hostname+=(["separator"]="${separator_right_bold}")

declare -A username
username+=(["script"]="whoami")
username+=(["foreground"]="colour238")
username+=(["background"]="colour69")
username+=(["separator"]="${separator_right_bold}")

declare -A ostype
ostype+=(["script"]="${wrapper_segments_path}/ostype.sh")
ostype+=(["foreground"]="colour21")
ostype+=(["background"]="colour33")
ostype+=(["separator"]="${separator_right_bold}")

declare -A lan_ip
lan_ip+=(["script"]="${segments_path}/lan_ip.sh")
lan_ip+=(["foreground"]="colour255")
lan_ip+=(["background"]="colour24")
lan_ip+=(["separator"]="${separator_right_bold}")

declare -A wan_ip
wan_ip+=(["script"]="${segments_path}/wan_ip.sh")
wan_ip+=(["foreground"]="colour255")
wan_ip+=(["background"]="colour24")
wan_ip+=(["separator"]="${separator_right_thin}")
wan_ip+=(["separator_fg"]="white")

declare -A vcs_branch
vcs_branch+=(["script"]="${segments_path}/vcs_branch.sh")
vcs_branch+=(["foreground"]="colour88")
vcs_branch+=(["background"]="colour52")
vcs_branch+=(["separator"]="${separator_right_bold}")

declare -A vcs_compare
vcs_compare+=(["script"]="${segments_path}/vcs_compare.sh")
vcs_compare+=(["foreground"]="white")
vcs_compare+=(["background"]="colour60")
vcs_compare+=(["separator"]="${separator_right_bold}")

declare -A vcs_staged
vcs_staged+=(["script"]="${segments_path}/vcs_staged.sh")
vcs_staged+=(["foreground"]="white")
vcs_staged+=(["background"]="colour64")
vcs_staged+=(["separator"]="${separator_right_bold}")

declare -A vcs_modified
vcs_modified+=(["script"]="${segments_path}/vcs_modified.sh")
vcs_modified+=(["foreground"]="white")
vcs_modified+=(["background"]="red")
vcs_modified+=(["separator"]="${separator_right_bold}")

declare -A vcs_others
vcs_others+=(["script"]="${segments_path}/vcs_others.sh")
vcs_others+=(["foreground"]="black")
vcs_others+=(["background"]="colour245")
vcs_others+=(["separator"]="${separator_right_bold}")

#
# Register Segments
#
register_segment "tmux_session_info"
if [ "$window_width" -ge 160 ]; then
    register_segment "hostname"
fi
if [ "$window_width" -ge 200 ]; then
    register_segment "username"
fi
if [ "$window_width" -ge 140 ]; then
    register_segment "ostype"
fi
register_segment "lan_ip"
register_segment "wan_ip"
if [ "$window_width" -ge 188 ]; then
    register_segment "vcs_branch"
fi
if [ "$window_width" -ge 230 ]; then
    register_segment "vcs_compare"
    register_segment "vcs_staged"
    register_segment "vcs_modified"
    register_segment "vcs_others"
fi

