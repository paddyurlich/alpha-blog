require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
    
    
    def setup
        @category = Category.create(name: "sports")  
    end

    test "should get categories index" do
        get :index
        assert_response :success
    end
    
    test "should get new" do
        get :new
        assert_response :success
    end
    
    test "should get show" do
        #remember that we actually need a category id to this test to pass ie an article must exists first; so 
        #we create a setup method and get the category id from the hash @category
        get(:show, {'id' => @category.id})
        assert_response :success
    end
    
    

    
    
end

