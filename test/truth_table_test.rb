require File.expand_path( File.join( File.dirname( __FILE__ ), 'test_helper' ) )

class TestTruthTable < Test::Unit::TestCase

  def test_expression_parse
    tt = TruthTable.new("(a && b) || c")
    assert_equal "(a && b) || c", tt.expression
    assert_equal ["a", "b", "c"], tt.variables
    assert_equal 8, tt.num_combinations
  end

  def test_invalide_variable
    assert_raise(TruthTable::InvalidVariableName) do
      TruthTable.new("(a && b) || 3c")
    end
  end

  def test_truth_arrays
    arrays_1 = [[true],
                [false]]
    assert_equal arrays_1, TruthTable.generate_true_false_arrays(1)
    arrays_2 = [[true, true],
                [true, false],
                [false, true],
                [false, false]]
    assert_equal arrays_2, TruthTable.generate_true_false_arrays(2)
    arrays_3 = [[true, true, true],
                [true, true, false],
                [true, false, true],
                [true, false, false],
                [false, true, true],
                [false, true, false],
                [false, false, true],
                [false, false, false]]
    assert_equal arrays_3, TruthTable.generate_true_false_arrays(3)  
  end

  def test_evaluate
    tt = TruthTable.new("(a && b) || c")
    assert_equal false, tt.evaluate([true, false, false])
    assert_equal true, tt.evaluate([false, false, true])
  end

end