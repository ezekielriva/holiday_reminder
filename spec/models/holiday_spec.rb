require "spec_helper"

describe Holiday do
  describe "Associations" do
    it { should belong_to :user }
  end

  describe "Validations" do
    it { should validate_presence_of    :name }    
    it { should validate_presence_of    :date }    
    it { should validate_uniqueness_of  :date }    
  end
end
