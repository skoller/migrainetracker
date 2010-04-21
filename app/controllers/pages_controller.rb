class PagesController < ApplicationController
  def home
    @title = 'Home'
    @base_title = 'HeadacheTRACKER'
  end
  
  def contact
    @title = 'Contact'
    @base_title = 'HeadacheTRACKER'
  end
  
  def about
    @title = 'About'
    @base_title = 'HeadacheTRACKER'
  end
  
  def help
    @title = 'Help'
    @base_title = 'HeadacheTRACKER'
  end
end
