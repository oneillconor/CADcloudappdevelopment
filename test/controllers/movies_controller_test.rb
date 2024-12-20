require "test_helper"

class MoviesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movie = movies(:one)
  end

  test "should get index" do
    get movies_url
    assert_response :success
  end

  test "search with ransack" do
    get movies_url+"?q%5Btitle_or_director_or_genere_or_releaseyear_cont%5D=comedy&commit=Search"
    assert_response :success
  end
  
  test "search and find with ransack" do
    get movies_url+"?q%5Btitle_or_director_or_genere_or_releaseyear_cont%5D=comedy&commit=Search"
    assert_response :success
  end

  test "should get new" do
    get new_movie_url
    assert_response :success
  end

  test "should create movie" do
    assert_difference("Movie.count") do
      post movies_url, params: { movie: { director: @movie.director, genere: @movie.genere, releaseyear: @movie.releaseyear, stock: @movie.stock, title: @movie.title } }
    end

    assert_redirected_to movie_url(Movie.last)
  end

  test "should show movie" do
    get movie_url(@movie)
    assert_response :success
  end

  test "should get edit" do
    get edit_movie_url(@movie)
    assert_response :success
  end

  test "should update movie" do
    patch movie_url(@movie), params: { movie: { director: @movie.director, genere: @movie.genere, releaseyear: @movie.releaseyear, stock: @movie.stock, title: @movie.title } }
    assert_redirected_to movie_url(@movie)
  end

  test "should destroy movie" do
    assert_difference("Movie.count", -1) do
      delete movie_url(@movie)
    end

    assert_redirected_to movies_url
  end
end
