module Api
  module V1
    class AddressesController < ApplicationController
      def index
        @addresses = Address.all
      end
    end
   end
end
