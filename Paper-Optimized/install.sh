#!/bin/ash
# shellcheck shell=dash
# Paper Installation Script
#
# Server Files: /mnt/server
if [ -f "${SERVER_JARFILE}" ]; then
    bash <(curl -s https://raw.githubusercontent.com/Veslydev/Vesly-Eggs/main/Paper-Optimized/launch.sh)
else
    PROJECT=paper
    if [ -n "${DL_PATH}" ]; then
        echo "Verilen indirme URL'sini kullanma: ${DL_PATH}"
        DOWNLOAD_URL=$(eval echo $(echo ${DL_PATH} | sed -e 's/{{/${/g' -e 's/}}/}/g'))
    else
        VER_EXISTS=$(curl -s https://api.papermc.io/v2/projects/${PROJECT} | jq -r --arg VERSION $MINECRAFT_VERSION '.versions[] | contains($VERSION)' | grep -m1 true)
        LATEST_VERSION=$(curl -s https://api.papermc.io/v2/projects/${PROJECT} | jq -r '.versions' | jq -r '.[-1]')
        if [ "${VER_EXISTS}" = "true" ]; then
            echo "Version geçerlidir. Sürüm kullanma ${MINECRAFT_VERSION}"
        else
            echo "Belirtilen sürüm bulunamadı. Varsayılan olarak en son ${PROJECT} sürümü"
            MINECRAFT_VERSION=${LATEST_VERSION}
        fi
        BUILD_EXISTS=$(curl -s https://api.papermc.io/v2/projects/${PROJECT}/versions/${MINECRAFT_VERSION} | jq -r --arg BUILD ${BUILD_NUMBER} '.builds[] | tostring | contains($BUILD)' | grep -m1 true)
        LATEST_BUILD=$(curl -s https://api.papermc.io/v2/projects/${PROJECT}/versions/${MINECRAFT_VERSION} | jq -r '.builds' | jq -r '.[-1]')
        if [ "${BUILD_EXISTS}" = "true" ]; then
            echo "Derleme ${MINECRAFT_VERSION} sürümü için geçerlidir. Yapı ${BUILD_NUMBER} kullanılıyor"
        else
            echo "MINECRAFT_VERSION} sürümü için en son ${PROJECT} derlemesini kullanma"
            BUILD_NUMBER=${LATEST_BUILD}
        fi
        JAR_NAME=${PROJECT}-${MINECRAFT_VERSION}-${BUILD_NUMBER}.jar
        echo "İndirilmekte olan sürüm"
        echo "MC Versiyonu: ${MINECRAFT_VERSION}"
        echo "Yapı: ${BUILD_NUMBER}"
        echo "JAR Yapının Adı: ${JAR_NAME}"
        DOWNLOAD_URL=https://api.papermc.io/v2/projects/${PROJECT}/versions/${MINECRAFT_VERSION}/builds/${BUILD_NUMBER}/downloads/${JAR_NAME}
    fi
    cd /mnt/server || exit
    mkdir logs
    echo "curl -o çalıştırılıyor ${SERVER_JARFILE} ${DOWNLOAD_URL}"
    if [ -f "${SERVER_JARFILE}" ]; then
        mv "${SERVER_JARFILE}" "${SERVER_JARFILE}.old"
    fi
    curl -o "${SERVER_JARFILE}" "${DOWNLOAD_URL}"
    if [ ! -f server.properties ]; then
        echo "MC server.properties dosyasını indirme"
        curl -o server.properties https://raw.githubusercontent.com/parkervcp/eggs/master/minecraft/java/server.properties
        curl -o spigot.yml https://raw.githubusercontent.com/Veslydev/Vesly-Eggs/main/Paper-Optimized/config/spigot.yml
        curl -o bukkit.yml https://raw.githubusercontent.com/Veslydev/Vesly-Eggs/main/Paper-Optimized/config/bukkit.yml
        mkdir config
        (
            cd config || exit
            curl -o paper-world-defaults.yml https://raw.githubusercontent.com/Veslydev/Vesly-Eggs/main/Paper-Optimized/config/paper-world-defaults.yml
        )
    fi
fi
