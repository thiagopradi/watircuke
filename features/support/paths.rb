module NavigationHelpers
  def path_to(page_name)
    case page_name
    
    when /the guides page/i
      @environment + "guides/home"

    when /the watircuke page/i
      @environment + "richdownie/watircuke/tree/master"
            
    # Add more page name => path mappings here
    
    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in features/support/paths.rb"
    end
  end
end

World do 
  extend NavigationHelpers
end
