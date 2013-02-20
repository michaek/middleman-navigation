
1.0.2 / 2013-01-28 
==================

  * Added support for including root node in navigation.

1.0.1 / 2013-01-25 
==================

  * Added matcher to support active page detection for directory indexes.
  * Refactored frontmatter defaults, monkey patching defaults into the frontmatter_manager until we're allowed to specify them via middleman.
  * Added support for app http_prefix configuration.
  * Refactored simple-navigation patch to duplicate less code.
  * Prevented simple-navigation from remembering @selected on navigation items.
  * Resolved current_path issue, refactored to not run on every request.
  * Refactoring for middleman 3 and simple-navigation.

1.0.0 / 2013-01-18 
==================

  * Removed things from .gitignore that should be in global config. See: https://help.github.com/articles/ignoring-files
