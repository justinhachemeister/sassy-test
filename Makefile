docs:
	echo && echo "Building JavaScript documentation with jsdoc…" && echo
	rm -r ./docs/fonts ./docs/scripts ./docs/styles ./docs/*.html
	npx jsdoc --configure ./docs/api-jsdoc-conf.json
	echo
	# Clean up the JS docs.
	for HTMLDOC in ./docs/**.html; do cat $$HTMLDOC | sed 's/<title>JSDoc: /<title>sassy-test JavaScript API: /' | sed -E 's/(Documentation generated by .+<\/a>).+/\1/' > $$HTMLDOC.tmp; mv $$HTMLDOC.tmp $$HTMLDOC; done

.PHONY: docs
