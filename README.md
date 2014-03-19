Powermarks
==========

An implementation of [bashmarks](https://github.com/huyng/bashmarks "bashmarks") for Powershell.

### Usage

    js <name> - Saves the current directory as "name"
    j  <name> - Jump to directory with powermark "name"
    jd <name> - Delete powermark "name"
    jl        - List powermarks


### Example

    > cd 'C:\Users\alec\Documents\Visual Studio 2013\Projects'
    > js projects
    > cd C:\Users\alec\Dropbox\notes
    > js notes
    > jl
        
        Name                           Value
        ----                           -----
        projects                       C:\Users\alec\Documents\Visual Studio 2013\Projects
        notes                          C:\Users\alec\Dropbox\notes
        
    > j projects
    > j notes
