#!/bin/bash

JAVA_8='/usr/lib/jvm/java-1.8.0-openjdk-amd64'
JAVA_11='/usr/lib/jvm/java-1.11.0-openjdk-amd64'

echo "Digite qual versão do java você deseja: "
echo " 1 - OpenJDK 8"
echo " 2 - OpenJDK 11"
read JAVA_VERSION_CHOICE

if [ $JAVA_VERSION_CHOICE == 1 ]
then
    JAVA_VERSION_CHOICE=$JAVA_8
fi

if [ $JAVA_VERSION_CHOICE == 2 ]
then
    JAVA_VERSION_CHOICE=$JAVA_11
fi

COMMAND="sudo update-java-alternatives --set $JAVA_VERSION_CHOICE"

eval $COMMAND
echo export JAVA_HOME="$JAVA_VERSION_CHOICE/bin" | sudo tee /etc/profile.d/jdk_home.sh > /dev/null

echo ""
echo ""
echo "Para aplicar as alterações na variavel JAVA_HOME você precisa reiniciar o computador."
echo "Você deseja fazer isso agora?"
echo " 1 - Sim"
echo " 2 - Não"
read REBOOT_CHOICE

if [ $REBOOT_CHOICE == 1 ]
then
    sudo reboot
fi