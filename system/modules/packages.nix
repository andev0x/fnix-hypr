
{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    bat
    btop
    eza
    fzf
    git
    gnumake
  ] ++ (lib.optionals pkgs.stdenv.isAarch64 [
    # ARM-specific packages can be added here
  ]) ++ [
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
    libsForQt5.qt5.qtsvg
    neofetch
    neovim
    ripgrep
    tldr
    unzip
    openssl
    openssl.dev
    pkg-config
    wget
    xfce.thunar
    xdg-desktop-portal-gtk
    xdg-desktop-portal-wlr
    zip
    zoxide
  ];
}

