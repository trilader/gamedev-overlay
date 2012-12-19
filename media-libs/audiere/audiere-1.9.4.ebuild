EAPI=5

inherit eutils

DESCRIPTION="Audiere is a high-level audio API. It can play Ogg Vorbis, MP3, FLAC, uncompressed WAV, AIFF, MOD, S3M, XM, and IT files. For audio output, Audiere supports DirectSound or WinMM in Windows, OSS on Linux and Cygwin, and SGI AL on IRIX"
SRC_URI="http://downloads.sourceforge.net/project/audiere/audiere/${PV}/audiere-${PV}.tar.gz"
LICENSE="LGPL"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RDEPEND=""

DEPEND="${RDEPEND}"

src_prepare()
{
    epatch "${FILESDIR}/${PV}-fix-missing-includes.patch"
}
