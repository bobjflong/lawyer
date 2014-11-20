require 'lawyer/rspec'

class FirstContract < Lawyer::Contract
  confirm :ping
end

class SecondContract < Lawyer::Contract
  confirm :pong
end

RSpec.describe "Multiple contracts" do
  include Lawyer::RSpec::ContractDouble

  subject(:multiple_double) { contract_double([FirstContract, SecondContract])  }

  it { should be_a(RSpec::Mocks::Double) }
  it { should respond_to(:ping) }
  it { should respond_to(:pong) }
end
