[alias]
	hash = "! git log --pretty=\"%H\" -n ${1:-1} | tail -n 1 #" ; Hash of n-th commit.
	logog = log --oneline --graph
	rebasein = "! git rebase --interactive $(git hash $((${1:-0}+1))) \"${@:2}\" #" ; Interactive rebase of last n commits.
	commitan = commit --amend --no-edit
