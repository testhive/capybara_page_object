require_relative '../components/pages'

describe HomePage do
  describe "Go to mainpage" do
    context "Verify page attributes" do
      it "Should make sure the page setup is correct" do
        main_page = HomePage.new
        main_page.visit_self
        main_page.verify_page_load
      end
    end
  end
end

describe MacPage do
  describe "Verify Mac page contents" do
    context "When i visit mac page" do
      it "should contain the correct category options on top of the page" do
        page = MacPage.new
        page.visit_self
        page.verify_page_load
        page.verify_categories_on_page
      end
    end
  end
end

describe IpadPage do
  describe "Verify iPad page contents" do
    context "When i visit iPad page" do
      it "should contain the correct category options on top of the page" do
        page = IpadPage.new
        page.visit_self
        page.verify_page_load
        page.verify_categories_on_page
      end
    end
  end
end

describe SupportPage do
  describe "Search for a term" do
    context "When a search is performed with a term that produces results" do
      it "should show some results" do
        page=SupportPage.new
        page.visit_self
        page.verify_page_load
        page.search_with_results 'ipod'
      end
    end

    context "When a search is performed with a term that doesn't produce results" do
      it "should show no results" do
        page=SupportPage.new
        page.visit_self
        page.verify_page_load
        page.search_with_no_results 'fsafgfdgdfgdfgsdfg'
      end
    end
  end
end