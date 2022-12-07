#!/bin/bash
###########################################################
# Install prerequisites, necessary applications/tools and #
# set up configs for end user in iflbot computers         #
#                                                         #
# Author: Aliberk Sandıkçı                                #
# School: Izmir Science High School                       #
###########################################################

# Error Handling
set -e
trap _cleanup EXIT HUP INT TERM

# Variables
VERSION="0.0.3"
# user=$([ -n "$SUDO_USER" ] && echo "$SUDO_USER" || echo "$USER")
# home="/home/${user}"
temp_file="$(mktemp -u)"
temp_dir="$(mktemp -d)"
repo_tag="main"
repo_dest="https://github.com/asandikci/iflbot-setup"
repo_name="iflbot-setup"
src_dir="$temp_dir/$repo_name-$repo_tag/src/"

cat <<-EOF
 /\$\$\$\$\$\$ /\$\$\$\$\$\$\$\$ /\$\$       /\$\$\$\$\$\$\$   /\$\$\$\$\$\$  /\$\$\$\$\$\$\$\$
|_  \$\$_/| \$\$_____/| \$\$      | \$\$__  \$\$ /\$\$__  \$\$|__  \$\$__/
  | \$\$  | \$\$      | \$\$      | \$\$  \ \$\$| \$\$  \ \$\$   | \$\$   
  | \$\$  | \$\$\$\$\$   | \$\$      | \$\$\$\$\$\$\$ | \$\$  | \$\$   | \$\$   
  | \$\$  | \$\$__/   | \$\$      | \$\$__  \$\$| \$\$  | \$\$   | \$\$   
  | \$\$  | \$\$      | \$\$      | \$\$  \ \$\$| \$\$  | \$\$   | \$\$   
 /\$\$\$\$\$\$| \$\$      | \$\$\$\$\$\$\$\$| \$\$\$\$\$\$\$/|  \$\$\$\$\$\$/   | \$\$   
|______/|__/      |________/|_______/  \______/    |__/   
LAB COMPUTER SETUP SCRIPT - VERSION $VERSION
EOF

# FUNCTIONS

#run with sudo if $2 is not executable
_sudo() {
  if [ -x "$2" ]; then
    "$@"
  else
    sudo "$@"
  fi
}

#download and install certificate
_certificate() {
  echo "Dowloading MEB certificate ..."
  timeout 10 wget -qO "$temp_file" "http://sertifika.meb.gov.tr/MEB_SERTIFIKASI.cer" || (echo -e "There was an error with the dowloading certificate\nAborting..." && return 1)

  echo "Converting .cer file to .crt file ..."
  openssl x509 -inform DER -in "$temp_file" -out "$temp_file"

  echo "Moving certificate to /usr/local/share/ca-certificates/"
  sudo mv "$temp_file" "/usr/local/share/ca-certificates/MEB_SERTIFIKASI.crt"

  echo "Giving necessary file permission"
  sudo chmod 644 /usr/local/share/ca-certificates/MEB_SERTIFIKASI.crt

  echo "Updating certificate configs ..."
  sudo update-ca-certificates
}

#download from GitHub
_download() {
  echo "Getting the latest version from GitHub ..."
  wget -O "$temp_file" "${repo_dest}/archive/${repo_tag}.tar.gz"

  echo "Unpacking archive to $temp_dir ..."
  tar -xzf "$temp_file" -C "$temp_dir"
}

#install packages
_install() {
  if [ -f "$src_dir/prerequisites.sh" ]; then
    echo "Installing prerequisites ..."
    _sudo bash "$src_dir/prerequisites.sh"
  fi
  if [ -f "$src_dir/applications.sh" ]; then
    echo "Installing applications ..."
    _sudo bash "$src_dir/applications.sh"
  fi
  if [ -f "$src_dir/config.sh" ]; then
    echo "Configuring settings ..."
    _sudo bash "$src_dir/config.sh"
  fi
}

#clear cache, delete temporary files
_cleanup() {
  echo "Clearing cache ..."
  rm -rf "$temp_file" "$temp_dir"
  echo "Done!"
}

# Main
if [[ "$1" == "cert" ]]; then
  _certificate
fi
_download
_install
_reboot