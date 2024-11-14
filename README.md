# PoShSplitPDF
PowerShell module for splitting PDF files using iText 5

### Getting started
Download "Split-PDF.psm1" and the "Resources" folder. Place them in a convinient location.

To use the function in a script or PowerShell session, import the module:
```PowerShell
Import-Module 'C:\Downloads\Split-PDF.psm1'
```

### Example
```PowerShell
Split-PDF -Source 'C:\Temp\Original.pdf' -Output 'C:\Temp\NewFile.pdf' -StartPg 4 -EndPg 8
```
