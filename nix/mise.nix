{ misePackage, ... }:

{
	programs.mise = {
		enable = true;
		package = misePackage;
		enableZshIntegration = true;
	};
}
