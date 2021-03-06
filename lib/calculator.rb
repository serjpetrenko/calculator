# frozen_string_literal: true

require 'calculator/version'
require 'base'

module Calculator
  class Comission < Base
    COMISSION_AMOUNT = 1.0
    COMISSION_PERCENT = 20
    ONE_HUNDRED_PERCENT = 100.0

    private_constant :COMISSION_AMOUNT, :COMISSION_PERCENT, :ONE_HUNDRED_PERCENT

    def initialize(amount:, comission_amount: COMISSION_AMOUNT, comission_percent: COMISSION_PERCENT, comission_entity: nil)
      @amount = amount
      @comission_amount = comission_amount
      @comission_percent = comission_percent / ONE_HUNDRED_PERCENT
      @comission_entity = comission_entity
    end

    def call
      [netto_amount, comission_total]
    end

    private

    attr_reader :amount, :comission_percent, :comission_entity

    def comission_total
      (amount * comission_percent + comission_amount).floor(2)
    end

    def netto_amount
      (amount - comission_total).floor(2)
    end

    def comission_amount
      comission_entity ? comission_entity.comission_amount : @comission_amount
    end
  end
end
