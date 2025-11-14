{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  # https://devenv.sh/reference/options/
  packages = with pkgs; [
    # only scheme-full seems to work
    texlive.combined.scheme-full
    gnumake

    watchexec
  ];

  processes.rebuilder.exec = ''
    watchexec --no-meta --timings --debounce="3sec" -w "documents/cv" -w documents/cv.tex -w awesome-cv.cls --exts="tex,cls" -- make cv.pdf
  '';
}
