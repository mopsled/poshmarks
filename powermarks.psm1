$marks = @{}
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$marksPath = "$scriptDir\powermarks.csv"

if (test-path $marksPath) {
    import-csv $marksPath | %{$marks[$_.key]=$_.value}
} else {
    $marks = @{"home" = $home}
    $marks.getenumerator() | export-csv $marksPath -notype
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
    Write-Host "  j  <name> - Jump to directory with powermark `"name`""
    Write-Host "  jd <name> - Delete powermark `"name`""
    Write-Host "  jl        - List powermarks"
}
