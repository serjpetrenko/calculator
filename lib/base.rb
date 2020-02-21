# frozen_string_literal: true

module Calculator
  class Base
    def self.call(*args)
      service = new(*args)

      service.call if service.respond_to?(:call)
    end

    private

    def call
      raise NotImplementedError
    end
  end
end
