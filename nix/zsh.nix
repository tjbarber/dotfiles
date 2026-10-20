{ 
	programs.zsh = {
		enable = true;

		oh-my-zsh = {
			enable = true;
			theme = "robbyrussell";
			plugins = [ "git" ];
		};

		shellAliases = {
			gs = "git status";
			gp = "git push";
			gl = "git log";
			gc = "git commit -m";
			ga = "git add";
			gd = "git diff";

			debug = "gdb --batch --ex run --ex bt --ex q --args";
			wip = "ga . && gc 'wip'";
			sail = "sh $([ -f sail ] && echo sail || echo vendor/bin/sail)";

			poweroff = "sudo systemctl poweroff";
			reboot = "sudo systemctl reboot";
			sl = "ls";
		};

		initContent = ''
			path+=(
				"$HOME/.cargo/bin"
				"$HOME/.local/bin"
				"$HOME/.config/composer/vendor/bin"
				"$HOME/go/bin"
				"$HOME/.luarocks/bin"
			)

			bindkey -s '^F' "tmux-sessionizer\n"
		'';
	};

	home.file.".local/bin/tmux-sessionizer" = {
		source = ../shared/scripts/tmux-sessionizer;
		executable = true;
	};

	home.sessionPath = [ 
		"$HOME/bin" 
		"/usr/local/bin"
	];

	home.sessionVariables = {
		EDITOR = "nvim";
		VISUAL = "nvim";
	};
}
