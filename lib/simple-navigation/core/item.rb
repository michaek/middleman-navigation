module SimpleNavigation
  class Item
    # We want simple-navigation to be forgetful about @selected.
    def selected_with_forgetfulness?
      is_selected = selected_without_forgetfulness?
      @selected = nil
      is_selected
    end
    alias_method_chain :selected?, :forgetfulness
  end
end