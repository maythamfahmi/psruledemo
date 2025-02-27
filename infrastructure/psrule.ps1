Install-Module -Name PSRule
Install-Module -Name PSRule.Rules.Azure
Install-Module -Name PSRule.Rules.CAF

Assert-PSRule -Path .\tests\psrule\.ps-rule\ -InputPath .\ -Option .\tests\psrule\ps-rule.yaml
