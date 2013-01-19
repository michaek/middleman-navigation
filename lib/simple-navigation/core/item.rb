module SimpleNavigation
  class Item
    # We want simple-navigation to be forgetful about @selected.
    def selected?
      selected_by_config? || selected_by_subnav? || selected_by_condition?
    end
  end
end