tests-checkout
testCheckoutCommitInstallsPackageInImage

	self repository branch commit checkout.
	self assertPackageExists: self packageName1.