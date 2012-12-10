EAPI=5

inherit subversion eutils cmake-utils

DESCRIPTION="A C++ GUI library for OpenGL and the Ogre3D engine"
SRC_URI=""
LICENSE="LGPL"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc +ogre opengl +tools samples plugins static plugins +freetype"
REQUIRED_USE="^^ ( ogre opengl )"
RDEPEND="dev-util/cmake
        >=dev-libs/boost-1.51
        dev-games/ois
        doc? ( app-text/doxygen )
        ogre? ( >=dev-games/ogre-1.8 )"

DEPEND="${RDEPEND}"

ESVN_REPO_URI="http://my-gui.svn.sourceforge.net/svnroot/my-gui/tags/MyGUI3.2"
CMAKE_VERBOSE=OFF

src_unpack()
{
    subversion_fetch
}

src_configure()
{
    local mycmakeargs=(
        $(cmake-utils_use doc MYGUI_BUILD_DOCS)
        $(cmake-utils_use doc MYGUI_INSTALL_DOCS)
        $(cmake-utils_use tools MYGUI_BUILD_TOOLS)
        $(cmake-utils_use tools MYGUI_INSTALL_TOOLS)
        $(cmake-utils_use samples MYGUI_INSTALL_SAMPLES)
        $(cmake-utils_use samples MYGUI_INSTALL_SAMPLES_SOURCE)
        $(cmake-utils_use plugins MYGUI_BUILD_PLUGINS)
        $(cmake-utils_use static MYGUI_STATIC)
        $(cmake-utils_use freetype MYGUI_USE_FREETYPE)
        $(usex ogre "-DMYGUI_RENDERSYSTEM=3" "-DMYGUI_RENDERSYSEM=4"))

    cmake-utils_src_configure
}

src_install()
{
    cmake-utils_src_install
}
