declare lib_path=lib

source $lib_path/text.sh

function test_text_modes {
  mode console   ; echo "This text should be in console mode."   ; text normal;
  mode strong    ; echo "This text should be in strong mode."    ; text normal;
  mode normal    ; echo "This text should be in normal mode."    ; text normal;
  mode underline ; echo "This text should be in underline mode." ; text normal;
  mode blink     ; echo "This text should be in blink mode."     ; text normal;
  mode reverse   ; echo "This text should be in reverse mode."   ; text normal;

  echo "Should show error message"       ; text invalid; echo $?
  echo "Should show 'option required.'" ; text        ; echo $?
}

function test_text_colors {
  text mode console
  color --foreground black ; echo "This text should be in black color in foreground."
  color --foreground red   ; echo "This text should be in red color in foreground."
  color --foreground green   ; echo "This text should be in green color in foreground."
  color --foreground brown   ; echo "This text should be in brown color in foreground."
  color --foreground blue   ; echo "This text should be in blue color in foreground."
  color --foreground purple   ; echo "This text should be in purple color in foreground."
  color --foreground cyan   ; echo "This text should be in cyan color in foreground."
  color --foreground gray   ; echo "This text should be in gray color in foreground."

  text console
  color --background black ; echo "This text should be in black color in background."
  color --background red   ; echo "This text should be in red color in background."
  color --background green   ; echo "This text should be in green color in background."
  color --background brown   ; echo "This text should be in brown color in background."
  color --background blue   ; echo "This text should be in blue color in background."
  color --background purple   ; echo "This text should be in purple color in background."
  color --background cyan   ; echo "This text should be in cyan color in background."
  color --background gray   ; echo "This text should be in gray color in background."

  text console
}
declare -a test_list=()

for f in $(declare -F); do
  [[ $f =~ 'test' ]] && t=${f/'declare'} || t=''
  test_list=(${test_list[@]} ${t/'-f'})
done

for t in ${test_list[@]}; do
  echo "T: Running ${t} ..."
  $t
done

exit $?
