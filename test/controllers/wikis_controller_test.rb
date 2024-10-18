require "test_helper"

class WikisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wiki = wikis(:one)
  end

  test "should get index" do
    get wikis_url, as: :json
    assert_response :success
  end

  test "should create wiki" do
    assert_difference("Wiki.count") do
      post wikis_url, params: { wiki: { content: @wiki.content, title: @wiki.title } }, as: :json
    end

    assert_response :created
  end

  test "should show wiki" do
    get wiki_url(@wiki), as: :json
    assert_response :success
  end

  test "should update wiki" do
    patch wiki_url(@wiki), params: { wiki: { content: @wiki.content, title: @wiki.title } }, as: :json
    assert_response :success
  end

  test "should destroy wiki" do
    assert_difference("Wiki.count", -1) do
      delete wiki_url(@wiki), as: :json
    end

    assert_response :no_content
  end
end
