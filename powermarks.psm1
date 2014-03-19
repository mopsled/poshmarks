$marks = @{}
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$marksPath = "$scriptDir\powermarks.csv"

if (test-path $marksPath) {
    import-csv $marksPath | %{$marks[$_.key]=$_.value}
}

function j($name) {
    if (!$name) {
        return usage
    }

    cd $marks[$name]
}

function jl {
    $marks
}

function js($name) {
    if (!$name) {
        return usage
    }

    $marks[$name] = (pwd).path
    $marks.getenumerator() | export-csv $marksPath -notype
}

function jd($name) {
    if (!$name) {
        return usage
    }

    $marks.remove($name)
    $marks.getenumerator() | export-csv $marksPath -notype
}

function usage() {
    Write-Host
    Write-Host "  js <name> - Saves the current directory as `"name`""
    Write-Host "  j  <name> - Go to directory with jumpmark `"name`""
    Write-Host "  jd <name> - Delete jumpmark `"name`""
    Write-Host "  jl        - List jumpmarks"
}