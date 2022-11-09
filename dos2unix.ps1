[string[]]$Excludes = @('*node_modules*')
foreach ( $file in dir -include ('*.php', '*.htm', '*.html', '*.css', '*.js', '*.jsx', '*.ts', '*.tsx') -exclude $Excludes -recurse)
{
        $allowed = $true
        foreach ($exclude in $Excludes) { 
            if ((Split-Path $file.FullName -Parent) -ilike $exclude) { 
                $allowed = $false
                break
            }
        }
        if ($allowed) {
            .\dos2unix.exe $file.FullName
        }
}