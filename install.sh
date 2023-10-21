#!/bin/bash
# Izmir Science High School - Computer Lab Setup Script
# Install prerequisites, applications, tools; set up configs etc.
# 2022 - 2023 © Aliberk Sandıkçı

# run quickly:
# curl https://raw.githubusercontent.com/asandikci/iflbot-setup/main/install.sh | bash

# Error Handling
set -e
trap _interrupt HUP INT TERM
trap _cleanup EXIT

#               #
### VARIABLES ###
#               #

VERSION="23.10.21-0"
AUTHOR="asandikci"
temp_file="$(mktemp -u)"
temp_dir="$(mktemp -d)"
git_provider_name="GitHub"
git_provider_url="https://github.com"
git_repo_name="iflbot-setup"
git_repo_dest="$git_provider_url/$AUTHOR/$git_repo_name"
git_repo_tag="main"

src_dir="$temp_dir/$git_repo_name-$git_repo_tag/src/"

# user=$([ -n "$SUDO_USER" ] && echo "$SUDO_USER" || echo "$USER")
# home="/home/${user}"

#                 #
### COLOR CODES ###
#                 #
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
CYAN='\033[0;36m'
GRAY='\033[0;37m \e[3m'
NC='\033[0m \e[0m' # No Color, No Effect
BOLD='\033[1;97m'

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

#               #
### FUNCTIONS ###
#               #

#run with sudo if $2 is not executable
_sudo() {
  if [ -x "$2" ]; then
    "$@"
  else
    sudo "$@"
  fi
}

#feature rich logs with color support
_log() {
  case "$2" in
  fatal | panic)
    echo -e "${RED}[ ⚠⚠⚠ ]${NC} $1 ${RED}ABORTING...${NC}"
    exit
    ;;
  error | err) echo -e "${RED}[ !!! ]${NC} $1" ;;
  warning | warn) echo -e "${ORANGE}[ ⚠ ]${NC} $1" ;;
  ok | okey | done | success) echo -e "${GREEN}[ ✔ ]${NC} $1" ;;
  DONE | OK) echo -e "${GREEN}[ ✔ ]$ $1 {NC}" ;;
  info | inf | status) echo -e "${CYAN}[ i ]${NC} $1" ;;
  verbose | v | verb) echo -e "${GRAY}$1${NC}" ;;
  *) echo -e "$1" ;;
  esac
}

#check input and return boolean value
_checkinput() {
  case "$1" in
  y | Y | e | E | [yY][eE][sS]) return 1 ;;
  [eE][vV]][eE][tT]) return 1 ;;
  [Yy]*) return 1 ;;
  [Ee]*) return 1 ;;
  n | N | H | h | *) return 0 ;;
  esac
}

#auto ask question, check answer and return boolean value
_checkanswer() {
  read -p "(E/H)? " -r choice
  if _checkinput "$choice" -eq 1; then
    return 1
  else
    return 0
  fi

}

#check input and exit if user not confirm progress
_continue_confirmation() {
  read -p "(E/H)? " -r choice
  if _checkinput "$choice" -eq 0; then
    _log "Betik İptal Edildi" info
    exit
  fi
}

#temporasy development playground
_TMP_DEV() {
  echo -e "\n\nGELIŞTIRICI FONKSIYONU CALISTIRILDI\n"

  echo -e "\nGELIŞTIRICI FONKSIYONU BITTI!!!\n\n"
}

#prechecks for starting script
_prechecks() {
  if [ "$(awk -F'^ID=' '{print $2}' /etc/os-release | awk 'NF')" != "pardus" ]; then
    _log "Bu betik sadece GNU/Linux Pardus Dağıtımında (23.0 sürümü) test edilmiştir, farklı bir sistem için devam etmek betiğin çalışmaması ile sonuçlanabilir!" err
    echo "Devam Etmek İstiyor Musunuz"
    _continue_confirmation

  else
    if [ "$(awk -F'^VERSION_ID=' '{print $2}' /etc/os-release | awk 'NF')" != '"23.0"' ]; then
      _log "Bu betik Pardus Dağıtımının sadece 23.0 sürümü ile test edilmiştir. Kodun belirli kısımları çalışmayabilir" warn
      echo "Devam Etmek İstiyor Musunuz"
      _continue_confirmation
    else
      _log "Pardus 23.0 sürümü saptandı" info
      sleep 0.1
      _log "Kurulum için gereksinimler sağlanmakta" ok
    fi
  fi

  sleep 0.2

  _log "Eğer Fatih/MEB internetine ethernet ile bağlı iseniz Sertifika kurmanız gerekebilir. Sertifikayı kurmak istiyor musunuz?" warn
  if _checkanswer -eq 1; then
    _log "MEB sertifikası indiriliyor..." verbose
    timeout 10 wget -qO "$temp_file" "http://sertifika.meb.gov.tr/MEB_SERTIFIKASI.cer" || (_log "Sertifikayı yüklemeye çalışırken bir hata oluştu" fatal)

    echo ".cer uzantılı sertifika dosyası .crt uzantılı sertifika dosyasına dönüştürülüyor..." verbose
    openssl x509 -inform DER -in "$temp_file" -out "$temp_file"

    echo "Sertifika /usr/local/share/ca-certificates/ dizinine taşınıyor" verbose
    sudo mv "$temp_file" "/usr/local/share/ca-certificates/MEB_SERTIFIKASI.crt"

    echo "Sertifika dosyasına gerekli izinler veriliyor" verbose
    sudo chmod 644 /usr/local/share/ca-certificates/MEB_SERTIFIKASI.crt

    echo "Sertifikalar yenileniyor..." verbose
    sudo update-ca-certificates

    _log "MEB Sertifikası başarılı bir şekilde kuruldu, Tarayıcılara manuel olarak eklemeniz gerekebilir" "done"
  fi
}

#download other configs from git provider
_download() {
  wget -O "$temp_file" "${git_repo_dest}/archive/${git_repo_tag}.tar.gz"
  _log "Yapılandırma dosyalarının son sürümleri $git_provider_name üzerinden indirildi" ok

  tar -xzf "$temp_file" -C "$temp_dir"
  _log "Arşiv, $temp_dir dizinine ayıklandı" verbose
}

#install packages
_install() {
  if [ -f "$src_dir/prerequisites.sh" ]; then
    _log "Öngereklilikler Yükleniyor..." info
    _sudo bash "$src_dir/prerequisites.sh"
  fi
  if [ -f "$src_dir/applications.sh" ]; then
    _log "Uygulamalar Yükleniyor..." info
    _sudo bash "$src_dir/applications.sh"
  fi
  if [ -f "$src_dir/config.sh" ]; then
    _log "Ayarlar yapılandırılıyor" info
    _sudo bash "$src_dir/config.sh"
  fi

  sleep 1
  _log "Yükleme İşlemi Tamamlandı" "DONE"
  _log "gerekli ayarları yapmak için ${BOLD}iflbot-config${NC} programını çalıştırabilirsiniz" info
}

#clear cache, delete temporary files
_cleanup() {
  _log "Geçici Dosyalar Temizleniyor ..." info
  rm -rf "$temp_file" "$temp_dir"
  _log "Dosyalar Temizlendi!" "done"
  exit
}

#interrupted by user
_interrupt() {
  _log "Betik kullanıcı tarafından erken sonlandırılıyor" err
  _cleanup
}

#          #
### MAIN ###
#          #

if [[ "$1" == "dev" ]]; then
  _TMP_DEV
  exit
fi

_prechecks
_download
_install