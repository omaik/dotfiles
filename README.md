# My dotfiles

```ruby
"length".length # => 6
1.even? # => false
nil.nil? # => true
true.true? # => true
String.class # => Class
Class.class # => Class
```


```ruby
class A
  def hello_world
    puts 'Hello world'
  end
end

method_hello_world = A.new.method(:hello_world)
methor_hello_world.arity # => 0
method_hello_world.source_location # => "path/to/file.rb:line"
```
