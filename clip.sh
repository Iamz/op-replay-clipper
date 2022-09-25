#!/bin/bash
#
# Clipper Argbash
#
# ARG_OPTIONAL_SINGLE([smear-seconds],[],[Seconds to start before the starting seconds for the view to settle],[60])
# ARG_OPTIONAL_SINGLE([start-seconds],[s],[Seconds to start at],[60])
# ARG_OPTIONAL_SINGLE([length-seconds],[l],[Clip length],[30])
# ARG_OPTIONAL_BOOLEAN([e2e-long],[e],[Turn on or off e2e long],[off])
# ARG_OPTIONAL_SINGLE([jwt-token],[j],[JWT Auth token to use (get token from https://jwt.comma.ai)])
# ARG_OPTIONAL_SINGLE([video-cwd],[c],[video working and output directory],[/shared])
# ARG_POSITIONAL_SINGLE([route_id],[comma connect route id, segment id is ignored (hint, put this in quotes otherwise your shell might misinterpret the pipe) ])
# ARG_HELP([The general script's help msg])
# ARGBASH_GO()
# needed because of Argbash --> m4_ignore([
### START OF CODE GENERATED BY Argbash v2.9.0 one line above ###
# Argbash is a bash code generator used to get arguments parsing right.
# Argbash is FREE SOFTWARE, see https://argbash.io for more info
# Generated online by https://argbash.io/generate


die()
{
	local _ret="${2:-1}"
	test "${_PRINT_HELP:-no}" = yes && print_help >&2
	echo "$1" >&2
	exit "${_ret}"
}


begins_with_short_option()
{
	local first_option all_short_options='slejch'
	first_option="${1:0:1}"
	test "$all_short_options" = "${all_short_options/$first_option/}" && return 1 || return 0
}

# THE DEFAULTS INITIALIZATION - POSITIONALS
_positionals=()
# THE DEFAULTS INITIALIZATION - OPTIONALS
_arg_smear_seconds="60"
_arg_start_seconds="60"
_arg_length_seconds="30"
_arg_e2e_long="off"
_arg_jwt_token=
_arg_video_cwd="/shared"


print_help()
{
	printf '%s\n' "The general script's help msg"
	printf 'Usage: %s [--smear-seconds <arg>] [-s|--start-seconds <arg>] [-l|--length-seconds <arg>] [-e|--(no-)e2e-long] [-j|--jwt-token <arg>] [-c|--video-cwd <arg>] [-h|--help] <route_id>\n' "$0"
	printf '\t%s\n' "<route_id>: comma connect route id, segment id is ignored (hint, put this in quotes otherwise your shell might misinterpret the pipe) "
	printf '\t%s\n' "--smear-seconds: Seconds to start before the starting seconds for the view to settle (default: '60')"
	printf '\t%s\n' "-s, --start-seconds: Seconds to start at (default: '60')"
	printf '\t%s\n' "-l, --length-seconds: Clip length (default: '30')"
	printf '\t%s\n' "-e, --e2e-long, --no-e2e-long: Turn on or off e2e long (off by default)"
	printf '\t%s\n' "-j, --jwt-token: JWT Auth token to use (get token from https://jwt.comma.ai) (no default)"
	printf '\t%s\n' "-c, --video-cwd: video working and output directory (default: '/shared')"
	printf '\t%s\n' "-h, --help: Prints help"
}


parse_commandline()
{
	_positionals_count=0
	while test $# -gt 0
	do
		_key="$1"
		case "$_key" in
			--smear-seconds)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_smear_seconds="$2"
				shift
				;;
			--smear-seconds=*)
				_arg_smear_seconds="${_key##--smear-seconds=}"
				;;
			-s|--start-seconds)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_start_seconds="$2"
				shift
				;;
			--start-seconds=*)
				_arg_start_seconds="${_key##--start-seconds=}"
				;;
			-s*)
				_arg_start_seconds="${_key##-s}"
				;;
			-l|--length-seconds)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_length_seconds="$2"
				shift
				;;
			--length-seconds=*)
				_arg_length_seconds="${_key##--length-seconds=}"
				;;
			-l*)
				_arg_length_seconds="${_key##-l}"
				;;
			-e|--no-e2e-long|--e2e-long)
				_arg_e2e_long="on"
				test "${1:0:5}" = "--no-" && _arg_e2e_long="off"
				;;
			-e*)
				_arg_e2e_long="on"
				_next="${_key##-e}"
				if test -n "$_next" -a "$_next" != "$_key"
				then
					{ begins_with_short_option "$_next" && shift && set -- "-e" "-${_next}" "$@"; } || die "The short option '$_key' can't be decomposed to ${_key:0:2} and -${_key:2}, because ${_key:0:2} doesn't accept value and '-${_key:2:1}' doesn't correspond to a short option."
				fi
				;;
			-j|--jwt-token)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_jwt_token="$2"
				shift
				;;
			--jwt-token=*)
				_arg_jwt_token="${_key##--jwt-token=}"
				;;
			-j*)
				_arg_jwt_token="${_key##-j}"
				;;
			-c|--video-cwd)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_video_cwd="$2"
				shift
				;;
			--video-cwd=*)
				_arg_video_cwd="${_key##--video-cwd=}"
				;;
			-c*)
				_arg_video_cwd="${_key##-c}"
				;;
			-h|--help)
				print_help
				exit 0
				;;
			-h*)
				print_help
				exit 0
				;;
			*)
				_last_positional="$1"
				_positionals+=("$_last_positional")
				_positionals_count=$((_positionals_count + 1))
				;;
		esac
		shift
	done
}


handle_passed_args_count()
{
	local _required_args_string="'route_id'"
	test "${_positionals_count}" -ge 1 || _PRINT_HELP=yes die "FATAL ERROR: Not enough positional arguments - we require exactly 1 (namely: $_required_args_string), but got only ${_positionals_count}." 1
	test "${_positionals_count}" -le 1 || _PRINT_HELP=yes die "FATAL ERROR: There were spurious positional arguments --- we expect exactly 1 (namely: $_required_args_string), but got ${_positionals_count} (the last one was: '${_last_positional}')." 1
}


assign_positional_args()
{
	local _positional_name _shift_for=$1
	_positional_names="_arg_route_id "

	shift "$_shift_for"
	for _positional_name in ${_positional_names}
	do
		test $# -gt 0 || break
		eval "$_positional_name=\${1}" || die "Error during argument parsing, possibly an Argbash bug." 1
		shift
	done
}

parse_commandline "$@"
handle_passed_args_count
assign_positional_args 1 "${_positionals[@]}"

# OTHER STUFF GENERATED BY Argbash

### END OF CODE GENERATED BY Argbash (sortof) ### ])
# [ <-- needed because of Argbash
# ] <-- needed because of Argbash

set -ex

# Cleanup processes for easy fast testing.
# Rely on Docker to clean up containers processes in production though
function cleanup() {
    tmux list-panes -s -t clipper -F "#{pane_pid} #{pane_current_command}" \
    | grep -v tmux | awk '{print $1}' | xargs kill -9 || true
}

function ctrl_c() {
    cleanup
    pkill -P $$ || true
}
# trap ctrl-c and call ctrl_c()
trap ctrl_c INT

# # Cleanup stale stuff from last run
cleanup

STARTING_SEC=$_arg_start_seconds
# Sometimes it takes a bit of time for openpilot drawing to settle in.
SMEAR_AMOUNT=$_arg_smear_seconds
SMEARED_STARTING_SEC=$(($STARTING_SEC - $SMEAR_AMOUNT))
RECORDING_LENGTH=$_arg_length_seconds
# Cleanup trailing segment count. Seconds is what matters
ROUTE=$(echo "$_arg_route_id" | sed 's/--[0-9]$//')
RENDER_E2E_LONG=$_arg_e2e_long
JWT_AUTH=$_arg_jwt_token
VIDEO_CWD=$_arg_video_cwd
VIDEO_RAW_OUTPUT=$VIDEO_CWD/clip.mkv
VIDEO_OUTPUT=$VIDEO_CWD/clip.mp4

# Starting seconds must be greater than 30
if [ "$STARTING_SEC" -lt $SMEAR_AMOUNT ]; then
    echo "Starting seconds must be greater than $SMEAR_AMOUNT"
    exit 1
fi

pushd /home/batman/openpilot

if [ ! -z "$JWT_AUTH" ]; then
    mkdir -p "$HOME"/.comma/
    echo "{\"access_token\": \"$JWT_AUTH\"}" > "$HOME"/.comma/auth.json
fi

# Start processes
tmux new-session -d -s clipper -n x11 "Xtigervnc :0 -geometry 1920x1080 -SecurityTypes None"
tmux new-window -n replay -t clipper: "TERM=xterm-256color faketime -m -f \"+0 x0.5\" ./tools/replay/replay -s \"$SMEARED_STARTING_SEC\" \"$ROUTE\""
tmux new-window -n ui -t clipper: 'faketime -m -f "+0 x0.5" ./selfdrive/ui/ui'

# Pause replay and let it download the route
tmux send-keys -t clipper:replay Space
sleep 3

tmux send-keys -t clipper:replay Enter "$SMEARED_STARTING_SEC" Enter
tmux send-keys -t clipper:replay Space
sleep 1
tmux send-keys -t clipper:replay Space

# Generate and start overlay
echo "Route: $ROUTE , Starting Second: $STARTING_SEC" > /tmp/overlay.txt
overlay /tmp/overlay.txt &

# Record with ffmpeg
mkdir -p "$VIDEO_CWD"
pushd "$VIDEO_CWD"
# Render with e2e_long
if [ "$RENDER_E2E_LONG" = "on" ]; then
	echo -n "1" > ~/.comma/params/d/EndToEndLong
else
	echo -n "0" > ~/.comma/params/d/EndToEndLong
fi
# Make sure the UI runs at full speed.
nice -n 10 ffmpeg -framerate 10 -video_size 1920x1080 -f x11grab -draw_mouse 0 -i :0.0 -ss "$SMEAR_AMOUNT" -vcodec libx264rgb -crf 0 -preset ultrafast -r 20 -filter:v "setpts=0.5*PTS,scale=1920:1080" -y -t "$RECORDING_LENGTH" "$VIDEO_RAW_OUTPUT"
# The setup is no longer needed. Just transcode now.
cleanup
ffmpeg -y -i "$VIDEO_RAW_OUTPUT" -c:v libx264 -b:v 2060k -pix_fmt yuv420p -preset medium -pass 1 -an -f MP4 /dev/null
ffmpeg -y -i "$VIDEO_RAW_OUTPUT" -c:v libx264 -b:v 2060k -pix_fmt yuv420p -preset medium -pass 2 -movflags +faststart -f MP4 "$VIDEO_OUTPUT"

ctrl_c
