
dump:
	echo "Horray, we are in the devcontainer for a dump..."

kill:
	@echo "* Clean up old container..."
	./jh-github-dc stop
	@echo "* ...done"

test: kill
	find tests/ -name "*.sh" -exec "chmod" "+x" "{}" ";"
	run-parts --verbose --regex "test-.*" ./tests
	@echo "ok"
