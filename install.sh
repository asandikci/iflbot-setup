#!/bin/bash
# installation script
CUR_HOME=$(compgen -f -- /home/bot*)
cd "$CUR_HOME" || exit
mkdir tmp_install
cd tmp_install || exit
if [ "$1" == 1 ]; then
  wget http://sertifika.meb.gov.tr/MEB_SERTIFIKASI.cer
  openssl x509 -inform DER -in MEB_SERTIFIKASI.cer -out MEB_SERTIFIKASI.crt
  sudo cp MEB_SERTIFIKASI.crt /usr/local/share/ca-certificates/
  sudo chmod 644 /usr/local/share/ca-certificates/MEB_SERTIFIKASI.crt
  sudo update-ca-certificates
fi
if [ "$1" == 2 ]; then
  sudo cp "$CUR_HOME"/Desktop/MEB_SERTIFIKASI.crt /usr/local/share/ca-certificates/
  sudo chmod 644 /usr/local/share/ca-certificates/MEB_SERTIFIKASI.crt
  sudo update-ca-certificates
fi
sudo apt install curl -y
wget https://github.com/asandikci/iflbot-setup/archive/refs/heads/main.tar.gz
tar -xzvf main.tar.gz
cd iflbot-setup-main || exit
cd src || exit
ls
chmod +x prerequisites.sh
chmod +x applications.sh
bash prerequisites.sh
bash applications.sh
bash prerequisites.sh
EX_PATH="$CUR_HOME"/.vscode/extensions/
mkdir -p "$EX_PATH"
mkdir -p "$CUR_HOME/Desktop/Codes/"
cp main.c "$CUR_HOME/Desktop/Codes/"
cp -r danielpinto8zz6.c-cpp-compile-run-1.0.18 "$EX_PATH"
cd "$CUR_HOME" || exit
rm -r tmp_install
sudo apt-get install gcc -y
echo "INSTALLATION SUCCESSFULLY COMPLETED"
sleep 50
reboot
