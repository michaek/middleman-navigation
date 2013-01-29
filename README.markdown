This gem adds simple helpers to [Middleman](http://middlemanapp.com) static site generator 
to add navigation menus and breadcrumbs.

This version of the gem requires Middleman 3, and renders using [Simple Navigation](https://github.com/andi/simple-navigation) and its helpers. 

*The implementation and options are significantly different from earlier versions!* If you'd like the old approach, see the tag for v0.2.

# Installation

1. add the gem in your Gemfile:

      gem "middleman-navigation"

2. run bundler

      bundle install

3. include it in your config.rb file

      activate :navigation

# Usage

The gem adds a menu helper to Middleman.

## Menu

Automatic generate menu reading pages at project root folder.

Example:

    = render_navigation


### Metadata

The behaviour of the menu can be changed by adding options to your pages' frontmatter.

Example:

    ---
    navigation:
      weight: 80
      title:  Custom Title
      hidden: false
    ---

    Here you have the actual page source


*hidden*: option explicitly remove the current page from it's parent menu. By default all pages with an underscore in the beginning or end of their source file name are hidden

*weight*: is used to alter the order of the links in the navigation menu (the smaller the weight, the earlier the page will be listed)

*title*: is used to set a custom title to menu, default to file name

### Root Item

The site root is now included by default in the navigation. If you'd like it to be hidden, you can set hidden to true in the frontmatter for the index page. Unlike other pages, the children of the hidden index page will still be visible!

Because it seems like the most reasonable semantic HTML, the site root is included at the same level as its children, at the beginning of the list. That doesn't support using weight to sort, but that could change if it becomes desirable.