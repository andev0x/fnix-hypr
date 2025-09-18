{ config, pkgs, pkgs-unstable, lib, inputs, ... }:

{
  imports = [
    ./user
  ];
  
  home.username = "andev";
  home.homeDirectory = "/home/andev";
  home.stateVersion = "23.11";
}

