New-AzResourceGroup -Name rg-ExampleGroup -Location "Central US" 

New-AzResourceGroupDeployment `                                                                                                
  -DeploymentName ExampleDeployment `
  -ResourceGroupName rg-ExampleGroup `
  -TemplateFile main.bicep 