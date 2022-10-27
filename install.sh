#!/bin/bash
# installation script
cd "$HOME" || exit
mkdir tmp_install
cd tmp_install || exit
sudo apt install curl -y
if [ "$1" == 1 ]; then
  curl https://sertifika.meb.gov.tr/MEB_SERTIFIKASI.cer --output MEB_SERTIFIKASI.cer
  openssl x509 -inform DER -in MEB_SERTIFIKASI.cer -out MEB_SERTIFIKASI.crt
  sudo cp MEB_SERTIFIKASI.crt /usr/local/share/ca-certificates/
  sudo chmod 644 /usr/local/share/ca-certificates/MEB_SERTIFIKASI.crt
  sudo update-ca-certificates
fi
wget https://github.com/asandikci/iflbot-setup/archive/refs/heads/main.tar.gz
tar -xzvf main.tar.gz
cd iflbot-setup-main || exit
cd src || exit
ls
chmod +x prerequisites.sh
chmod +x applications.sh
bash prerequisites.sh
bash applications.sh
COMPREPLYa=$(compgen -f -- "/home/iflbot*/.vscode/extensions/")
cp -r danielpinto8zz6.c-cpp-compile-run-1.0.18 "$COMPREPLYa"
cd || exit
rm -r tmp_install
