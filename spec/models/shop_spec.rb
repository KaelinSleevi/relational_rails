require 'rails_helper'

RSpec.describe Shop do
    it {should have_many :equipment}
end