class ChoiceState
  attr_reader :outcome, :body, :factor
  def initialize(options)
    @body = options[:body] || ""
    @outcome = options[:outcome]
    @factor = options[:factor]
  end
end
