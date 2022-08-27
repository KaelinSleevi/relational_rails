require 'rails_helper'

RSpec.describe Equipment, type: :model do
    it {should belong_to :shop}
end