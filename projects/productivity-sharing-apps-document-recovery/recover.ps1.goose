// Goose-Port-Spiegel von: projects/productivity-sharing-apps-document-recovery/recover.ps1
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/productivity-sharing-apps-document-recovery/recover.ps1");
}

// ---- Original-Code (projects/productivity-sharing-apps-document-recovery/recover.ps1), unveraendert, als Inline-Doku ----
// param(
//     [Parameter(Mandatory = $true, Position = 0)]
//     [string]$InputFile
// )
//
// Add-Type -AssemblyName System.IO.Compression
// $ErrorActionPreference = "Stop"
//
// $inputPath = Resolve-Path $InputFile -ErrorAction Stop
// $dir = [System.IO.Path]::GetDirectoryName($inputPath)
// $baseName = [System.IO.Path]::GetFileNameWithoutExtension($inputPath)
// $extension = [System.IO.Path]::GetExtension($inputPath)
//
// Write-Host "Input: $inputPath"
// $buffer = [System.IO.File]::ReadAllBytes($inputPath)
// $size = $buffer.Length
// Write-Host "Size: $size bytes ($([Math]::Round($size / 1MB, 2)) MB)"
//
// # ---------------------------------------------------------------
// # 1. ZIP RECOVERY: scan for PK\x03\x04, rebuild the archive
// # ---------------------------------------------------------------
// Write-Host "`n=== ZIP Recovery ==="
//
// $lfhPositions = @()
// for ($i = 0; $i -lt $size - 3; $i++) {
//     if ($buffer[$i] -eq 0x50 -and $buffer[$i+1] -eq 0x4b -and $buffer[$i+2] -eq 0x03 -and $buffer[$i+3] -eq 0x04) {
//         $lfhPositions += $i
//     }
// }
// Write-Host "Found $($lfhPositions.Count) PK\x03\x04 signatures"
//
// $entryInfo = @()
// for ($i = 0; $i -lt $lfhPositions.Count; $i++) {
//     $start = $lfhPositions[$i]
//     $nextStart = if ($i + 1 -lt $lfhPositions.Count) { $lfhPositions[$i + 1] } else { $size }
//
//     $chunkLen = $nextStart - $start
//     if ($chunkLen -gt 200MB) { $chunkLen = 200MB }
//     if ($chunkLen -gt 0) {
//         $raw = [byte[]]($buffer[$start..($start + $chunkLen - 1)])
//     } else {
//         continue
//     }
//
//     # Scan for a known DOCX entry name within the first ~250 bytes after header
//     $filename = $null
//     $dataStart = 30
//     $maxScan = [Math]::Min(250, $raw.Length)
//     for ($scan = 30; $scan -lt $maxScan; $scan++) {
//         $c = $raw[$scan]
//         if ($c -eq 0x5B -or $c -eq 0x2F -or $c -eq 0x5F -or ($c -ge 0x61 -and $c -le 0x7a)) {
//             $nameEnd = $scan
//             while ($nameEnd -lt $maxScan -and $raw[$nameEnd] -ne 0 -and $raw[$nameEnd] -ge 0x20 -and $raw[$nameEnd] -le 0x7e) {
//                 $nameEnd++
//             }
//             $nameLen = $nameEnd - $scan
//             if ($nameLen -gt 4 -and $nameLen -lt 150) {
//                 $candidate = [System.Text.Encoding]::UTF8.GetString([byte[]]($raw[$scan..($nameEnd - 1)]))
//                 $isDocxEntry = $candidate -eq "[Content_Types].xml" -or $candidate -eq "_rels/.rels" -or $candidate -like "word/*" -or $candidate -like "docProps/*"
//                 $isPlausible = $candidate -match "\."
//                 if ($isDocxEntry -or ($isPlausible -and -not $filename)) {
//                     if (-not $filename -or $isDocxEntry) {
//                         $filename = $candidate
//                     }
//                     # Skip extra field(s) after the filename
//                     $aft = $scan + $nameLen
//                     while ($aft + 4 -lt $raw.Length) {
//                         $eid = [System.BitConverter]::ToUInt16($raw, $aft)
//                         $esiz = [System.BitConverter]::ToUInt16($raw, $aft + 2)
//                         $known = @(0x0001, 0x0009, 0x000a, 0x000d, 0x0014, 0x0015, 0x0017, 0x0018, 0x0019, 0x0020, 0x4453, 0x5455, 0x5855, 0x6375, 0x6542, 0x7075, 0x756e, 0x7855, 0x7875, 0x7a7a)
//                         if ($eid -in $known -and $esiz -gt 0 -and $esiz -lt 200) {
//                             $aft += 4 + $esiz
//                         } else {
//                             break
//                         }
//                     }
//                     $dataStart = $aft
//                     if ($isDocxEntry) { break }
//                 }
//             }
//         }
//     }
//
//     if (-not $filename) {
//         $filename = "entry_${i}.bin"
//         $dataStart = 30
//     }
//
//     $compressedData = if ($dataStart -lt $raw.Length) { [byte[]]($raw[$dataStart..($raw.Length - 1)]) } else { @() }
//
//     $entryInfo += [PSCustomObject]@{
//         Index = $i
//         Start = $start
//         NextStart = $nextStart
//         Filename = $filename
//         DataStart = $dataStart
//         DataLen = $compressedData.Length
//         ChunkLen = $chunkLen
//         CompressedData = $compressedData
//     }
//
//     Write-Host "  Entry $i @ 0x$(('{0:X}' -f $start)): '$filename' data=$($compressedData.Length) bytes"
// }
//
// Write-Host "`nRebuilding ZIP archive ..."
//
// function New-LocalHeader {
//     param($Name, $Method = 8)
//     $nb = [System.Text.Encoding]::UTF8.GetBytes($Name)
//     $ms = New-Object System.IO.MemoryStream
//     $w = New-Object System.IO.BinaryWriter($ms)
//     $w.Write([byte[]]@(0x50, 0x4b, 0x03, 0x04, 0x14, 0x00, 0x00, 0x00, $Method, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00))
//     $w.Write([byte]$($nb.Length -band 0xFF))
//     $w.Write([byte](($nb.Length -shr 8) -band 0xFF))
//     $w.Write([byte[]]@(0x00, 0x00))
//     $w.Write($nb)
//     $w.Flush()
//     $r = $ms.ToArray()
//     $w.Close(); $ms.Close()
//     return $r
// }
//
// function New-CentralDirEntry {
//     param($Name, $Method, $CompSize, $UncompSize, $LocalOffset)
//     $nb = [System.Text.Encoding]::UTF8.GetBytes($Name)
//     $ms = New-Object System.IO.MemoryStream
//     $w = New-Object System.IO.BinaryWriter($ms)
//     $w.Write([byte[]]@(0x50, 0x4b, 0x01, 0x02, 0x3f, 0x00, 0x14, 0x00, 0x00, 0x00, $Method, 0x00, 0x00, 0x00, 0x00, 0x00))
//     $w.Write([byte[]]@($CompSize -band 0xFF, ($CompSize -shr 8) -band 0xFF, ($CompSize -shr 16) -band 0xFF, ($CompSize -shr 24) -band 0xFF))
//     $w.Write([byte[]]@($UncompSize -band 0xFF, ($UncompSize -shr 8) -band 0xFF, ($UncompSize -shr 16) -band 0xFF, ($UncompSize -shr 24) -band 0xFF))
//     $w.Write([byte]($nb.Length -band 0xFF))
//     $w.Write([byte](($nb.Length -shr 8) -band 0xFF))
//     $w.Write([byte[]]@(0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00))
//     $w.Write([byte[]]@($LocalOffset -band 0xFF, ($LocalOffset -shr 8) -band 0xFF, ($LocalOffset -shr 16) -band 0xFF, ($LocalOffset -shr 24) -band 0xFF))
//     $w.Write($nb)
//     $w.Flush()
//     $r = $ms.ToArray()
//     $w.Close(); $ms.Close()
//     return $r
// }
//
// function New-EOCD {
//     param($NumEntries, $CdSize, $CdOffset)
//     $ms = New-Object System.IO.MemoryStream
//     $w = New-Object System.IO.BinaryWriter($ms)
//     $w.Write([byte[]]@(0x50, 0x4b, 0x05, 0x06, 0x00, 0x00, 0x00, 0x00))
//     $w.Write([byte]($NumEntries -band 0xFF)); $w.Write([byte](($NumEntries -shr 8) -band 0xFF))
//     $w.Write([byte]($NumEntries -band 0xFF)); $w.Write([byte](($NumEntries -shr 8) -band 0xFF))
//     $w.Write([byte[]]@($CdSize -band 0xFF, ($CdSize -shr 8) -band 0xFF, ($CdSize -shr 16) -band 0xFF, ($CdSize -shr 24) -band 0xFF))
//     $w.Write([byte[]]@($CdOffset -band 0xFF, ($CdOffset -shr 8) -band 0xFF, ($CdOffset -shr 16) -band 0xFF, ($CdOffset -shr 24) -band 0xFF))
//     $w.Write([byte[]]@(0x00, 0x00))
//     $w.Flush()
//     $r = $ms.ToArray()
//     $w.Close(); $ms.Close()
//     return $r
// }
//
// $zipOut = Join-Path $dir "${baseName}-recovered${extension}"
// $outStream = [System.IO.File]::Create($zipOut)
// $entriesData = @()
// $currentOffset = 0
//
// foreach ($entry in $entryInfo) {
//     $hdr = New-LocalHeader $entry.Filename
//     $outStream.Write($hdr, 0, $hdr.Length)
//     $localOff = $currentOffset
//     $outStream.Write($entry.CompressedData, 0, $entry.CompressedData.Length)
//     $currentOffset += $hdr.Length + $entry.CompressedData.Length
//     $entriesData += [PSCustomObject]@{ Name = $entry.Filename; LocalOffset = $localOff; CompSize = $entry.CompressedData.Length }
// }
//
// $cdStart = $currentOffset
// foreach ($ed in $entriesData) {
//     $cd = New-CentralDirEntry $ed.Name 8 $ed.CompSize $ed.CompSize $ed.LocalOffset
//     $outStream.Write($cd, 0, $cd.Length)
//     $currentOffset += $cd.Length
// }
// $eocd = New-EOCD $entriesData.Count ($currentOffset - $cdStart) $cdStart
// $outStream.Write($eocd, 0, $eocd.Length)
// $outStream.Close()
//
// Write-Host "Written: $zipOut ($((Get-Item $zipOut).Length) bytes)"
//
// # ---------------------------------------------------------------
// # 2. CHAT EXTRACTION: scan for "role"/"parts" conversation JSON
// # ---------------------------------------------------------------
// Write-Host "`n=== Chat Extraction ==="
//
// $text = [System.Text.Encoding]::UTF8.GetString($buffer)
// $messages = @()
// $idx = 0
// $msgCount = 0
//
// while ($idx -lt $text.Length) {
//     $rolePos = $text.IndexOf('"role"', $idx)
//     if ($rolePos -lt 0) { break }
//
//     $valStart = $text.IndexOf('"', $rolePos + 6)
//     if ($valStart -lt 0) { break }
//     $valEnd = $text.IndexOf('"', $valStart + 1)
//     if ($valEnd -lt 0) { break }
//
//     $role = $text.Substring($valStart + 1, $valEnd - $valStart - 1)
//     if ($role -ne "user" -and $role -ne "assistant") { $idx = $valEnd + 1; continue }
//
//     $partsPos = $text.IndexOf('"parts"', $valEnd)
//     if ($partsPos -lt 0 -or $partsPos -gt $valEnd + 2000) { $idx = $valEnd + 1; continue }
//
//     $arrStart = $text.IndexOf('[', $partsPos + 7)
//     if ($arrStart -lt 0 -or $arrStart -gt $partsPos + 50) { $idx = $valEnd + 1; continue }
//
//     $scanPos = $arrStart + 1
//     $arrayDepth = 1
//     $inString = $false
//     $inEscape = $false
//     $strStart = -1
//     $contentText = ""
//
//     while ($scanPos -lt $text.Length -and $arrayDepth -gt 0) {
//         $c = $text[$scanPos]
//         if ($inEscape) { $inEscape = $false; $scanPos++; continue }
//         if ($c -eq '\') { $inEscape = $true; $scanPos++; continue }
//         if ($c -eq '"') {
//             if ($inString) {
//                 $contentText += $text.Substring($strStart + 1, $scanPos - $strStart - 1) + "`n"
//                 $inString = $false
//             } else {
//                 $strStart = $scanPos
//                 $inString = $true
//             }
//             $scanPos++; continue
//         }
//         if (-not $inString) {
//             if ($c -eq '[' -or $c -eq '{') { $arrayDepth++ }
//             elseif ($c -eq ']' -or $c -eq '}') { $arrayDepth-- }
//         }
//         $scanPos++
//     }
//
//     $contentText = $contentText.Trim()
//     if ($contentText.Length -gt 0) {
//         $msgCount++
//         $contentText = $contentText.Replace('\n', "`n").Replace('\r', "`r").Replace('\t', "`t").Replace('\"', '"').Replace('\\', '\')
//         $messages += [PSCustomObject]@{ Role = $role; Text = $contentText.Trim() }
//         if ($msgCount -le 5 -or $msgCount % 5000 -eq 0) {
//             Write-Host "  [$msgCount] $role: $($contentText.Substring(0, [Math]::Min(100, $contentText.Length)))"
//         }
//     }
//     $idx = $scanPos + 1
// }
//
// Write-Host "Messages found: $msgCount"
//
// if ($msgCount -gt 0) {
//     $userCount = ($messages | Where-Object { $_.Role -eq "user" }).Count
//     $assistantCount = ($messages | Where-Object { $_.Role -eq "assistant" }).Count
//     Write-Host "User: $userCount, Assistant: $assistantCount"
//
//     $chatOut = Join-Path $dir "${baseName}-chat${extension}"
//     Write-Host "Building chat document ..."
//
//     $sb = New-Object System.Text.StringBuilder
//     [void]$sb.AppendLine('<?xml version="1.0" encoding="UTF-8" standalone="yes"?>')
//     [void]$sb.AppendLine('<w:document xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships">')
//     [void]$sb.AppendLine('<w:body>')
//
//     $msgNum = 0
//     foreach ($msg in $messages) {
//         $msgNum++
//         $color = if ($msg.Role -eq "user") { "2E75B6" } elseif ($msg.Role -eq "assistant") { "2E7D32" } else { "808080" }
//         $roleLabel = $msg.Role.Substring(0,1).ToUpper() + $msg.Role.Substring(1)
//         [void]$sb.AppendLine('<w:p><w:pPr><w:pStyle w:val="Heading2"/></w:pPr><w:r><w:rPr><w:b/><w:color w:val="' + $color + '"/><w:sz w:val="24"/></w:rPr><w:t>' + [System.Net.WebUtility]::HtmlEncode($roleLabel) + '</w:t></w:r></w:p>')
//         foreach ($para in ($msg.Text -split "`n")) {
//             $t = $para.Trim()
//             if ($t.Length -gt 0) {
//                 [void]$sb.AppendLine('<w:p><w:r><w:rPr><w:color w:val="' + $color + '"/><w:sz w:val="22"/></w:rPr><w:t>' + [System.Net.WebUtility]::HtmlEncode($t) + '</w:t></w:r></w:p>')
//             }
//         }
//         [void]$sb.AppendLine('<w:p><w:r><w:rPr><w:color w:val="CCCCCC"/></w:rPr><w:t>---</w:t></w:r></w:p>')
//         if ($msgNum % 2000 -eq 0) { Write-Host "  Processed $msgNum/$msgCount messages ..." }
//     }
//
//     [void]$sb.AppendLine('</w:body></w:document>')
//     $documentXml = $sb.ToString()
//     Write-Host "Document XML: $($documentXml.Length) chars"
//
//     $zipStream = [System.IO.File]::Create($chatOut)
//     $zip = [System.IO.Compression.ZipArchive]::new($zipStream, [System.IO.Compression.ZipArchiveMode]::Create)
//
//     function Add-ZipEntry($z, $p, $c) {
//         $e = $z.CreateEntry($p)
//         $b = [System.Text.Encoding]::UTF8.GetBytes($c)
//         $s = $e.Open()
//         $s.Write($b, 0, $b.Length)
//         $s.Close()
//     }
//
//     Add-ZipEntry $zip "[Content_Types].xml" @"
// <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
// <Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types">
// <Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/>
// <Default Extension="xml" ContentType="application/xml"/>
// <Override PartName="/word/document.xml" ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml"/>
// </Types>
// "@
//
//     Add-ZipEntry $zip "_rels/.rels" @"
// <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
// <Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
// <Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument" Target="word/document.xml"/>
// </Relationships>
// "@
//
//     Add-ZipEntry $zip "word/document.xml" $documentXml
//
//     Add-ZipEntry $zip "word/_rels/document.xml.rels" @"
// <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
// <Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
// <Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/styles" Target="styles.xml"/>
// </Relationships>
// "@
//
//     Add-ZipEntry $zip "word/styles.xml" @"
// <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
// <w:styles xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">
// <w:style w:type="paragraph" w:styleId="Heading1"><w:name w:val="heading 1"/><w:pPr><w:spacing w:before="240" w:after="120"/></w:pPr><w:rPr><w:b/><w:sz w:val="32"/><w:color w:val="1F3864"/></w:rPr></w:style>
// <w:style w:type="paragraph" w:styleId="Heading2"><w:name w:val="heading 2"/><w:pPr><w:spacing w:before="200" w:after="100"/></w:pPr><w:rPr><w:b/><w:sz w:val="28"/><w:color w:val="2E75B6"/></w:rPr></w:style>
// <w:style w:type="paragraph" w:styleId="Heading3"><w:name w:val="heading 3"/><w:pPr><w:spacing w:before="160" w:after="80"/></w:pPr><w:rPr><w:b/><w:sz w:val="24"/><w:color w:val="404040"/></w:rPr></w:style>
// <w:style w:type="paragraph" w:styleId="Normal"><w:name w:val="Normal"/><w:pPr><w:spacing w:after="60" w:line="276"/></w:pPr><w:rPr><w:sz w:val="22"/></w:rPr></w:style>
// </w:styles>
// "@
//
//     $zip.Dispose()
//     $zipStream.Close()
//     Write-Host "Written: $chatOut ($((Get-Item $chatOut).Length) bytes)"
// }
//
// Write-Host "`nDone."
//
