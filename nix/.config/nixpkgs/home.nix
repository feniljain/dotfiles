{ config, pkgs, ... }:

{
  home.username = "feniljain";
  home.homeDirectory = "/Users/feniljain/";

  home.stateVersion = "22.11";

  programs.home-manager.enable = true;

 /*
 Except of these packages, some are which still are preferred
 to be installed manually like:
    - java ( so JDK )
    - neovim ( latest version not available on nixpkgs )
 */
  home.packages = [
    /* Must have */
    pkgs.fzf
    pkgs.ripgrep
    pkgs.stow
    pkgs.tmux
    pkgs.wget
    pkgs.vifm
    pkgs.htop

    /* Good to have */
    pkgs.bat
    pkgs.cmake
    pkgs.ffmpeg
    pkgs.skaffold
    pkgs.jq
    pkgs.pgcli
    pkgs.tldr
    pkgs.fd
    pkgs.difftastic

    /*
    Nice to have pkgs which are
    already preinstalled in mac
    */
    /* pkgs.vim */
    /* pkgs.curl */

    /* Pkg not supported in mac */
    /* pkgs.helm */
  ];
}
