class ChainOfResponsibility
  def initialize(chain)
    @chain = chain
  end

  def handle(request)
    @chain.each do |handler|
      handler.call(request)
      break if request.handled
    end
  end
end

class Request
  attr_reader :handled

  def initialize
    @handled = false
  end

  def handle
    @handled = true
  end
end

class Handler1
  def call(request)
    puts "Handler1 request"
  end
end

class Handler2
  def call(request)
    puts "Handler2 request"
  end
end

class Handler3
  def call(request)
    puts "Handler3 request"
  end
end

request = Request.new
chain = ChainOfResponsibility.new([Handler1.new, Handler2.new, Handler3.new])
chain.handle(request)
puts "Request handled: #{request.handled}"