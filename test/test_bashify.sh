declare project_path="test/bashfoo"

function test_should_build_new_project {
  bin/bashify project $project_path
  [[ $? ]] && echo "R: Success" || "> Failure"
}

function test_should_validates_directory_tree {
  declare -a tree=(bin doc etc lib test vendor)

  for dir in ${tree[@]}; do
    echo -n "Checking $project_path/$dir ... "
    if [[ -d $project_path/$dir ]]; then
      echo "Exists"
      result=(${result[@]} 0)
    else
      echo "Not exists"
      result=(${result[@]} 1)
    fi
    success=(${success[@]} 0)
  done

  [[ ${result[*]} == ${success[*]} ]] && echo "R: Success" || echo "R: Failure"
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
