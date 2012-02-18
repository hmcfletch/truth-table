# encoding: utf-8

class TruthTable

  VERSION = "0.1"

  class InvalidVariableName < Exception; end

  class Evaluator

    def create_method( name, &block )
        self.class.send( :define_method, name, &block )
    end

    def create_attr( name )
        create_method( name.to_sym ) { 
            instance_variable_get( "@" + name.to_s ) 
        }
    end

    def initialize(expression, variables)
      @expression = expression
      variables.each_pair do |k,v|
        instance_variable_set( "@" + k.to_s, v)
        create_attr(k)
      end
    end

    def evaluate
      eval(@expression)
    end
  
  end

  attr_reader :expression
  attr_reader :variables

  def initialize(expression)
    @expression = expression
    @working_exp = expression.dup
    @working_exp.gsub!(' xor ', ' ^ ')
    @variables = ['(', ')', 'and', 'or', '&&' , '||', '!', 'not', '^'].inject(@working_exp) do |exp, op|
      exp.gsub(op, ' ')
    end.gsub(/\s+/, ' ').split(' ').uniq.reject { |v| ["true", "false"].include?(v) }
    @num_vars = @variables.length
    @variables.each do |v|
      raise InvalidVariableName unless v =~ /^[a-z_][a-zA-Z_0-9]*$/
    end
  end

  def self.generate_true_false_arrays(num)
    true_falses = []
    val = 2 ** num
    (0...val).each do |i|
      k = val - 1 - i
      a = Array.new(num)
      for j in (0...num)
        a[j] = k[num - 1 - j] == 1
      end
      true_falses << a
    end
    true_falses
  end

  def num_combinations
    2 ** @num_vars
  end

  def evaluate(array)
    Evaluator.new(@working_exp, Hash[@variables.zip(array)]).evaluate
  end

  def table_string
    lines = []

    temp = @variables.dup
    temp << @expression
    lines << " #{temp.join(" | ")} "

    lines << @variables.inject([]) do |a, v|
      a.concat(["-" * (v.length + 2)])
    end.concat(["-" * (@expression.length + 2)]).join("┼")

    self.class.generate_true_false_arrays(@num_vars).each do |array|
      vals = []
      (0...array.length).each do |i|
        len = @variables[i].length
        str = ' ' * len
        str[(len/2)] = (array[i] ? "T" : "F")
        vals << str
      end
      vals << "#{' ' * ((@expression.length / 2) - 1)}#{(evaluate(array) ? 'T' : 'F')}"
      lines << " #{vals.join(" | ")} "
    end

    lines.join("\n")
  end

  def inspect
    "Number Variables: #{@num_vars}, Number Combinations: #{2 ** @num_vars}, Variables: #{@variables.inspect}, Expression: '#{@expression}'"
  end

end
