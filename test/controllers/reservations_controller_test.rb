require 'test_helper'

class ReservationsControllerTest < ActionDispatch::IntegrationTest
  test 'render a list of reservations' do
    get reservations_path

    assert_response :success
    assert_select '.reservation', 2
  end

  test 'render a detail reservation page' do
    get reservation_path(reservations(:reservation_one))

    assert_response :success
    assert_select '.customer_name', 'Adrian'
    assert_select '.customer_email', 'adrian@adrian.com'
  end

  test 'render a new reservation form' do
    get new_reservation_path

    assert_response :success
    assert_select 'form'
  end

  test 'allow to create a new reservation' do
    post reservations_path, params: {
        reservation: {
            hotel_name: 'Test Hotel Name',
            price: 100.50,
            currency: 'EUR',
            customer_name: 'Test Customer Name',
            customer_email: 'Test@Customer.email'
        }
    }

    assert_redirected_to reservations_path
  end
end