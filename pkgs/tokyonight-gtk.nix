{ stdenvNoCC, fetchFromGitHub, nodePackages }:

let
   colors = import ../systems/shared/themes/tokyonight {};
in

stdenvNoCC.mkDerivation {
  pname    = "tokyonight-gtk";
  version  = "v1.0";

  src = fetchFromGitHub {
    owner  = "phocus";
    repo   = "gtk";
    rev    = "0cf0eb35a927bffcb797db8a074ce240823d92de";
    sha256 = "sha256-URuoDJVRQ05S+u7mkz1EN5HWquhTC4OqY8MqAbl0crk=";
  };

  patches = [
    ../patches/npm.diff
    ../patches/gradients.diff
    ../patches/substitute.diff
  ];

  postPatch = ''
    substituteInPlace scss/gtk-3.0/_colors.scss \
      --replace "@bg0@"       "#${colors.nbg}" \
      --replace "@bg1@"       "#${colors.lbg}" \
      --replace "@bg2@"       "#${colors.blk}" \
      --replace "@bg3@"       "#${colors.gry}" \
      --replace "@bg4@"       "#${colors.wht}" \
      --replace "@secondary@" "#${colors.dfg}" \
      --replace "@primary@"   "#${colors.nfg}" \
      --replace "@red@"       "#${colors.red_d}" \
      --replace "@lred@"      "#${colors.red}" \
      --replace "@orange@"    "#${colors.ylw_d}" \
      --replace "@lorange@"   "#${colors.ylw}" \
      --replace "@yellow@"    "#${colors.ylw_d}" \
      --replace "@lyellow@"   "#${colors.ylw}" \
      --replace "@green@"     "#${colors.grn_d}" \
      --replace "@lgreen@"    "#${colors.grn}" \
      --replace "@cyan@"      "#${colors.cya_d}" \
      --replace "@lcyan@"     "#${colors.cya}" \
      --replace "@blue@"      "#${colors.blu_d}" \
      --replace "@lblue@"     "#${colors.blu}" \
      --replace "@purple@"    "#${colors.mag_d}" \
      --replace "@lpurple@"   "#${colors.mag}" \
      --replace "@pink@"      "#${colors.mag_d}" \
      --replace "@lpink@"     "#${colors.mag}"
  '';

  preInstall = ''
    substituteInPlace index.theme \
      --replace "phocus"    "tokyonight"
  '';

  nativeBuildInputs = [ nodePackages.sass ];
  installFlags = [ "DESTDIR=$(out)" "PREFIX=" ];
}
