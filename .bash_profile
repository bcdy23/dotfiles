# User dependent .bash_profile file
export WORKSPACE=${USERPROFILE}/programming

# Custom Bash Scripts
BASH_SCRIPT="~/.script"

PROGRAM="/usr/lib"

# ENV for Prograaming tools
CODE_TOOL="${PROGRAM}/programming"
        #C++ specific tools
        C_TOOL="${CODE_TOOL}/c/tool"

        #C++ Testing Framework
        export C_TEST="${C_TOOL}/catch"
        #C++ Ninja Build Tools
        C_NINJA="${C_TOOL}/ninja"
        #C++ Curses Library
        export C_CURSES="${C_TOOL}/pdcurses"
        #C++ Make Binary
        C_MAKE="/mingw64/bin"

        #Java specific tools
        JAVA_HOME="${CODE_TOOL}/java"
#End ENV for Programming tools

#ENV for Sumatra PDF
PDF="${PROGRAM}/sumatra_pdf"

#ENV for Lynx Browser
LYNX="${PROGRAM}/lynx"

#ENV for Inkscape
INKSCAPE="${PROGRAM}/inkscape"

#ENV for Latex
LATEX="${PROGRAM}/texlive/bin/win32"

PATH="$BASH_SCRIPT:$C_NINJA:$C_MAKE:$JAVA_HOME/bin:$PDF:$LYNX:$LATEX:$PATH"

# source the users bashrc if it exists
if [ -f "${HOME}/.bashrc" ] ; then
  source "${HOME}/.bashrc"
fi
