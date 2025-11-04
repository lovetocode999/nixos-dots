{ config, lib, pkgs, ... }:

{
  programs.nixvim = {
    # Enable nixvim and set it as the default editor
    enable = true;
    defaultEditor = true;

    globalOpts = {
      # Workman keyboard layout
      langmap = "qq,dw,re,wr,bt,jy,fu,ui,po,\\;p,aa,ss,hd,tf,gg,yh,nj,ek,ol,i:,zz,xx,mc,cv,vb,kn,lm,QQ,DW,RE,WR,BT,JY,FU,UI,PO,:P,AA,SS,HD,TF,GG,YH,NJ,EK,OL,I\\;,ZZ,XX,MC,CV,VB,KN,LM";
    };

    opts = {
      # Line numbers
      number = true;
      relativenumber = true;

      # Highlight the current line
      cursorline = true;
    };

    # Gruvbox
    colorschemes.gruvbox = {
      enable = true;
      autoLoad = true;

      settings = {
        contrast = "hard";
      };
    };

    # Plugins
    plugins = {
      cmp.enable = true;
      cmp-latex-symbols.enable = true;
    };
  };
}
