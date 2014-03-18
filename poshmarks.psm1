$marks = @{}
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$marksPath = "$scriptDir\poshmarks.csv"

if(test-path $marksPath){
    import-csv $marksPath | %{$marks[$_.key]=$_.value}
}

function j($number) {
    cd $marks["$number"]
}

function jl {
    $marks
}

function js($number) {
    $marks["$number"] = (pwd).path
    $marks.getenumerator() | export-csv $marksPath -notype
}

function jd($number) {
    $marks.remove("$number")
    $marks.getenumerator() | export-csv $marksPath -notype
}
