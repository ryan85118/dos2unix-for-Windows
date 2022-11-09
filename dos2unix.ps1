Param ([string] $Path)

Write-Host "Script Start"

if (!$Path) { 
    Write-Host "Path is null" 
    Write-Host "Executing exit command"
    exit
}

[string[]]$Excludes = @('*node_modules*')
[string[]]$Include = @('*.php', '*.htm', '*.html', '*.css', '*.js', '*.jsx', '*.ts', '*.tsx')

Write-Output "dos2unix start: $Path"

$Files = @(Get-ChildItem -Path $Path -Exclude $Excludes | Get-ChildItem -Include $Include -Recurse)

ForEach ($file in $Files) {
    ./src/dos2unix.exe $file.FullName
}

Write-Host "Script End"