FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
    file://cp21xx.cfg \
    file://0001-imx8mp-evk-navq-dtb-make.patch \
    file://imx8mp-evk-navq.dts \
"

SRCREV = "ef3f2cfc6010c13feb40cfb7fd7490832cf86f45"

do_patch_append() {
    cp ${WORKDIR}/imx8mp-evk-navq.dts ${S}/arch/arm64/boot/dts/freescale/
}

do_configure_append () {
    ${S}/scripts/kconfig/merge_config.sh -m -O ${WORKDIR}/build ${WORKDIR}/build/.config ${WORKDIR}/*.cfg
}
