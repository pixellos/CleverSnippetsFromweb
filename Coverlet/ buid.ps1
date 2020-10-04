workflow unitTestsWorkflow {
	foreach -parallel ($testProjectName in Get-Childitem -Filter *.UnitTests) {
		dotnet test `
		%system.teamcity.build.checkoutDir%/$testProjectName/$testProjectName.csproj `
		--no-build `
		-c Release `
		-l "console;verbosity=normal" `
		-a %teamcity.build.checkoutDir%\packages\xunit.runner.visualstudio.2.4.1\build\_common `
		/p:CollectCoverage=true `
		'/p:Exclude=\"[*.UnitTests]*,[FooBar.BusinessInterfaces*]*,[FooBar.Database*]*\"' `
		/p:CoverletOutputFormat=opencover `
		/p:CoverletOutput=..\coverlet\$testProjectName.coverage.xml
	}
}
unitTestsWorkflow

%teamcity.build.checkoutDir%\packages\ReportGenerator.4.4.0\tools\net47\ReportGenerator.exe -targetdir:%teamcity.build.checkoutDir%\coverlet -reports:%teamcity.build.checkoutDir%\coverlet\*.xml -reporttypes:TeamCitySummary
