# =============================================================================
# .bashrc
# =============================================================================

export DOTFILES_LOC="${HOME}/Development/git/Bitbucket+GitHub/jasoncscott/dotfiles/"

export SOURCED_BASHRC=true

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

bash_profile_file="${HOME}/.bash_profile"
if [ -f "${bash_profile_file}" ] && [ -z "${SOURCED_BASH_PROFILE}" ]; then
    echo "Sourcing ${bash_profile_file}"
    . ${HOME}/.bash_profile
fi


# =============================================================================
# SETTINGS
# =============================================================================

complete -d cd  # Complete only to directories


# =============================================================================
# VARIABLES
# =============================================================================

# macOS zsh message
export BASH_SILENCE_DEPRECATION_WARNING=1

# Path to Readline run commands (init) file
inputrc_file="${DOTFILES_LOC}/_shell/inputrc"
if [ -f ${inputrc_file} ]; then
    export INPUTRC=${inputrc_file}
fi

# Path to VI run commands file
vimrc_file="${DOTFILES_LOC}/vim/vimrc"
if [ -f ${vimrc_file} ]; then
    export VIMINIT="source ${vimrc_file}"
fi

# Path to Python startup file
pythonstartup_file="${DOTFILES_LOC}/python/pythonstartup"
if [ -f ${pythonstartup_file} ]; then
    export PYTHONSTARTUP=${pythonstartup_file}
fi
export PYTHONDONTWRITEBYTECODE=true
#export PYTHONPROFILEIMPORTTIME=true

# Enabling symlinks in Git Bash for Windows
export MSYS=winsymlinks:nativestrict


# History
export HISTCONTROL=erasedups
export HISTFILESIZE=5000
export HISTIGNORE="&:ls:[bf]g;exit"
export HISTTIMEFORMAT="%F %T"

# Colors
export LS_COLORS=$(vivid generate snazzy)
#export GREP_COLORS=

# Debug
#export LD_DEBUG=libs

# Other variables
export EDITOR="vi"
export LOCATION="home"  # Prompt is set to 4-character padding for location name

if [[ ${OSTYPE} = linux* ]]; then
	export MANPAGER="sh -c 'col --no-backspaces --spaces | bat --language man'"  # No `bat` themes have `man` support as of 0.22.1
	export PAGER="less --quit-if-one-screen --RAW-CONTROL-CHARS"
fi


# =============================================================================
# SOFTWARE-SPECIFIC VARIABLES
# =============================================================================

# ADOBE
# Substance Painter
export ALG_PAINTER_DEBUG_FPS=true

# AMAZON
# Thinkbox
#export DEADLINE_CUSTOM_PATH="${HOME}/Development/git/deadline/custom/"

# AUTODESK, INC.
export ADCLMHUB_LOG_LEVEL=D  # Cloud licensing debug logs
# Arnold
export ARNOLD_ADP_OPTIN=0
# Maya
export MAYA_DISABLE_CER=true  # Disable customer error reporting
export MAYA_DISABLE_CLIC_IPM=true  # Disable cloud login utilities
export MAYA_DISABLE_CIP=true  # Avoid fatal crash on startup

# FOUNDRY
# Nuke
export FOUNDRY_LICENSE_DEBUG=true
#export NUKE_FONT_PATH=${HOME}/.fonts/

# SIDEFX
# Houdini (http://www.sidefx.com/docs/houdini/ref/env.html)
export HOUDINI_VERBOSE_ERROR=true
export HOUDINI_IMAGE_DEBUG=true
export HOUDINI_SCRIPT_DEBUG=true
export HOUDINI_DSO_ERROR=3
export HOUDINI_ENABLE_UNDO_BUG_NOTIFY=true
export HOUDINI_PACKAGE_VERBOSE=true
export HOUDINI_VIEWER_STATE_VERBOSE=true
export HOUDINI_ANONYMOUS_STATISTICS=false
export HOUDINI_OGL_DEBUG=4
export HOUDINI_OGL_DUMP_SHADER_ERRORS=true
#export HOUDINI_OUTLINEFONT_PATH=@:${HOME}/.fonts/

# VIDEO COPILOT
# Optical Flares
export OPTICAL_FLARES_VERBOSE_CONSOLE=1

# =============================================================================
source-safe() {
    if [ -f "${1}" ]; then
        source "${1}"
    fi
}

# =============================================================================
# INPUTRC (Readline init file)
# =============================================================================

# Source only if interactive shell (test special parameter for "i" option)
if [[ $- == *i* ]]; then
    bind -f ${INPUTRC}
fi


# =============================================================================
# BAT
# =============================================================================

# On systems with `bash-completion` installed
if [[ "${OS}" == "Windows*" ]]; then
    bat_completion_file="${HOME}/Documents/bin/releases/bat/windows/x86_64/production/autocomplete/bat.bash"
else
    bat_completion_file="${HOME}/Documents/bin/releases/bat/production/linux/x86_64/autocomplete/bat.bash"
fi
source-safe ${bat_completion_file}


# =============================================================================
# COLORS
# =============================================================================

shell_colors_file="${DOTFILES_LOC}/_shell/shell_colors.sh"
source-safe ${shell_colors_file}

tput_colors_file="${DOTFILES_LOC}/_shell/tput_colors.sh"
source-safe ${tput_colors_file}


# =============================================================================
# EZA (FORMERLY EXA)
# =============================================================================

# On systems with `bash-completion` installed
exa_completion_file="${HOME}/Documents/bin/releases/exa/production/linux/x86_64/completions/exa.bash"

#if [ -f "${exa_completion_file}" ]; then
#    export BASH_COMPLETION_USER_DIR="${HOME}/Documents/bin/bash-completion"
#fi


# =============================================================================
# GIT
# =============================================================================

export GIT_CONFIG_GLOBAL="${DOTFILES_LOC}/git/gitconfig"

# git prompt completion
if [[ "${OS}" == "Windows*" ]]; then
    git_prompt_file="/c/Program\ Files/Git/etc/profile.d/git-prompt.sh"
elif [[ ${OSTYPE} = darwin* ]]; then
    git_prompt_file="${DOTFILES_LOC}/git/git-prompt.sh"
else
    git_prompt_file=/usr/share/git-core/contrib/completion/git-prompt.sh
fi

source-safe ${git_prompt_file}

# git autocomplete
# On systems with `bash-completion` installed
if [[ ${OSTYPE} = darwin* ]]; then
    git_completion_file="${DOTFILES_LOC}/git/git-completion.bash"
else
    git_completion_file=/usr/share/bash-completion/completions/git
fi

source-safe ${git_completion_file}


# =============================================================================
# LESS
# =============================================================================

# Due to desire to use external commands in LESS environment variables (e.g.,
# `tput`), source own file
lessrc_file="${DOTFILES_LOC}/_shell/lessrc.sh"
if [ -f ${lessrc_file} ]; then
    # Can cause slowdown
    printf "\n"
    echo "Not going to" source ${lessrc_file}  # Custom name following `rc` files
fi


# =============================================================================
# PYTHON
# =============================================================================

# Windows does not use these from the shell

#PIP_CONFIG_FILE="${DOTFILES_LOC}/python/pip.ini"
#PIP_TARGET="Z:\Applications_and_Programs\Python_Software_Foundation-python\site-packages"
#PYTHONPATH=${PIP_TARGET}


# =============================================================================
# REZ
# =============================================================================

export REZ_CONFIG_FILE=${REZ_CONFIG_FILE}:"${DOTFILES_LOC}/rez/rezconfig.py"

#unalias wch  # Unalias Folks-specific alias
# `rez` tab-complete
if [[ "${OS}" == "Windows*" ]]; then
    rez_complete_file=/c/rez/2.97.0/windows-10/completion/complete.sh
else
    PATH=${PATH}:/opt/rez/bin/rez  # Add `rez` to ${PATH}
    rez_complete_file=/opt/rez/completion/complete.sh
fi

source-safe ${rez_complete_file}


# =============================================================================
# PROMPT
# =============================================================================

prompt_file="${DOTFILES_LOC}/_shell/prompt.sh"
source-safe ${prompt_file}
#eval "$(starship init bash)"
export STARSHIP_CONFIG="${DOTFILES_LOC}/starship/starship.toml"


# =============================================================================
# ALIASES
# =============================================================================

aliases_file="${DOTFILES_LOC}/_shell/aliases.sh"
# Source personal aliases
source-safe ${aliases_file}

aliases_work_file="${DOTFILES_LOC}/_shell/aliases_work.sh"
source-safe ${aliases_work_file}


# =============================================================================
# STARTUP INFO
# =============================================================================

.startup_info() {
    printf "\n"

    # System Information (could use `lscpu` or `uname`, but doesn't run on Windows)
    printf "${Black}${On_Red}"
    printf ${Black}${On_Red}" System Information "${Red}""${Color_Off}
    printf "\n"
    printf "Processor Model: $(grep 'model name' /proc/cpuinfo -m 1 | sed 's|.*:\s*||')\n" 
    printf "Cores: $(grep 'core id' /proc/cpuinfo | sort | uniq | wc -l)\n"
    printf "Threads: $(grep 'processor' /proc/cpuinfo | wc -l)\n"
    printf "Memory: $(grep 'MemTotal' /proc/meminfo | sed 's|.*:\s*||' | awk '{print $1/1024000}' | sed 's|\..*||')GB\n"
    printf "GPU: $(lspci | grep VGA)\n"
    printf "\n"

    # OS Information
    printf "${Black}${On_Yellow}"
    printf ${Black}${On_Yellow}" OS Information "${Yellow}${On_Black}""${Color_Off}
    printf "\n"
    pprintvar "OS"
    pprintvar "OSTYPE"
    if [[ ${OSTYPE} = darwin* ]]; then
        printf "$(sw_vers -productVersion).$(sw_vers -buildVersion) ($(awk '/SOFTWARE LICENSE AGREEMENT FOR macOS/' '/System/Library/CoreServices/Setup Assistant.app/Contents/Resources/en.lproj/OSXSoftwareLicense.rtf' | awk -F 'macOS ' '{print $NF}' | awk '{print substr($0, 0, length($0)-1)}'))\n"
    else
        printf "$(cat /proc/version)\n"
    #printf "$(cat /etc/os-release)\n"
    fi

    printf "Current OS Options (\${MSYS}):"
    # Choose one of the next two lines
    printf " "${MSYS}
    #printf "\n"${MSYS} | sed "s|:|\n|g" | sed "s|^|    |"
    printf "\nFor more information, try \`dmidecode\`"
    printf "\n\n"

    # Shell Information
    printf "${Black}${On_Green}"
    printf ${On_Green}${Black}" Shell Information "${Green}${On_Black}""${Color_Off}
    printf "\n"
    printf "Current Shell Options (\${SHELLOPTS}):"
    # Choose one of the next two lines
    printf " "${SHELLOPTS}
    #printf "\n"${SHELLOPTS} | sed "s|:|\n|g" | sed "s|^|    |"
    printf "\n(Same as Special Variables (\$-): $-)"
    printf "\n\n"

    # Bash Information
    printf "${Black}${On_Blue}"
    printf ${On_Blue}${Black}" Bash Information "${Blue}${On_Black}""${Color_Off}
    printf "\n"
    pprintvar "BASH_VERSION"
    printf "Current Bash Options (\${BASHOPTS}):"
    # Choose one of the next two lines
    printf " "${BASHOPTS}
    #printf "\n"${BASHOPTS} | sed "s|:|\n|g" | sed "s|^|    |"
    printf "\n\n"

    # Users
    printf "${Black}${On_White}"
    printf ${On_IWhite}${Black}" Users "${White}${On_Black}""${Color_Off}
    printf "\n"
    users | sed "s| |\n|g" | uniq | sed "s|^|   |"

    if [ -x "$(command -v fortune)" ]; then
        fortune
    fi

    if [ -x "$(command -v uptime)" ]; then
        uptime
    fi

    # Blizzard
    printf "${Black}${On_Cyan}"
    printf ${On_Cyan}${Black}" Blizzard "${Cyan}${On_Black}""${Color_Off}
    printf "\n"
    pprintvar "PACKAGE_CACHE_PATH"
    pprintvar "BL_TEAM"
    pprintvar "T2_PKG_ROOT"
}

# For Interactive Shells
if [[ $- == *i* ]]; then
    .startup_info
fi
