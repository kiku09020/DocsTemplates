# --- クリップボード ---
$cbPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Clipboard"
# キーが存在しない場合に作成
if (-not (Test-Path $cbPath)) {
    New-Item -Path $cbPath -Force
}
# 履歴を有効にする (1=有効, 0=無効)
Set-ItemProperty -Path $cbPath -Name "EnableClipboardHistory" -Value 1


# --- マウスカーソルのサイズを変更する ---
# 1: 標準, 2: 中, 3: 大, 4: 特大 (最大16まで)
$cursorSize = 2

$cursorPath = "HKCU:\Control Panel\Cursors"
Set-ItemProperty -Path $cursorPath -Name "CursorBaseSize" -Value ($cursorSize * 32)

$personalizePath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize"

# --- ダークモード ---
# システム（タスクバーなど）をダークモードにする
Set-ItemProperty -Path $personalizePath -Name "SystemUsesLightTheme" -Value 0
# アプリ（エクスプローラーなど）をダークモードにする
Set-ItemProperty -Path $personalizePath -Name "AppsUseLightTheme" -Value 0

# --- エクスプローラー ---
$explorerPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"

# 隠しファイルを表示する (1 = 表示, 2 = 非表示)
Set-ItemProperty -Path $explorerPath -Name "Hidden" -Value 1
# 登録されている拡張子を表示する (0 = 表示, 1 = 非表示)
Set-ItemProperty -Path $explorerPath -Name "HideFileExt" -Value 0
# エクスプローラーの「PC」をデフォルトで開く
Set-ItemProperty -Path $explorerPath -Name "LaunchTo" -Value 1

# --- 設定を反映させるためにエクスプローラーを再起動 ---
Stop-Process -Name explorer -Force

# --- タスクバー ---
# 検索を非表示 (0=非表示, 1=アイコンのみ, 2=検索ボックス)
$searchPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search"
Set-ItemProperty -Path $searchPath -Name "SearchboxTaskbarMode" -Value 0

# タスクビューを非表示 (0=非表示, 1=表示)
$taskViewPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
Set-ItemProperty -Path $taskViewPath -Name "ShowTaskViewButton" -Value 0

# ウィジェットを非表示 (0=非表示, 1=表示)
$widgetPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
Set-ItemProperty -Path $widgetPath -Name "TaskbarDa" -Value 0

# --- Windows Explorer ---
# web検索結果無効化
$commonPath = "HKCU:\Software\Policies\Microsoft\Windows\Explorer"
if (-not (Test-Path $commonPath)) { New-Item -Path $commonPath -Force }
Set-ItemProperty -Path $commonPath -Name "DisableSearchBoxSuggestions" -Value 1
