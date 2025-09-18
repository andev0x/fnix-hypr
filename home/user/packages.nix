{ pkgs, pkgs-unstable, ... }:

{
  

  home.packages = [

    # Dev stuff
    # JetBrains Rider may not be available for ARM
    # pkgs.jetbrains.rider
    pkgs.dotnet-sdk_8
    pkgs.dotnetPackages.Nuget
    pkgs.gcc
    pkgs.go
    pkgs.lua
    pkgs.nodejs_21
    pkgs.nodePackages.pnpm
    (pkgs.python3.withPackages (python-pkgs: [
        python-pkgs.pip
        python-pkgs.requests
    ]))
    pkgs.rustup
    # Cross-compilation packages not available on ARM
    # pkgs.pkgsCross.mingwW64.stdenv.cc 
    # pkgs.pkgsCross.mingwW64.windows.pthreads
    pkgs.zig
    
    # Work stuff
    pkgs.obsidian
    pkgs.teams-for-linux
    pkgs.thunderbird
    pkgs.zoom-us
    pkgs.libreoffice-qt
    pkgs.hunspell
 
    # Bluetooth
    pkgs.blueberry

    

    # Social
    pkgs.telegram-desktop
    pkgs-unstable.vesktop

    # Gaming (some packages may have limited ARM support)
    pkgs.steam
    pkgs.steam-run
    # Yuzu may not be available or work well on ARM
    # pkgs.yuzu-mainline
    # Lutris and Wine may have limited ARM support
    # (pkgs.lutris.override {
    #   extraPkgs = pkgs: [
    #     pkgs.wineWowPackages.stable
    #     pkgs.winetricks
    #   ];
    # })

    # Downloads
    pkgs.qbittorrent

    # Utils
    pkgs.viewnior
    pkgs-unstable.hyprshot
    pkgs.catppuccin-cursors.macchiatoBlue
    pkgs.catppuccin-gtk
    pkgs.papirus-folders
  ];
}
