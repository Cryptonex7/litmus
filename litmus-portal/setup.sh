# Progress Bar ===================================
#  -- USAGE: progress_bar <time(s)> <speed(0-10)>
progress_bar() {
  local duration=${1}*10
  # local speed=10-${2}+0.075

  already_done() { for ((done = 0; done < $elapsed; done++)); do printf "▇"; done; }
  remaining() { for ((remain = $elapsed; remain < $duration; remain++)); do printf " "; done; }
  percentage() { printf "| %s%%" $(((($elapsed) * 100) / ($duration) * 100 / 100)); }
  clean_line() { printf "\r"; }

  for ((elapsed = 1; elapsed <= $duration; elapsed++)); do
    already_done
    remaining
    percentage
    sleep 0.075
    clean_line
  done
  clean_line
}
# END Progress Bar ===================================

echo ""
echo "========================================"
echo "|                                      |"
echo "|       WELCOME TO LITMUS CHAOS!       |"
echo "|                                      |"
echo "========================================"
echo ""
if [ "${1}" != "--rapid" ] && [ "${1}" != "-r" ]; then
  progress_bar 4
fi

echo "| "
echo "=================="
echo "|-  ENV-CHECKS"
echo "=================="
echo "|"

echo "| ==> ENV: $XDG_CURRENT_DESKTOP"

KDE='KDE'
GNOME='GNOME'

if [[ "$XDG_CURRENT_DESKTOP" == *"$KDE"* ]]; then
  TERMINAL="konsole"
elif [[ "$XDG_CURRENT_DESKTOP" == *"$GNOME"* ]]; then
  TERMINAL="gnome-terminal"
else
  echo "Please enter the terminal executable command for your system:"
  echo "  > "
  read terminal
  TERMINAL=$terminal
fi

echo "|"
echo "=================="
echo "|- PORT CLEANUP"
echo "=================="
echo "|"

./scripts/port_cleanup.sh
if [ "${1}" != "--rapid" ] && [ "${1}" != "-r" ]; then
  progress_bar 1
fi

echo "| |_Clean: "

echo "|"
echo "=================="
echo "|-    SETUP"
echo "=================="
echo "|"

echo "| ==> Running k8s Setup:"
$TERMINAL -e sh ./scripts/k8s_setup.sh &
K8S_SETUP_PID=$!
# Start the Progress Bar:
progress_bar 4
echo "| | "
echo "| =====> Dedicated Terminal: $TERMINAL | pid: $K8S_SETUP_PID"

echo "| | "
echo "| | "
echo "| ==> Running GraphQL:"
$TERMINAL -e sh ./run.sh gql &
GQL_SETUP_PID=$!
# Start the Progress Bar:
progress_bar 3
echo "| | "
echo "| =====> Dedicated Terminal: $TERMINAL | pid: $GQL_SETUP_PID"

echo "| | "
echo "| | "
echo "| ==> Running Auth:"
$TERMINAL -e sh ./run.sh auth &
AUTH_SETUP_PID=$!
# Start the Progress Bar:
progress_bar 2
echo "| | "
echo "| =====> Dedicated Terminal: $TERMINAL | pid: $AUTH_SETUP_PID"
echo "|______________________________________ "
trap "kill -9 $K8S_SETUP_PID $GQL_SETUP_PID $AUTH_SETUP_PID" SIGINT
./scripts/frontend_init.sh
