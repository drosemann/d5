// Goose-Port-Spiegel von: projects/archive-unsorted-goose-desktop-companion/Core/GooseAuth.ps1
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/archive-unsorted-goose-desktop-companion/Core/GooseAuth.ps1");
}

// ---- Original-Code (projects/archive-unsorted-goose-desktop-companion/Core/GooseAuth.ps1), unveraendert, als Inline-Doku ----
// using namespace System.Security.Cryptography
// using namespace System.Text
//
// class GooseAuthConfig {
//     static [hashtable] Load([string]$configFile = "config.ini") {
//         $config = @{
//             SupabaseUrl = "http://localhost:8000"
//             SupabaseAnonKey = ""
//             SessionSaveEnabled = $true
//             SessionFilePath = "data/session.enc"
//             AutoRefresh = $true
//         }
//         
//         if (Test-Path $configFile) {
//             Get-Content $configFile | ForEach-Object {
//                 if ($_ -match '^([^=]+)=(.*)$') {
//                     $key = $matches[1].Trim()
//                     $value = $matches[2].Trim()
//                     if ($config.ContainsKey($key)) {
//                         if ($value -eq 'True' -or $value -eq 'False') {
//                             $config[$key] = [bool]$value
//                         } else {
//                             $config[$key] = $value
//                         }
//                     }
//                 }
//             }
//         }
//         return $config
//     }
// }
//
// class GooseUser {
//     [string]$Id
//     [string]$Email
//     [string]$AccessToken
//     [string]$RefreshToken
//     [datetime]$ExpiresAt
//     [datetime]$CreatedAt
//     
//     [bool] IsExpired() {
//         return $this.ExpiresAt -lt (Get-Date).AddMinutes(5)
//     }
//     
//     [bool] IsValid() {
//         return $this.Id -ne "" -and $this.AccessToken -ne ""
//     }
// }
//
// class GooseAuth {
//     [hashtable]$Config
//     [GooseUser]$CurrentUser
//     [bool]$IsAuthenticated
//     
//     GooseAuth([string]$configFile = "config.ini") {
//         $this.Config = GooseAuthConfig::Load($configFile)
//         $this.IsAuthenticated = $false
//         $this.CurrentUser = $null
//     }
//     
//     [string] GetSupabaseUrl() {
//         return $this.Config["SupabaseUrl"]
//     }
//     
//     [hashtable] GetHeaders([bool]$includeAuth = $true) {
//         $headers = @{
//             "apikey" = $this.Config["SupabaseAnonKey"]
//             "Content-Type" = "application/json"
//         }
//         if ($includeAuth -and $this.CurrentUser -and $this.CurrentUser.IsValid()) {
//             $headers["Authorization"] = "Bearer $($this.CurrentUser.AccessToken)"
//         }
//         return $headers
//     }
//     
//     [PSCustomObject] SignIn([string]$email, [string]$password) {
//         try {
//             $url = "$($this.Config['SupabaseUrl'])/auth/v1/token?grant_type=password"
//             $body = @{
//                 email = $email
//                 password = $password
//             } | ConvertTo-Json
//             
//             $headers = @{
//                 "apikey" = $this.Config["SupabaseAnonKey"]
//                 "Content-Type" = "application/json"
//             }
//             
//             $response = Invoke-RestMethod -Uri $url -Method Post -Headers $headers -Body $body -ErrorAction Stop
//             $this.CurrentUser = [GooseUser]@{
//                 Id = $response.user.id
//                 Email = $response.user.email
//                 AccessToken = $response.access_token
//                 RefreshToken = $response.refresh_token
//                 ExpiresAt = (Get-Date).AddSeconds($response.expires_in)
//                 CreatedAt = Get-Date
//             }
//             $this.IsAuthenticated = $true
//             
//             if ($this.Config["SessionSaveEnabled"]) {
//                 $this.SaveSession()
//             }
//             
//             return @{ Success = $true; User = $this.CurrentUser }
//         }
//         catch {
//             return @{ Success = $false; Error = $_.Exception.Message }
//         }
//     }
//     
//     [PSCustomObject] SignUp([string]$email, [string]$password) {
//         try {
//             $url = "$($this.Config['SupabaseUrl'])/auth/v1/signup"
//             $body = @{
//                 email = $email
//                 password = $password
//             } | ConvertTo-Json
//             
//             $headers = @{
//                 "apikey" = $this.Config["SupabaseAnonKey"]
//                 "Content-Type" = "application/json"
//             }
//             
//             $response = Invoke-RestMethod -Uri $url -Method Post -Headers $headers -Body $body -ErrorAction Stop
//             return @{ Success = $true; Message = $response.message }
//         }
//         catch {
//             return @{ Success = $false; Error = $_.Exception.Message }
//         }
//     }
//     
//     [PSCustomObject] RefreshSession() {
//         if (-not $this.CurrentUser -or -not $this.CurrentUser.RefreshToken) {
//             return @{ Success = $false; Error = "No refresh token available" }
//         }
//         
//         try {
//             $url = "$($this.Config['SupabaseUrl'])/auth/v1/token?grant_type=refresh_token"
//             $body = @{
//                 refresh_token = $this.CurrentUser.RefreshToken
//             } | ConvertTo-Json
//             
//             $headers = @{
//                 "apikey" = $this.Config["SupabaseAnonKey"]
//                 "Content-Type" = "application/json"
//             }
//             
//             $response = Invoke-RestMethod -Uri $url -Method Post -Headers $headers -Body $body -ErrorAction Stop
//             
//             $this.CurrentUser.AccessToken = $response.access_token
//             $this.CurrentUser.RefreshToken = $response.refresh_token
//             $this.CurrentUser.ExpiresAt = (Get-Date).AddSeconds($response.expires_in)
//             
//             if ($this.Config["SessionSaveEnabled"]) {
//                 $this.SaveSession()
//             }
//             
//             return @{ Success = $true; User = $this.CurrentUser }
//         }
//         catch {
//             $this.IsAuthenticated = $false
//             return @{ Success = $false; Error = $_.Exception.Message }
//         }
//     }
//     
//     [void] SignOut() {
//         $this.CurrentUser = $null
//         $this.IsAuthenticated = $false
//         
//         $sessionPath = $this.Config["SessionFilePath"]
//         if (Test-Path $sessionPath) {
//             Remove-Item $sessionPath -Force -ErrorAction SilentlyContinue
//         }
//     }
//     
//     [bool] LoadSession() {
//         $sessionPath = $this.Config["SessionFilePath"]
//         if (-not (Test-Path $sessionPath)) {
//             return $false
//         }
//         
//         try {
//             $encryptedData = [System.IO.File]::ReadAllBytes($sessionPath)
//             $decryptedData = [ProtectedData]::Unprotect($encryptedData, $null, [DataProtectionScope]::CurrentUser)
//             $json = [Encoding]::UTF8.GetString($decryptedData)
//             $sessionData = $json | ConvertFrom-Json
//             
//             $this.CurrentUser = [GooseUser]@{
//                 Id = $sessionData.Id
//                 Email = $sessionData.Email
//                 AccessToken = $sessionData.AccessToken
//                 RefreshToken = $sessionData.RefreshToken
//                 ExpiresAt = [datetime]::Parse($sessionData.ExpiresAt)
//                 CreatedAt = [datetime]::Parse($sessionData.CreatedAt)
//             }
//             
//             if ($this.CurrentUser.IsExpired()) {
//                 if ($this.Config["AutoRefresh"]) {
//                     $result = $this.RefreshSession()
//                     if ($result.Success) {
//                         $this.IsAuthenticated = $true
//                         return $true
//                     }
//                 }
//                 $this.SignOut()
//                 return $false
//             }
//             
//             $this.IsAuthenticated = $this.CurrentUser.IsValid()
//             return $this.IsAuthenticated
//         }
//         catch {
//             return $false
//         }
//     }
//     
//     [void] SaveSession() {
//         if (-not $this.CurrentUser -or -not $this.CurrentUser.IsValid()) {
//             return
//         }
//         
//         $sessionPath = $this.Config["SessionFilePath"]
//         $directory = Split-Path $sessionPath -Parent
//         if (-not (Test-Path $directory)) {
//             New-Item -ItemType Directory -Path $directory -Force | Out-Null
//         }
//         
//         $sessionData = @{
//             Id = $this.CurrentUser.Id
//             Email = $this.CurrentUser.Email
//             AccessToken = $this.CurrentUser.AccessToken
//             RefreshToken = $this.CurrentUser.RefreshToken
//             ExpiresAt = $this.CurrentUser.ExpiresAt.ToString("o")
//             CreatedAt = $this.CurrentUser.CreatedAt.ToString("o")
//         }
//         
//         $json = $sessionData | ConvertTo-Json
//         $data = [Encoding]::UTF8.GetBytes($json)
//         $encryptedData = [ProtectedData]::Protect($data, $null, [DataProtectionScope]::CurrentUser)
//         [System.IO.File]::WriteAllBytes($sessionPath, $encryptedData)
//     }
//     
//     [PSCustomObject] GetUser() {
//         if (-not $this.CurrentUser -or -not $this.CurrentUser.IsValid()) {
//             return @{ Success = $false; Error = "Not authenticated" }
//         }
//         
//         try {
//             $url = "$($this.Config['SupabaseUrl'])/auth/v1/user"
//             $response = Invoke-RestMethod -Uri $url -Method Get -Headers $this.GetHeaders() -ErrorAction Stop
//             return @{ Success = $true; User = $response }
//         }
//         catch {
//             return @{ Success = $false; Error = $_.Exception.Message }
//         }
//     }
// }
//
// function Connect-GooseUser {
//     param(
//         [Parameter(Mandatory=$true)]
//         [string]$Email,
//         [Parameter(Mandatory=$true)]
//         [string]$Password,
//         [string]$ConfigFile = "config.ini"
//     )
//     
//     $auth = [GooseAuth]::new($ConfigFile)
//     return $auth.SignIn($Email, $Password)
// }
//
// function Register-GooseUser {
//     param(
//         [Parameter(Mandatory=$true)]
//         [string]$Email,
//         [Parameter(Mandatory=$true)]
//         [string]$Password,
//         [string]$ConfigFile = "config.ini"
//     )
//     
//     $auth = [GooseAuth]::new($ConfigFile)
//     return $auth.SignUp($Email, $Password)
// }
//
// function Get-GooseUser {
//     param(
//         [string]$ConfigFile = "config.ini"
//     )
//     
//     $auth = [GooseAuth]::new($ConfigFile)
//     $auth.LoadSession() | Out-Null
//     return $auth.GetUser()
// }
//
// function Disconnect-GooseUser {
//     param(
//         [string]$ConfigFile = "config.ini"
//     )
//     
//     $auth = [GooseAuth]::new($ConfigFile)
//     $auth.LoadSession() | Out-Null
//     $auth.SignOut()
//     return @{ Success = $true }
// }
//
// function Test-GooseSession {
//     param(
//         [string]$ConfigFile = "config.ini"
//     )
//     
//     $auth = [GooseAuth]::new($ConfigFile)
//     return $auth.LoadSession()
// }
//
