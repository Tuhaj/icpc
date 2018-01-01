class Polish
  OPERATORS = ['+', '-', '*']
  # warning: assumes that the numbers are one digit, belonging to range Array(-9..9)
  def initialize(expression)
    @expression = expression.gsub(/\s+/, "") # TODO rewrite when used for longer numbers
    @memo = empty_memo
  end

  def simplify
    simplified = ""
    @expression.split('').each do |char|
      if operator?(char)
        if !@memo[:saved_operator].empty?
          simplified << concat_memo
          clean_memo
        end
        @memo[:saved_operator] = char
        next # if the char is an operator continue the loop from next char
      end
      if variable?(char)
        simplified << concat_memo
        clean_memo
      end
      if !@memo[:saved_operator].empty? && has_empty_argument
        @memo[:argument_1].empty? ? @memo[:argument_1] = char : @memo[:argument_2] = char
        if can_evaluate
          simplified << evaluated_expression
          clean_memo
        end
      else
        simplified << char
      end
    end
    simplified
  end

  private

  def empty_memo
    {
      saved_operator: '',
      argument_1: '',
      argument_2: ''
    }
  end

  def clean_memo
    @memo = empty_memo
  end

  def can_evaluate
    !@memo.values.any?(&:empty?)
  end

  def concat_memo
    @memo.values.join('')
  end

  def has_empty_argument
    @memo[:argument_1].empty? || @memo[:argument_2].empty?
  end

  def evaluated_expression
    exp = @memo[:argument_1] + @memo[:saved_operator] + @memo[:argument_2]
    String(eval(exp))
  end

  def operator?(char)
    OPERATORS.include?(char)
  end

  def variable?(char)
    char =~ /[[:alpha:]]/
  end
end
