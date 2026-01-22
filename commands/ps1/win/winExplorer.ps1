# --- 4. Web検索結果をスタートメニューから除外する ---
$commonPath = "HKCU:\Software\Policies\Microsoft\Windows\Explorer"
if (-not (Test-Path $commonPath)) { New-Item -Path $commonPath -Force }
Set-ItemProperty -Path $commonPath -Name "DisableSearchBoxSuggestions" -Value 1
