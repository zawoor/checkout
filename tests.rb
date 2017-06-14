$LOAD_PATH << File.dirname(__FILE__)

require 'lib/item'
require 'lib/checkout'
require 'lib/promotional_rule'
require 'lib/promotional_rule_product'
require 'lib/promotional_rule_total'

require 'spec/test_checkout'
require 'spec/test_promotional_rule_product'
require 'spec/test_promotional_rule_total'