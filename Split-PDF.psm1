######################################
## Assembly & Config
######################################
## Load needed assemblies for iText PDF
[System.Reflection.Assembly]::LoadFrom("$PSScriptRoot\Resources\BouncyCastle.Crypto.dll") | Out-Null
[System.Reflection.Assembly]::LoadFrom("$PSScriptRoot\Resources\Common.Logging.Core.dll") | Out-Null
[System.Reflection.Assembly]::LoadFrom("$PSScriptRoot\Resources\Common.Logging.dll") | Out-Null
[System.Reflection.Assembly]::LoadFrom("$PSScriptRoot\Resources\itext.io.dll") | Out-Null
[System.Reflection.Assembly]::LoadFrom("$PSScriptRoot\Resources\itext.kernel.dll") | Out-Null

####################################
## Functions
####################################
Function Split-PDF {
    <#
        .SYNOPSIS
            Create a new PDF file from pages in Source PDF using iText assemblies.

        .EXAMPLE
            Split-PDF -Source 'C:\Temp\Source.pdf' -Output 'C:\Temp\NewFile.pdf' -StartPg 4 -EndPg 8
    #>
    [CmdletBinding()]
    Param (
        [String]$Source, 
        [String]$Output,
        [Int]$StartPg,
        [Int]$EndPg        
    )

    $Output = $Output.Replace('"','')
    $SourcePDF = [iText.Kernel.Pdf.PdfDocument]::new([iText.Kernel.Pdf.PdfReader]::new($Source))
    $NewPDF = [iText.Kernel.Pdf.PdfDocument]::new([iText.Kernel.Pdf.PdfWriter]::new($Output))

    $SourcePDF.CopyPagesTo($StartPg, $EndPg, $NewPDF, 1) | Out-Null
    
    $NewPDF.Close()
    $SourcePDF.Close()
}
