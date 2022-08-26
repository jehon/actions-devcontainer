
dump:
	echo "Horray, we are in the devcontainer for a dump..."

args:
	echo "Do we have args?"
	env | grep ARG_O

test:
	find tests/ -name "*.sh" -exec "chmod" "+x" "{}" ";"
	run-parts --verbose --regex "test-.*" ./tests
