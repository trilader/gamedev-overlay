EAPI=5

inherit git-2 eutils

DESCRIPTION="Hydrax is an completely free add-on for Ogre which aim is to provide an easy-use library in order to render pretty water scenes."
SRC_URI=""
LICENSE="LGPL"

SLOT="0"
KEYWORDS=""
IUSE=""
RDEPEND="dev-games/ogre"

DEPEND="${RDEPEND}"

EGIT_REPO_URI="git://github.com/imperative/CommunityHydrax.git"

src_unpack()
{
    git-2_src_unpack
}

