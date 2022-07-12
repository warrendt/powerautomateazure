Connect-AzAccount -ApplicationId $$$$$ -Tenant $$$$$ -CertificateThumbprint $$$$$$
Select-AzSubscription $$$$$

$ResourceGroup = "%ResourceGroup%"
$location = "%location%"
$os = "%OS%"
$sku = "%SKU%"
$username = "%username%"
$password = "%password%"
$VMName = "%VMName%"
$VMLocalAdminUser = $username
$VMLocalAdminSecurePassword = ConvertTo-SecureString $password -AsPlainText -Force
$Credential = New-Object System.Management.Automation.PSCredential ($VMLocalAdminUser, $VMLocalAdminSecurePassword);

New-AzResourceGroup -Name $ResourceGroup -Location $location

$vmParams = @{
  ResourceGroupName = $ResourceGroup
  Name = $VMName
  Location = $location
  ImageName = $os
  Size = $sku
  Credential = $Credential
}

$newVM1 = New-AzVM @vmParams

$newVM1
