# Introduction PSRule for Azure

Validate infrastructure as code (IaC) and objects using PowerShell rules.

About PSRule and PSRule for Azure in relation to CAF.

## What and how to install

```PowerShell
Install-Module -Name PSRule
Install-Module -Name PSRule.Rules.Azure
Install-Module -Name PSRule.Rules.CAF
```

## How to run

Go to infrastructure folder and run following command:

```PowerShell
Assert-PSRule -Path .\tests\psrule\.ps-rule\ -InputPath .\ -Option .\tests\psrule\ps-rule.yaml
```

## Complete command line

Use our own test code:

```PowerShell
 .\psrule.ps1
```

## Using it with Azure DevOps Pipeline

```yaml
- task: PowerShell@2
displayName: PSRule
inputs:
    targetType: filePath
    filePath: "$(System.DefaultWorkingDirectory)/${{ variables.projectFolder }}/psrule.ps1"
    errorActionPreference: stop
    failOnStderr: true
continueOnError: false

- task: PublishTestResults@2
displayName: Publish Test Results
inputs:
    testResultsFormat: "NUnit"
    testResultsFiles: "**/TEST-*.xml"
```

### Test Results

The test results of the PSRule are published in the pipeline for documentation and code quality.

## Environment configuration

By using environment, it is possible to have different ps-rule configuration for different environment.

## Security by Design and ISO27001

By following PSRule for Azure you validate a lot of controls that matters for ISO27001 compliance. Which mean it is easier to document ISO27001 compliance for customer if required.

Reference:

- [PSRule](https://microsoft.github.io/PSRule/stable//)
- [PSRule for Azure](https://azure.github.io/PSRule.Rules.Azure/)
- [PSRule projects](https://microsoft.github.io/PSRule/v2/related-projects/)
- [PSRule CAF](https://github.com/microsoft/PSRule.Rules.CAF)
- [PSRule features](https://azure.github.io/PSRule.Rules.Azure/features/)
- [PSRule Pillar](https://azure.github.io/PSRule.Rules.Azure/en/rules/module/)