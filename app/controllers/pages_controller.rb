class PagesController < ApplicationController
  def home
    @title = 'Home'
    @base_title = 'Headache-LINE'
  end
  
  def contact
    @title = 'Contact'
    @base_title = 'Headache-LINE'
  end
  
  def about
    @title = 'About'
    @base_title = 'Headache-LINE'
  end
  
  def help
    @title = 'Help'
    @base_title = 'Headache-LINE'
  end
end
