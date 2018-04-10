tests-checkout
testCheckoutBranchInstallsCodeInImage

	| message |
	message := 'Added IceGeneratedClassForTesting'.

	"This is a Ring working copy"
	repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: packageName1 asSymbol.
	repository commitWithMessage: message.

	message := 'Added IceAnotherGeneratedClassForTesting'.
	
	"This is a Ring working copy"
	repository workingCopy
		createClass: 'IceAnotherGeneratedClassForTesting' 
		inPackage: packageName2 asSymbol.
	repository commitWithMessage: message.

	repository unload.
	self denyPackageExists: packageName1.
	self denyPackageExists: packageName2.
	
	repository branch checkoutAllPackages.
	self assertClassExists: #IceGeneratedClassForTesting.
	self assertClassExists: #IceAnotherGeneratedClassForTesting.
	self assertPackageExists: packageName1.
	self assertPackageExists: packageName2