require 'spec_helper'

describe User do
  describe "Associations" do
    it { should have_many :clients }
  end

  describe "Validations" do
    it { should validate_presence_of :email }
  end
end
