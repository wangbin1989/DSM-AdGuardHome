
ADGUARDHOME_RELPATH="usr/local/AdGuardHome/AdGuardHome"
CONFIG_RELPATH="usr/local/AdGuardHome/AdGuardHome.yaml"
ADGUARDHOME="${SYNOPKG_PKGDEST}/${ADGUARDHOME_RELPATH}"
SVC_BACKGROUND=true
SVC_WRITE_PID=true

WEB_ADDR=127.0.0.1:46828

PKGCAP="/usr/local/bin/pkgcap"

SERVICE_COMMAND="${ADGUARDHOME} --web-addr ${WEB_ADDR} -w ${SYNOPKG_PKGVAR} --logfile ${LOG_FILE} --pidfile ${PID_FILE}"

service_postinst ()
{
    CONFIG_FILE="${SYNOPKG_PKGVAR}/AdGuardHome.yaml"
    if [ ! -e ${CONFIG_FILE} ]; then
        CONFIG_TEMPLATE="${SYNOPKG_PKGDEST}/${CONFIG_RELPATH}"
        if [ -e ${CONFIG_TEMPLATE} ]; then
            install -m 644 ${CONFIG_TEMPLATE} ${CONFIG_FILE}
        fi
    fi

    if [ -e $PKGCAP ]; then
        $PKGCAP ${SYNOPKG_PKGNAME} ${ADGUARDHOME_RELPATH} CAP_NET_BIND_SERVICE,CAP_NET_RAW
    fi
}
