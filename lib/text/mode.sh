####
# Description:
#   Set text mode console.
#
# Options:
#   console (-c), strong (-s), normal (-n), underline (-u), blink (-b)
#   and reverse (-r).
#
# Usage:
#   mode <OPTION>
#
# Author:
#   Hallison V. Batista <hallison.batista@gmail.com>
#

function mode {
  [[ $# -eq 0 ]] && { printf "$BASH_SOURCE: line $LINENO: option required"; return 64; }
  case $1 in
    -c|console   ) printf "${ESCAPE}0m" ; return $? ;;
    -s|strong    ) printf "${ESCAPE}1m" ; return $? ;;
    -n|normal    ) printf "${ESCAPE}2m" ; return $? ;;
    -u|underline ) printf "${ESCAPE}4m" ; return $? ;;
    -b|blink     ) printf "${ESCAPE}5m" ; return $? ;;
    -r|reverse   ) printf "${ESCAPE}7m" ; return $? ;;
    *            ) { 
      printf "$BASH_SOURCE: line $LINENO: invalid: $1"
      return 65
    } ;; # TODO: Return correct code
  esac
}
