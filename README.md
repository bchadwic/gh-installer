# gh-installer
Test repo for installing gh cli, using inno setup instead of msi / wix

# Setup

1. Clone
2. Download / Install inno setup https://jrsoftware.org/isdl.php
3. Place a gh cli exectuable (built for your windows arch) in the root of the repository, make sure its named `gh.exe`
4. Open repository .iss files in inno setup, click compile
5. Go to the `Output` file, click on the `GitHub Cli Installer`
