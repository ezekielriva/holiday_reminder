require 'spec_helper'

describe Client do
  describe "Associations" do
    it { should belong_to :user }
  end

  describe "Validations" do
    it { should validate_presence_of    :name  }
    it { should validate_presence_of    :email }
    it { should validate_uniqueness_of  :email }
  end
end
