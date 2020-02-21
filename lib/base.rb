# frozen_string_literal: true

module Calculator
  class Base
    def self.call(*args)
      klass = new(*args)

      klass.call if klass.respond_to?(:call)
    end

    private

    def call
      raise NotImplementedError
    end
  end
end
