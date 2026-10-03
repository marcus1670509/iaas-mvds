# Publica o index.html no IIS.
# O index.html é baixado pela CustomScriptExtension (fileUris) a partir da pasta src
# do mesmo repositório GitHub do azure-pipelines.yml, e fica na mesma pasta deste script.

# Garante que o IIS está instalado (não faz nada se já estiver)
Install-WindowsFeature -Name Web-Server -IncludeManagementTools | Out-Null

$origem  = Join-Path $PSScriptRoot 'index.html'
$destino = 'C:\inetpub\wwwroot\index.html'

if (-not (Test-Path $origem)) {
    Write-Error "Arquivo index.html não encontrado em $PSScriptRoot"
    exit 1
}

Copy-Item -Path $origem -Destination $destino -Force
Write-Output "index.html publicado em $destino"
