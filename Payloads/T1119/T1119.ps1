Get-ChildItem -Recurse -Include *.txt | %{Copy-Item $_.FullName -destination C:\temp\}