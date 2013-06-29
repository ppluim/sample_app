# == Schema Information
#
# Table name: userts
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Usert do
  before { @usert = Usert.new(name: 'Pieter', email: 'pieter@pluim.nl') }

  subject { @usert }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
end
