require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  test "Going to /new gives us a new random grid to play with" do
    visit new_url
    assert test: "New game"
    assert_selector "li", count: 10
  end

  # You can fill the form with a random word, click the play button, and get a message that the word is not in the grid.
  test "sdfs" do
    visit new_url
    find('#list').text = "<li class='btn btn-primary'> A</li>
      <li class='btn btn-primary'> B</li>
      <li class='btn btn-primary'> C</li>
      <li class='btn btn-primary'> D</li>
      <li class='btn btn-primary'> E</li>
      <li class='btn btn-primary'> F</li>
      <li class='btn btn-primary'> G</li>
      <li class='btn btn-primary'> H</li>
      <li class='btn btn-primary'> I</li>
      <li class='btn btn-primary'> J</li>"

    fill_in "word", with: "Hello"
    click_on "Submit"
    assert test: "You used letters that were not in the grid"
    take_screenshot
  end
  # You can fill the form with a one-letter consonant word, click play, and get a message it's not a valid English word

  # You can fill the form with a valid English word (that's hard because there is randomness!), click play and get a "Congratulations" message
end
