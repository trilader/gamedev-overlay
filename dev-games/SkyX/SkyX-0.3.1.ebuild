EAPI=5

inherit eutils cmake-utils

DESCRIPTION="Sky for Ogre"
SRC_URI="http://github.com/trilader/gamedev-overlay-files/raw/master/SkyX-${PV}.tar.bz2"
LICENSE="LGPL"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="samples"
RDEPEND="dev-util/cmake
        dev-games/ois
        dev-games/ogre"

DEPEND="${RDEPEND}"

CMAKE_VERBOSE=OFF

src_prepare()
{
    epatch "${FILESDIR}/${PV}-fix-cmake-module-path.patch"
}

src_configure()
{
    local mycmakeargs=(
        $(cmake-utils_use samples SKYX_BUILD_SAMPLES)
        $(cmake-utils_use samples SKYX_INSTALL_SAMPLES)
    )
    cmake-utils_src_configure
}

src_install()
{
    cmake-utils_src_install
}
