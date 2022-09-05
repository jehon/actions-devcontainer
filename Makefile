
dump:
	echo "Horray, we are in the devcontainer for a dump..."

kill:
	@echo "* Clean up old container..."
	./jh-github-dc stop 2>/dev/null >/dev/null || true
	@echo "* ...done"

test: kill
	find tests/ -name "*.sh" -exec "chmod" "+x" "{}" ";"
	run-parts --verbose --regex "test-.*" ./tests
	@echo "ok"


#
#
# Test for the test.yml workflow
#
#

dc-summary:
	echo "this is my summary" >> $(GITHUB_STEP_SUMMARY)

dc-hello:
	echo "Do we have CUSTOM_ENV_0?"
	env | grep CUSTOM_ENV_0
	echo "Hello $(CUSTOM_ENV_0)"
