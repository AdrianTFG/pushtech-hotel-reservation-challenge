require 'test_helper'

class ReservationsControllerTest < ActionDispatch::IntegrationTest

  setup do
    login
  end

  test 'render a list of reservations' do
    get reservations_path

    assert_response :success
    assert_select '.reservation', 2
  end

  test 'render a detail reservation page' do
    get reservation_path(reservations(:reservation_one))

    assert_response :success
    assert_select '.customer_name', 'Customer name: Adrian'
    assert_select '.customer_email', 'Customer email: adrian@adrian.com'
    assert_select '.room_name', 'Room 1'
    assert_select '.price', 'Price: 150.0€'
    assert_select '.entry_date', 'Entry date: 2022-08-18'
    assert_select '.departure_date', 'Departure date: 2022-08-19'
  end

  test 'render a new reservation form' do
    get new_reservation_path

    assert_response :success
    assert_select 'form'
  end

  test 'allow to create a new reservation' do
    post reservations_path, params: {
        reservation: {
            room_id: rooms(:room_1).id,
            entry_date: '2022-08-18',
            departure_date: '2022-08-19',
            customer_name: 'Test Customer Name',
            customer_email: 'Test@Customer.email'
        }
    }

    assert_redirected_to reservations_path
    assert_equal flash[:notice], 'Reservation created correctly'
  end

  test 'does not allow to create a new reservation with empty fields' do
    post reservations_path, params: {
        reservation: {
            room_id: nil,
            entry_date: '2022-08-18',
            departure_date: '2022-08-18',
            customer_name: 'Test Customer Name',
            customer_email: 'Test@Customer.email'
        }
    }
    assert_response :unprocessable_entity
  end

  test 'render an edit reservation form' do
    get edit_reservation_path(reservations(:reservation_one))

    assert_response :success
    assert_select 'form'
  end

  test 'allow to update a reservation' do
    patch reservation_path(reservations(:reservation_one)), params: {
        reservation: {
            customer_name: 'Adrian Updated'
        }
    }

    assert_redirected_to reservations_path
    assert_equal flash[:notice], 'Reservation updated correctly'
  end

  test 'does not allow to update a reservation' do
    patch reservation_path(reservations(:reservation_one)), params: {
        reservation: {
            customer_email: nil
        }
    }

    assert_response :unprocessable_entity
  end

  test 'can delete reservations' do
    assert_difference('Reservation.count', -1) do
      delete reservation_path(reservations(:reservation_one))
    end

    assert_redirected_to reservations_path
    assert_equal flash[:notice], 'Reservation deleted correctly'

  end




end