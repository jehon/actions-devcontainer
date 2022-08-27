
dump:
	echo "Horray, we are in the devcontainer for a dump..."

test:
	find tests/ -name "*.sh" -exec "chmod" "+x" "{}" ";"
	run-parts --verbose --regex "test-.*" ./tests
	echo "ok"

