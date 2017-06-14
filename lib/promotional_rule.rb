class PromotionalRule
  attr_reader :type
  attr_reader :threshold
  attr_reader :value

  # Constructor
  # params:
  # - type: discount type (-,*)
  # - threshold: at which point discount should be applied
  # - value: discount value
  def initialize(type, threshold, value)
    @type = type
    @threshold = threshold
    @value = value
  end
end