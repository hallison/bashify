declare lib_path=lib

source $lib_path/text.sh

function test_text_modes {
  mode console   ; echo "This text should be in console mode."   ; mode console;
  mode strong    ; echo "This text should be in strong mode."    ; mode console;
  mode normal    ; echo "This text should be in normal mode."    ; mode console;
  mode underline ; echo "This text should be in underline mode." ; mode console;
  mode blink     ; echo "This text should be in blink mode."     ; mode console;
  mode reverse   ; echo "This text should be in reverse mode."   ; mode console;

  echo "Should show 'invalid: error' message." ; mode error ; echo $?
  echo "Should show 'option required.'"        ; mode       ; echo $?
}

function test_text_colors {
  mode console
  color foreground black  ; echo "This text should be in black color in foreground."
  color foreground red    ; echo "This text should be in red color in foreground."
  color foreground green  ; echo "This text should be in green color in foreground."
  color foreground brown  ; echo "This text should be in brown color in foreground."
  color foreground blue   ; echo "This text should be in blue color in foreground."
  color foreground purple ; echo "This text should be in purple color in foreground."
  color foreground cyan   ; echo "This text should be in cyan color in foreground."
  color foreground gray   ; echo "This text should be in gray color in foreground."

  mode console
  color background black  ; echo "This text should be in black color in background."
  color background red    ; echo "This text should be in red color in background."
  color background green  ; echo "This text should be in green color in background."
  color background brown  ; echo "This text should be in brown color in background."
  color background blue   ; echo "This text should be in blue color in background."
  color background purple ; echo "This text should be in purple color in background."
  color background cyan   ; echo "This text should be in cyan color in background."
  color background gray   ; echo "This text should be in gray color in background."

  mode console
}

declare -a    function_list=($(declare -F | sed 's/declare -f//'))
declare -a        test_list=()
declare    function_defined=''
declare       test_function=''

for function_defined in ${function_list[@]}; do
  [[ $function_defined =~ "^test_.+$" ]] && test_function=${function_defined}
  test_list=(${test_list[@]//$test_function} $test_function)
done

for t in ${test_list[@]}; do
  echo "T: Running ${t} ..."
  $t
done

exit $?
