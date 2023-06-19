module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0
    my_each do |element|
      yield(element, index)
      index += 1
    end
  end

  def my_select
    filtered = []
    my_each do |element|
      passed_filter = yield(element)
      filtered << element if passed_filter
    end
    filtered
  end

  def my_all?
    results = []
    my_each do |element|
      results << yield(element)
    end
    results.uniq == [true]
  end

  def my_any?
    results = []
    my_each do |element|
      results << yield(element)
    end

    results.include?(true)
  end

  def my_none?
    results = []
    my_each do |element|
      results << yield(element)
    end
    results.uniq == [false]
  end

  def my_count
    return count unless block_given?

    count = 0
    my_each do |element|
      result = yield(element)
      count += 1 if result
    end
    count
  end

  def my_map
    result = []
    my_each do |element|
      result << yield(element)
    end
    result
  end

  def my_inject(initial_value)
    my_each do |element|
      initial_value = yield(element, initial_value)
    end
    initial_value
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each(&block)
    each(&block)
  end
end
