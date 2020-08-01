$ErrorActionPreference = 'Stop';
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'get-poetry.py'

# original download url, for reference (ignore in favor of bundled copy):
# url         = 'https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py'
# Get-ChocolateyWebFile $packageName $fileLocation -Url $url -checksum $checksum -checksumType $checksumType

$pythonLocation = Get-Command python.exe | Select-Object -ExpandProperty Definition
$statementsToRun = "$fileLocation -y"
Start-ChocolateyProcessAsAdmin $statementsToRun $pythonLocation -ValidExitCodes @(0)
