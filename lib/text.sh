############################################################################
# Bashify - Text library functions
#
# Copyright (C) 2007, 2008 by Hallison Vasconcelos Batista
# --------------------------------------------------------------------------
#   This file is part of Bashify.
#
#   Bashify is free software; you can redistribute it and or modify it under
#   the terms of the GNU Lesser General Public License as published by the
#   Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.
#
#   Bashify is distributed in the hope that it will be useful, but WITHOUT
#   ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
#   FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
#   more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the
#   Free Software Foundation, Inc.,
#   59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
# --------------------------------------------------------------------------

#DOC
# Description:
#   This script should be used as library in source script file or into
#   Bash sessions. The goal is improve text features and commands into
#   console.
#
# Author:
#   Hallison Vasconcelos Batista <hallison.batista@gmail.com>
#
# Timestamp:
#   2008.08.05 17:24:51 AMT
#
# Version:
#   0.1.0
#
# Requirements:
#   None
#
# Changelog:
#   * 0.1.0, 2008.08.05
#     * Initial build.
#
# Todo:
#   * Run tests.
#

declare -r ESCAPE="\033["

source lib/text/mode.sh
source lib/text/color.sh

# [[ $# -eq 0 ]] && { echo "$BASH_SOURCE: line $LINENO: option required"; return 1; } || $@
