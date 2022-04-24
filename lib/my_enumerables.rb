module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for i in 0..(length - 1) do
      yield(self[i])
    end
    self
  end

  def my_each_with_index
    for i in 0..(length - 1) do
      yield(self[i], i)
    end
    self
  end

  def my_select
    res = []
    my_each do |e|
      res.push(e) if yield(e)
    end
    res
  end

  def my_all?
    res = true
    my_each do |e|
      res &&= yield(e)
    end
    res
  end

  def my_any?
    res = false
    my_each do |e|
      res ||= yield(e)
    end
    res
  end

  def my_none?
    res = true
    my_each do |e|
      res &&= !yield(e)
    end
    res
  end

  def my_count
    if block_given?
      c = 0
      my_each do |e|
        c += 1 if yield(e)
      end
      c
    else
      length
    end
  end

  def my_map
    res = []
    my_each do |e|
      res.push(yield(e))
    end
    res
  end

  def my_inject(res = 0, &block)
    my_each do |e|
      res = block.call(res, e)
    end
    res
  end
end
