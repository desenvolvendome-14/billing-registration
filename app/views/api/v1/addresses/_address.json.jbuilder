json.extract! address, :id, :zip_code, :state, :city, :district, :complement, :street, :house_number,
              :company_id, :participant_id
json.url api_v1_address_url(address, format: :json)
