{ config, pkgs, ... }:

{
  home.username = "feniljain";
  home.homeDirectory = "/Users/feniljain/";

  home.stateVersion = "22.11";

  programs.home-manager.enable = true;

  home.packages = [
    pkgs.cowsay
  ];
}
