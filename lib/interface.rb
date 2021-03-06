require_relative 'prime.rb'
require_relative 'multiplication_table.rb'
require 'terminal-table'

# Interface Class to properly handle output
class Interface
  def self.help
    puts 'Welcome to the Primes Multiplication Table Help Menu!'
    puts "Use '-s' to set the amount of primes"
    puts 'Example: ruby runner.rb -s 15'
  end

  def self.size(num_string)
    if num_string.is_i?
      table(num_string.to_i)
    else
      puts num_string + ' is not a number'
      puts 'Please enter a valid number'
    end
  end

  def self.table(num = 10)
    primes = Prime.first(num)
    puts Terminal::Table.new rows: MultiplicationTable.new(primes, primes).table
  end
end

# Add is_i? method to the String Class
class String
  def is_i?
    /\A[-+]?\d+\z/ === self
  end
end
