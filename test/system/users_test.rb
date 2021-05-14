require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "user sign up" do
    visit "/users/new"
    fill_in "Email", with: "kelemenfia@komuves.hu"
    fill_in "Teljes név", with: "Kőműves Kelemen Fia"
    fill_in "Jelszó", with: "ehesen"
    fill_in "Jelszó megerősítése", with: "ehesen"
    click_on "Regisztrálok"

    assert_selector '.alert', text: 'Sikeres regisztráció!'
    assert_selector 'h1', text: 'Kérlek jelentkezz be'
  end
end
