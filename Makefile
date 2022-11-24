
test: kill
	find tests/ -name "*.sh" -exec "chmod" "+x" "{}" ";"
	run-parts --verbose --regex "test-.*" ./tests
	@echo "ok"

kill:
	@echo "* Clean up old container..."
	./jh-github-dc stop 2>/dev/null >/dev/null || true
	@echo "* ...done"
