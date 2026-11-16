require "test_helper"

class ConferenceSessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
  sign_in users(:one)
  @conference_session = conference_sessions(:one)
end

  test "should get index" do
    get conference_sessions_url
    assert_response :success
  end

  test "should get new" do
    get new_conference_session_url
    assert_response :success
  end

  test "should create conference_session" do
    assert_difference("ConferenceSession.count") do
      post conference_sessions_url, params: { conference_session: { conference_day: @conference_session.conference_day, description: @conference_session.description, title: @conference_session.title, track: @conference_session.track } }
    end

    assert_redirected_to conference_session_url(ConferenceSession.last)
  end

  test "should show conference_session" do
    get conference_session_url(@conference_session)
    assert_response :success
  end

  test "should get edit" do
    get edit_conference_session_url(@conference_session)
    assert_response :success
  end

  test "should update conference_session" do
    patch conference_session_url(@conference_session), params: { conference_session: { conference_day: @conference_session.conference_day, description: @conference_session.description, title: @conference_session.title, track: @conference_session.track } }
    assert_redirected_to conference_session_url(@conference_session)
  end

  test "should destroy conference_session" do
    assert_difference("ConferenceSession.count", -1) do
      delete conference_session_url(@conference_session)
    end

    assert_redirected_to conference_sessions_url
  end
end
