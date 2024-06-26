# DOTFILES

<p align="center">
  <kbd>
      <img src="https://img.shields.io/badge/Open%20Source-3DA639?logo=Open%20Source%20Initiative &logoColor=white" />
  </kbd>
</p>
<p align="center">
  <kbd>
      <img src="https://img.shields.io/badge/Git-F05032?logo=Git&logoColor=white" />
      <img src="https://img.shields.io/badge/Python-3776AB?logo=Python&logoColor=white" />
      <img src="https://img.shields.io/badge/Vim-019733?logo=Vim&logoColor=white" />
      <img src="https://img.shields.io/badge/Visual%20Studio%20Code-007ACC?logo=Visual%20Studio%20Code&logoColor=white" />
      <img src="https://img.shields.io/badge/Microsoft%20Terminal-4D4D4D?logo=Windows%20Terminal&logoColor=white" />
  </kbd>
</p>

## History
I started collecting the configuration of my Linux home directory in 2005,
before `dotfiles` became a common term and collected as a repo, so I named mine
`shell/` and used that for years, and finally decided to follow convention and
renamed it in June 2024.

I continue to refine both its structure and the files inside, sometimes imperfectly.

## Requirements
* Files are setup for `bash` primarily, whether run on Linux, Mac, or Windows.
* On Windows, `pyreadline3` is suggested for full Python-shell setup.
* Look at corresponding `bin` repository that the `${PATH}` setup looks for.


## Setup
1. Clone the repo in a place that's easily managed (maybe with other repos, or
on a network if in a setup where multiple computers might use it.
1. Run `setup.sh`, which will:
    1. Set the `${DOTFILES_LOC}` variable to the repo location
    1. Symlink the necessary bash files in `${HOME}`
    1. Symlink Microsoft App Installer (`winget`) and Microsoft Terminal settings to the repo (if they exist)

