require 'colorize'

class RubyCalculator

  OPERATORS = ['+', '-', '*', '/', 'c']

  def initialize
    puts "*** Ruby Calculator ***".colorize(:color => :green)
    puts "Type 'quit' to end your session".colorize(:color => :yellow)
    first_number
  end

  def first_number
    puts "\nWhat is your first number?"
    @first_number = user_input
    if @first_number == 'quit'
      quit
    else
      @first_number = Float(@first_number)
      operator
    end
  rescue
    puts "Invalid entry. Please try again!".colorize(:color => :red)
    first_number
  end

  def operator
    puts "\n| + | - | * | / | c |\n"
    puts "\nWhat operator do you want to use?\n"
    @user_operator = user_input
    if @user_operator == 'c'
      first_number
    elsif
      @user_operator == 'quit'
      quit
    elsif
      OPERATORS.include?(@user_operator)
      second_number
    else
      puts "Sorry, I don't work with #{@user_operator}. Please pick again.".colorize(:color => :red)
      operator
    end
  end

  def second_number
    puts "\nWhat is your second number?\n"
    @second_number = user_input
    if @second_number == 'quit'
      quit
    else
      @second_number = Float(@second_number)
      calc_total
    end
  rescue
    puts "Invalid entry. Please try again!".colorize(:color => :red)
    second_number
  end

  def calc_total
    puts "Calculating...".colorize(:color => :light_blue)
    puts "\nThe result of #{@first_number} #{@user_operator} #{@second_number} is: "

    case @user_operator
      when '+'
        total = @first_number + @second_number
      when '-'
        total = @first_number - @second_number
      when '*'
        total = @first_number * @second_number
      when '/'
        if @second_number == 0
          puts "Error! Cannot divide by 0. Please try again!".colorize(:color => :red)
          second_number
        else
          total = @first_number / @second_number
        end
    end
    puts total
    @first_number = total
    operator
  end

  def quit
    puts "Thanks for using the Ruby Calculator! See you next time!".colorize(:color => :green)
    exit
  end

  def user_input
    print "> "
    gets.strip
  end

RubyCalculator.new
end
