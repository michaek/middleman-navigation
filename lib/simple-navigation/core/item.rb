module Middleman::Navigation

  module Item
    # We want simple-navigation to be forgetful about @selected.
    def selected?
      is_selected = super
      @selected = nil
      is_selected
    end
  end

  ::SimpleNavigation::Item.send(:include, Item)
end
