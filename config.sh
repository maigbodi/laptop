fancy_echo() {
  local fmt="$1"; shift
  printf "\n\e[95m$fmt\e[97m\n\n" "$@"
}

green_echo() {
  local fmt="$1"; shift
  printf "\n\e[92m$fmt\e[97m\n" "$@"
}

input_echo() {
  local fmt="$1"; shift
  printf "\e[33m$fmt\e[97m " "$@"
}


# Get admin password & store in $passwd
echo "Type the administrators password for your laptop..."
input_echo "Admin Password: "
stty -echo
read passwd
stty echo
echo
