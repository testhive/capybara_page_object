require_relative '../spec/spec_helper.rb'
require_relative '../lib/functions.rb'
require_relative 'modules.rb'

class BasePage
  attr_accessor :url
  attr_accessor :title

  def visit_self
    visit @url
  end

  def verify_page_load
    expect(page.current_url).to include @url
    expect(page.title).to include @title
  end
end

class HomePage < BasePage
  def initialize
    @url = 'https://www.apple.com/uk/'
    @title = 'Apple'
  end
end

class MacPage < BasePage
  attr_accessor :category_nav
  def initialize
    @url = 'https://www.apple.com/uk/mac/'
    @title = 'Mac'
    @category_nav = CategoryNavigation.new ['MacBook Air', 'MacBook Pro', 'iMac', 'Mac Pro', 'Mac mini', 'Accessories', 'Compare']
  end
  def verify_categories_on_page
    @category_nav.verify_categories
  end
end

class IpadPage < BasePage
  attr_accessor :category_nav
  def initialize
    @url = 'https://www.apple.com/uk/ipad/'
    @title = 'iPad'
    @category_nav = CategoryNavigation.new ['iPad Pro', 'iPad', 'iPad Air', 'iPad mini', 'Accessories', 'Compare']
  end
  def verify_categories_on_page
    @category_nav.verify_categories
  end
end

class SupportPage < BasePage
  def initialize
    @search_field_selector = '#as-search-input'
    @results_area_selector = '.SearchResults > .SearchResultsList'
    @result_item_selector = '.SearchResult'
    @url = 'https://support.apple.com/'
    @title = 'Official Apple Support'
  end

  def search_with_results term, result_count=nil
    do_search(term)

    results = results_area
    first =results.find(@result_item_selector, match: :first)
    expect(first['class']).not_to include 'SearchResult--noResults'
    count = results.all(@result_item_selector).size
    expect(count).to be > 0
    if result_count
      expect(result_count).to eq count
    end
  end

  def search_with_no_results term
    do_search(term)

    results = results_area
    first = results.find(@result_item_selector, match: :first)
    expect(first['class']).to include 'SearchResult--noResults'
  end

  private

  def do_search(term)
    field = find(@search_field_selector)
    field.set term
    field.native.send_keys :return
  end

  def results_area
    find(@results_area_selector)
  end


end
