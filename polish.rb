class Polish
  OPERATORS = ['+', '-', '*']
  # warning: assumes that the numbers are one digit, belonging to range Array(-9..9)
  def initialize(expression)
    @expression = expression.gsub(/\s+/, "") # TODO rewrite when used for longer numbers
  end

  def simplify
    simplified = ""
    saved_operator = ""
    argument_1 = ""
    argument_2 = ""

    @expression.split('').each do |char|
      char_used = false
      if operator?(char)
        if saved_operator.empty?
          saved_operator = char
        else
          simplified << saved_operator
          simplified << argument_1
          simplified << argument_2
          saved_operator, argument_1, argument_2 = "", "", ""
          saved_operator = char
        end
        next
      end
      if variable?(char)
        simplified << saved_operator
        simplified << argument_1
        simplified << argument_2
        saved_operator, argument_1, argument_2 = "", "", ""
      end
      if !saved_operator.empty? && (argument_1.empty? || argument_2.empty?)
        argument_1.empty? ? argument_1 = char : argument_2 = char
        char_used = true
      end
      if can_evaluate(saved_operator, argument_1, argument_2)
        simplified << evaluate_expression(saved_operator, argument_1, argument_2)
        saved_operator, argument_1, argument_2 = "", "", ""
      else
        simplified << char unless char_used
      end
    end
    simplified
  end

  private

  def can_evaluate(operator, argument_1, argument_2)
    !operator.empty? && !argument_1.empty? && !argument_2.empty?
  end

  def evaluate_expression(operator, argument_1, argument_2)
    String(eval("#{argument_1}#{operator}#{argument_2}"))
  end

  def operator?(char)
    OPERATORS.include?(char)
  end

  def variable?(char)
    char =~ /[[:alpha:]]/
  end
end
