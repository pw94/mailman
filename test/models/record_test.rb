require 'test_helper'

class RecordTest < ActiveSupport::TestCase
  test "records can be duplicated" do
    duplicate_record = records(:one).dup
    assert duplicate_record.valid?
  end
end
