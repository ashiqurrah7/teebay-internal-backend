module CustomTokenResponse
    def body
        userid = @token.resource_owner_id
        user = User.find_by id: userid
      additional_data = {
        'user' => user# you have an access to the @token object
        # any other data
      }
      # call original `#body` method and merge its result with the additional data hash
      super.merge(additional_data)
    end
  end