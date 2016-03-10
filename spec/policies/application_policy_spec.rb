require_relative "./../../app/policies/application_policy"

describe ApplicationPolicy do

  describe "#new?" do
    it "returns false" do
      user = double("user")
      policy = ApplicationPolicy.new(user, nil)

      expect(policy.new?).to eq(false)
    end
  end

  describe "#create?" do
    it "returns false" do
      user = double("user")
      policy = ApplicationPolicy.new(user, nil)

      expect(policy.create?).to eq(false)
    end
  end

  describe "#index?" do
    it "returns false" do
      user = double("user")
      policy = ApplicationPolicy.new(user, nil)

      expect(policy.index?).to eq(false)
    end
  end

  describe "#show?" do
    it "returns false" do
      user = double("user")
      policy = ApplicationPolicy.new(user, nil)

      expect(policy.show?).to eq(false)
    end
  end

  describe "#edit?" do
    it "returns false" do
      user = double("user")
      policy = ApplicationPolicy.new(user, nil)

      expect(policy.edit?).to eq(false)
    end
  end

  describe "#destroy?" do
    it "returns false" do
      user = double("user")
      policy = ApplicationPolicy.new(user, nil)

      expect(policy.destroy?).to eq(false)
    end
  end
end
