require_relative '../spec/spec_helper.rb'
require_relative '../lib/functions.rb'

class CategoryNavigation
  attr_accessor :categories
  attr_reader :module_selector

  def initialize cat_list=nil
    @module_selector = '#chapternav'
    @categories = cat_list
  end

  def verify_categories
    area = find @module_selector
    @categories.each { |cat|
      expect(area).to have_selector('.chapternav-item', text: cat)
    }
  end
end