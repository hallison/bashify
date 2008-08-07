####
# Description:
#   Set color in text console.
#
# Options:
#   Modes foreground (-f) and background (-b).
#   Colors black (0), red (1), green (2), brown or yellow (3), blue (4)
#   purple (5), cyan (6) and gray or white (7).
#
# Usage:
#   color <MODE> <COLOR>
#
# Author:
#   Hallison V. Batista <hallison.batista@gmail.com>
#

function color {
  declare option_mode=''

  case $1 in
    -f|foreground ) option_mode="3" ;;
    -b|background ) option_mode="4" ;;
    *             ) echo "$BASH_SOURCE: line $LINENO: invalid mode"; return 64 ;;
  esac

  shift

  case $1 in
    0|black        ) printf "${ESCAPE}${option_mode}0m" ; return $? ;;
    1|red          ) printf "${ESCAPE}${option_mode}1m" ; return $? ;;
    2|green        ) printf "${ESCAPE}${option_mode}2m" ; return $? ;;
    3|brown|yellow ) printf "${ESCAPE}${option_mode}3m" ; return $? ;;
    4|blue         ) printf "${ESCAPE}${option_mode}4m" ; return $? ;;
    5|purple       ) printf "${ESCAPE}${option_mode}5m" ; return $? ;;
    6|cyan         ) printf "${ESCAPE}${option_mode}6m" ; return $? ;;
    7|gray|white   ) printf "${ESCAPE}${option_mode}7m" ; return $? ;;
    *              ) {
      printf "$BASH_SOURCE: line $LINENO: option required";
      return 64
    } ;; # TODO: Return correct code
  esac
}

